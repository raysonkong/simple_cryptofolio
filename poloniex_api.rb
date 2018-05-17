require 'json'
require 'faraday'

class BitcoinPriceError < StandardError
end

def get_ticker_price(currency_pair)
 # receives currency pair and returns price for that pair
 # BTC_BCN as input	 
 # did some computations
  response = Faraday.get "https://poloniex.com/public?command=returnTicker"
  market_data_hash = JSON.parse(response.body)
  

  if !market_data_hash.has_key?(currency_pair)
    raise BitcoinPriceError
  end
  currency_data_hash = market_data_hash[currency_pair]
  currency_data_ask = currency_data_hash["lowestAsk"]
  currency_data_bid = currency_data_hash["highestBid"]
  currency_data_last = currency_data_hash["last"]
  {"ask" => currency_data_ask, "bid" => currency_data_bid,"last" => currency_data_last}
  
end
