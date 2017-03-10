require 'rails_helper'

RSpec.describe TradesController, type: :controller do

  describe "GET #trade" do
    it "returns http success" do
      get :trade
      expect(response).to have_http_status(:success)
    end
  end

end
