require 'rails_helper'

RSpec.describe TradesController, type: :routing do
  describe 'routing' do
    it 'routes to #trade_with' do
      expect(post: '/trade/1/with/2').to route_to('trades#trade_with', survivor_one_id: '1', survivor_two_id: '2')
    end
  end
end
