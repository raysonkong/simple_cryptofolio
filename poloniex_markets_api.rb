require 'json'
require 'faraday'

class MarketError < StandardError
end

def get_markets
 # returns all poloniex markets

 # did some computations
  response = Faraday.get "https://poloniex.com/public?command=returnTicker"
  market_data_hash = JSON.parse(response.body)
  
  if market_data_hash.empty?
    raise MarketError
  end
  
  market_data_hash.keys 
end
