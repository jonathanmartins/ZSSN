require 'rails_helper'

RSpec.describe TradesController, type: :controller do

  describe "POST /trade_with" do
    xit "returns http success" do
      post :trade_with
      expect(response).to have_http_status(:success)
    end
  end

end
