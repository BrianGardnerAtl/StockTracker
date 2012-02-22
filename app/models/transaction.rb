require 'rubygems'
require 'yahoo_stock'

class Transaction < ActiveRecord::Base
  validates_with SymbolValidator
  validates_presence_of :symbol
  validates_presence_of :shares
  validates_presence_of :price
  belongs_to :user

  def type_string
    if call_type==true
      "Buy"
    else
      "Sell"
    end
  end

  def price_string
    "$"+price
  end

  def current_price
    quote = YahooStock::Quote.new(:stock_symbols => symbol)
    quote.results(:to_hash).output[0][:last_trade_price_only]
  end
end
