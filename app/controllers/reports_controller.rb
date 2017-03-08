class ReportsController < ApplicationController
  def infected_survivors
    @infecteds = Survivor.infected
    json_response(@infecteds)
  end

  def uninfected_survivors
    @uninfecteds = Survivor.uninfected
    json_response(@uninfecteds)
  end

  def average_resources

  end

  def points_lost

  end
end
