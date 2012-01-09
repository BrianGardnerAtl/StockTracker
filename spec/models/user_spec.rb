require 'spec_helper'

describe User do
  describe '#authenticate' do
    let(:password) { 'password' }
    let(:user)     { Factory.create(:user, password: password) }

    it "returns user if the password is correct" do
      user.authenticate(password).should eql user
    end

    it "returns nil if the password is incorrect" do
      user.authenticate("invalid").should eql false
    end
  end

  describe ".passwords_different?" do
    let(:password)                  { "password" }
    let(:user)                      { Factory.create(:user, password: password) }
    let(:new_password)              { "new-password" }
    let(:new_password_confirmation) { "new-password" }

    it "reutrns true if the current password and new password are different" do
      user.passwords_different?(password, new_password).should be_true
    end

    it "returns false if the current password is the same as the new password" do
      user.passwords_different?(password, "password").should be_false
    end
  end

  describe ".new_password_blank?" do
    let(:password)                  { "password" }
    let(:user)                      { Factory.create(:user, password: password) }
    let(:new_password)              { "new-password" }
    let(:new_password_confirmation) { "new-password" }

    it "returns true if the new password or new password confirmation are blank" do
      user.new_password_blank?(new_password, nil).should be_true
    end

    it "returns false if the new password and new password confirmation are not blank" do
      user.new_password_blank?(new_password, new_password_confirmation).should be_false
    end
  end

  describe ".new_password_match?" do
    let(:password)                  { "password" }
    let(:user)                      { Factory.create(:user, password: password) }
    let(:new_password)              { "new-password" }
    let(:new_password_confirmation) { "new-password" }

    it "returns true if the new password and new password confirmation are the same" do
      user.new_password_match?(new_password, new_password_confirmation).should be_true
    end

    it "returns false if the new password and new password confirmation are different" do
      user.new_password_match?(new_password, "incorrect").should be_false
    end
  end
end
