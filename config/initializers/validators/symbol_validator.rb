class SymbolValidator < ActiveModel::Validator
  def validate(record)
    quote = YahooStock::Quote.new(:stock_symbols => record.symbol).results(:to_hash).output[0]
    if quote[:last_trade_date] == "N/A"
      record.errors[:base] << "Invalid stock symbol."
    end
  end
end
