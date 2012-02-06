module UsersHelper

  def transactions_table
    if current_user && current_user.has_transactions
      content_tag :table do
        concat(content_tag(:tr) do
            concat(content_tag :th, "Symbol")
            concat(content_tag :th, "Type")
            concat(content_tag :th, "Shares")
            concat(content_tag :th, "Purchased Price")
            concat(content_tag :th, "Current Price")
          end
        )
        transactions = Transaction.where(:user_id => current_user.id)
        transactions.each do |trans|
          concat(content_tag(:tr) do
              concat(content_tag :td, trans.symbol)
              concat(content_tag :td, trans.type_string)
              concat(content_tag :td, trans.shares)
              concat(content_tag :td, trans.price_string)
              concat(content_tag :td, trans.current_price)
            end
          )
        end
      end
    end
  end
end
