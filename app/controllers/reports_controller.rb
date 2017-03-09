class ReportsController < ApplicationController
  def infected_survivors
    @infecteds = Survivor.infected_survivors
    json_response(@infecteds)
  end

  def uninfected_survivors
    @uninfecteds = Survivor.uninfected_survivors
    json_response(@uninfecteds)
  end

  def average_resources
    @average = Survivor.average_resources
    json_response(@average)
  end

  def points_lost
    @points_lost = Survivor.points_lost
    json_response(@points_lost)
  end
end
