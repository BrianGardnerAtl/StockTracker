FactoryGirl.define do
  factory :user do
    email                 { Forgery(:internet).email_address }
    password              { Forgery(:basic).password }
    password_confirmation { |u| u.password }
  end

  factory :invalid_symbol, :class => Transaction do
    symbol                "xyz"
    call_type             true
    shares                1000
    price                 600
  end

  factory :invalid_shares, :class => Transaction do
    symbol      "goog"
    call_type   true
    price       50
  end

  factory :invalid_price, :class => Transaction do
    symbol      "goog"
    call_type   true
    shares      1000
  end
end
