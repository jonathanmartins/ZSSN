require 'rails_helper'

RSpec.describe 'Resources API', type: :request do
  # Initialize test data
  let!(:survivor) { create(:survivor) }
  let!(:resources) { create_list(:resource, 10, survivor_id: survivor.id) }
  let(:survivor_id) { survivor.id }
  let(:id) { resources.first.id }

  # Test suite for GET /survivors/:survivor_id/resources
  describe 'GET /survivors/:survivor_id/resources' do
    before { get "/survivors/#{survivor_id}/resources" }

    context 'when survivor exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all survivor resources' do
        expect(json.size).to eq(10)
      end
    end

    context 'when survivor does not exists' do
      let(:survivor_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns not found message' do
        expect(response.body).to match(/Couldn't find Survivor/)
      end
    end
  end

  # Test suite for GET /survivors/:survivor_id/resources/:id
  describe 'GET /survivors/:survivor_id/resources/:id' do
    before { get "/survivors/#{survivor_id}/resources/#{id}" }

    context 'when survivor resource exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the resource' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when survivor resource does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Resource/)
      end
    end
  end

  # Test suite for POST /survivors/:survivor_id/resources
  describe 'POST /survivors/:survivor_id/resources' do
    let(:valid_attributes) { { name: :water, quantity: 2 } }

    context 'when request attributes are valid' do
      before { post "/survivors/#{survivor_id}/resources", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when parameters are missing' do
      before { post "/survivors/#{survivor_id}/resources", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Name can't be blank, Quantity can't be blank/)
      end
    end
  end
end
