require 'rubygems'
require 'yahoo_stock'
#require File.join(Rails.root, 'lib', 'validators', 'symbol_validator.rb')

class Transaction < ActiveRecord::Base
  validates_presence_of :symbol
  validates_presence_of :shares
  validates_presence_of :price
#  validates :symbol, :symbol => true
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
