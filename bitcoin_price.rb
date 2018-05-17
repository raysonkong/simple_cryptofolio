#! /usr/bin/env ruby
require_relative 'poloniex_api'

# Display the asking price, bidding price, and last price to the user for
# the market specified on the command line
# usage:
# $ ./bitcoin_price.rb usdt_btc

currency_pair = ""
if ARGV.empty?
  puts "Please enter a Market!!!"
  exit(1)
else
  currency_pair = ARGV[0]
end

price = get_ticker_price(currency_pair)

puts "#{currency_pair} Prices"
puts "Asking Price is #{price["ask"]}"
puts "Bidding Price is: #{price["bid"]}"
puts "Last Price is: #{price["last"]}"

