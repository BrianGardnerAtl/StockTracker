class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_many :transactions
  has_secure_password
  validates_presence_of :password, :on => :create
  before_create { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

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
