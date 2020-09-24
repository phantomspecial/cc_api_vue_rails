class Api::V1::AssetsController < ApplicationController
  def index
    cc = CoincheckApi.new
    render json: { balance: cc.read_balance, rates: cc.read_rates, time: Time.current }, status: :ok
  end
end
