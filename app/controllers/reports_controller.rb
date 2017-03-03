class ReportsController < ApplicationController
  before_action :survivors, only: [:infected_survivors, :uninfected_survivors]

  def infected_survivors
    @infecteds = Survivor.infected.count
    json_response(percentage(@infecteds, @survivors))
  end

  def uninfected_survivors
    @uninfecteds = Survivor.uninfected.count
    json_response(percentage(@uninfecteds, @survivors))
  end

  def average_resources

  end

  def points_lost

  end

  private

  def survivors
    @survivors = Survivor.all.count
  end
end
