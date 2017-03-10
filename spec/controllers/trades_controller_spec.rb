require 'rails_helper'

RSpec.describe TradesController, type: :controller do

  describe "GET #trade" do
    xit "returns http success" do
      get :trade_with
      expect(response).to have_http_status(:success)
    end
  end

end
