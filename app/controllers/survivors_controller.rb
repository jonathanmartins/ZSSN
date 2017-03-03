class SurvivorsController < ApplicationController
  before_action :set_survivor, only: [:show, :update, :report]

  def index
    @survivors = Survivor.all
    json_response(@survivors)
  end

  def create
    @survivor = Survivor.create!(survivor_params)
    json_response(@survivor, :created)
  end

  def update
    if params.has_key?(:latitude) && params.has_key?(:longitude)
      @survivor.update(latitude: params[:latitude], longitude: params[:longitude])
      head :no_content
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
  end

  private

  def set_survivor
    @survivor = Survivor.find(params[:id])
  end

  def survivor_params
    params.permit(:name, :age, :gender, :latitude, :longitude, :inventory)
  end
end
