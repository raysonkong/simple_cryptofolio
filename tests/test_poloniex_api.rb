require 'minitest/autorun'
require_relative '../poloniex_api.rb'

class MyFirstTest < Minitest::Test
  def test_dummy
    assert true
  end
  
  def test_happy_path
   # Given that the client requests data for BTC_ETH
   # When get_ticker_price is called with this market (call code thats being tested)
   result = get_ticker_price("BTC_ETH")

   # Then the result should be a hash with keys 'bid', 'ask', 'last'
   # dependency injection? 
   
   assert(result.keys.sort == [ 'ask','bid', 'last'], "test correct keys")
   assert(result['bid'].to_f  >= 0)
   assert(result['ask'].to_f >= 0)
   assert(result['last'].to_f >= 0)
  end

  def test_bad_market_name
    input = 'btc_eth'
    assert_raises BitcoinPriceError do
       get_ticker_price(input)
    end
  end
end

# empty test later
# dependency injection, need to manipulate response from Faraday.get (what if you pass in a function that returns the actual data?)
# def fake_get()
#   return json_file
# end

# get_ticker_price(market, requester)

# or learn how to mock out third-party code with minitest

# selenium (browser automation)
