class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def update
    if params[:changed_password]
      user = User.find(params[:id])
      if user && user.authenticate(params[:password])
        if !user.passwords_different?(params[:password], params[:new_password])
          redirect_to edit_user_path, :notice => "New password cannot be the same as the old password."
        elsif user.new_password_blank?(params[:new_password], params[:new_password_confirmation])
          redirect_to edit_user_path, :notice => "new password and new password confirmation cannot be blank"
        elsif user.new_password_match?(params[:new_password], params[:new_password_confirmation])
          user.password = params[:new_password]
          user.password_confirmation = params[:new_password_confirmation]
          if user.save
            redirect_to root_url, :notice => "Password has been changed."
          else
            redirect_to edit_user_path, :notive => "Could not change password. Please try again."
          end
        else
          redirect_to edit_user_path, :notice => "New password and new password confirmation do not match."
        end
      else
        redirect_to edit_user_path, :notice => "Current password is not correct."
      end
    end
  end

  def show
    @user = User.find(params[:id])

    render "show"
  end
end
