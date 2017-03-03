require 'rails_helper'

RSpec.describe 'Survivors API', type: :request do
  # Initialize test data
  let!(:survivors) { create_list(:survivor, 10) }
  let(:survivor_id) { survivors.first.id }

  # Test suite for GET /survivors
  describe 'GET /survivors' do
    # make HTTP get request before each example
    before { get '/survivors' }

    it 'returns survivors' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /survivors/:id
  describe 'GET /survivors/:id' do
    before { get "/survivors/#{survivor_id}" }

    context 'when the record exists' do
      it 'returns the survivor' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(survivor_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:survivor_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Survivor/)
      end
    end
  end

  # Test suite for POST /survivors
  describe 'POST /survivors' do
    # valid attributes
    let(:valid_attributes) { { name: 'Jonh', age: 25, gender: :male, infected: false,
                               latitude: 38.898556, longitude: -77.037852 } }

    context 'when the request is valid' do
      before { post '/survivors', params: valid_attributes }

      it 'creates a survivor' do
        expect(json['name']).to eq('Jonh')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/survivors', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank, Age can't be blank, Gender can't be blank, Latitude can't be blank, Longitude can't be blank/)
      end
    end
  end

  # Test suite for PUT /survivors/:id
  describe 'PUT /survivors/:id' do
    let(:valid_attributes) { { latitude: 38.898556, longitude: -77.037852 } }

    context 'when the record exists' do
      before { put "/survivors/#{survivor_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
