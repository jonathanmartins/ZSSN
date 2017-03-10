class SurvivorsController < ApplicationController
  before_action :set_survivor, only: [:show, :update, :report_infected]

  def index
    @survivors = Survivor.all
    json_response(@survivors)
  end

  def create
    @survivor = Survivor.new(survivor_params)
    @survivor.inventory[:water] = params[:inventory][:water] if params[:inventory][:water]
    @survivor.inventory[:food] = params[:inventory][:food] if params[:inventory][:food]
    @survivor.inventory[:medication] = params[:inventory][:medication] if params[:inventory][:medication]
    @survivor.inventory[:ammunition] = params[:inventory][:ammunition] if params[:inventory][:ammunition]
    @survivor.save!

    json_response(@survivor, :created)
  end

  def update
    if params.has_key?(:latitude) && params.has_key?(:longitude)
      @survivor.update(latitude: params[:latitude], longitude: params[:longitude])
      json_response(@survivor)
    end
  end

  def show
    json_response(@survivor)
  end

  def report_infected
    @survivor.increment!(:infection_report)
    if @survivor.infection_report > 2
      @survivor.infected = true
    end
    @survivor.save
    json_response(@survivor)
  end

  private

  def set_survivor
    @survivor = Survivor.find(params[:id])
  end

  def survivor_params
    params.permit(:name, :age, :gender, :latitude, :longitude)
  end
end
