class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create

  def passwords_different?(passA, passB)
    passA != passB
  end

  def new_password_blank?(passA, passB)
    passA.blank? || passB.blank?
  end

  def new_password_match?(passA, passB)
    passA == passB
  end
end
