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
end
