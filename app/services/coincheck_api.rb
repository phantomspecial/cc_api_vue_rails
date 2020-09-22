# frozen_string_literal: true

class CoincheckApi < CoincheckClient
  KEY = Rails.application.credentials.coincheck_api[:access_key]
  SECRET = Rails.application.credentials.coincheck_api[:secret_access_key]
  PAIRS = {
      BTC:  'btc_jpy' ,
      ETH:  'eth_jpy' ,
      ETC:  'etc_jpy' ,
      LSK:  'lsk_jpy' ,
      FCT:  'fct_jpy' ,
      XRP:  'xrp_jpy' ,
      XEM:  'xem_jpy' ,
      LTC:  'ltc_jpy' ,
      BCH:  'bch_jpy' ,
      MONA: 'mona_jpy',
      XLM:  'xlm_jpy' ,
      QTUM: 'qtum_jpy',
      BAT:  'bat_jpy' ,
      IOST: 'iost_jpy'
  }.freeze

  def self.new
    super(KEY, SECRET)
  end

  def read_balance
    json_parse(super)
  end

  def read_transactions
    json_parse(super)
  end

  def read_rates
    rates = {}
    PAIRS.each do |_, pair_v|
      rates["#{pair_v}_rate"] = json_parse(read_rate(pair: pair_v))['rate']
      sleep(0.01)
    end
    rates
  end

  private

  def json_parse(response)
    JSON.parse(response.body)
  end
end
