class Transaction < ActiveRecord::Base
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
end
