require 'rails_helper'

RSpec.describe SurvivorsController, type: :controller do
  describe 'GET #index' do
    it 'populates an array of survivors' do
      survivor = create(:survivor)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    xit 'assigns the requested survivor to @survivor' do
      survivor = create(:survivor)
      get survivors_path(1)
      expect(assigns(:survivor)).to eq(survivor)
    end
  end

  describe 'GET #report_infected' do
    it 'increments reports for requested survivor'
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      xit 'creates a new survivor' do
        expect{
          post :create, survivor: create(:survivor)
        }.to change(Survivor, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      xit 'does not save the survivor' do
        expect{
          post :create, survivor: create(:invalid_survivor)
        }.to_not change(Survivor, :count)
      end
    end
  end

  describe 'PATCH #update' do

  end
end
