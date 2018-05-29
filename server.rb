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

  @USDT_BTC = get_ticker_price("USDT_BTC")
  @markets = MARKETS
  erb(:home)
end

get '/market/:currency_pair' do
  @currency_pair = params[:currency_pair].upcase

  @prices = get_ticker_price(@currency_pair) 
  erb(:ticker_price)
end


# request -> parse_request -> controller[check auth? perform some function to get result -> serialized]  -> response
get '/search' do
  @coin = params[:search_coin].downcase

  @results = []
  @markets.map {|market| market.downcase}.each do |market|
    @results << market if market.include?(@coin)
  end

  erb(:search)
end

get '/favorites' do
  @favorites = ['USDT_BTC', 'BTC_LTC', 'USDT_ETH', 'BTC_ETH']
  
  @btc_price = get_ticker_price('USDT_BTC')

  @fav_price = {}
  @favorites.each do |fav|
    @fav_price[fav] = get_ticker_price(fav)
  end

  erb :favorites, layout: :layout
end
