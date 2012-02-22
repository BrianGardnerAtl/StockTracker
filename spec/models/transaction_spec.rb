require 'spec_helper'

describe Transaction do
  describe "#validations" do
    use_vcr_cassette

    it "is invalid with an incorrect stock symbol" do
      stock = Factory.stub(:invalid_symbol)
      stock.should_not be_valid
    end

    it "is invalid without a number of shares" do
      stock = Factory.stub(:invalid_shares)
      stock.should_not be_valid
    end

    it "is invalid without a price" do
      stock = Factory.stub(:invalid_price)
      stock.should_not be_valid
    end
  end
end

