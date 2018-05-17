require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require_relative 'poloniex_markets_api'
require_relative 'poloniex_api'

MARKETS = nil
before do
  @markets = get_markets
end

helpers do 
  # format  BTC_ETH to BTC-ETH 
  def format_ticker(ticker)
    ticker.split('_').join('-')
  end
end

get '/' do
  @title = "Markets: Home"
  if !MARKETS
    MARKETS= get_markets
  end
  
  @markets = MARKETS  
  erb(:home)
end

get '/market/:currency_pair' do
  @currency_pair = params[:currency_pair].upcase

  @prices = get_ticker_price(@currency_pair) 
  erb(:ticker_price)
end

get '/search' do
  @coin = params[:search_coin].downcase

  @results = []
  @markets.map {|market| market.downcase}.each do |market|
    @results << market if market.include?(@coin)
  end

  erb(:search)
end