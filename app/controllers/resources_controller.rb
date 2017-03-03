class ResourcesController < ApplicationController
  before_action :set_survivor
  before_action :set_resource, only: :show

  def index
    unless @survivor.infected
      json_response(@survivor.resources)
    end
  end

  def create
    unless @survivor.infected
      @survivor.resources.create!(resource_params)
      json_response(@survivor, :created)
    end
  end

  def show
    unless @survivor.infected
      json_response(@resource)
    end
  end

  private

  def resource_params
    params.permit(:name, :quantity)
  end

  def set_survivor
    @survivor = Survivor.find(params[:survivor_id])
  end

  def set_resource
    @resource = @survivor.resources.find(params[:id]) if @survivor
  end

end
