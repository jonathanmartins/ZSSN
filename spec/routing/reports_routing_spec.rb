require 'rails_helper'

RSpec.describe ReportsController, type: :routing do
  describe 'routing' do
    it 'routes to #infected_survivors' do
      expect(get: '/infected_survivors').to route_to('reports#infected_survivors')
    end

    it 'routes to #uninfected_survivors' do
      expect(get: '/uninfected_survivors').to route_to('reports#uninfected_survivors')
    end

    it 'routes to #points_lost' do
      expect(get: '/points_lost').to route_to('reports#points_lost')
    end

    it 'routes to #average_resources' do
      expect(get: '/average_resources').to route_to('reports#average_resources')
    end
  end
end
