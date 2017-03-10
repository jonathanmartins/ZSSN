class TradesController < ApplicationController
  def trade_with
    survivor_one = Survivor.find(params[:survivor_one_id])
    survivor_two = Survivor.find(params[:survivor_two_id])

    @trade = Trade.trade_resources(survivor_one, survivor_two, params[:offered], params[:wanted])
    json_response(@trade)
  end

  private

  def trade_params
    params.permit(offered: {}, wanted: {})
  end
end
