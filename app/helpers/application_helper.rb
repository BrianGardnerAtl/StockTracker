module ApplicationHelper

  def main_button
    if current_user
      link_to "Stock Tracker", user_path(current_user.id)
    else
      link_to "Stock Tracker", "/"
    end
  end
end
