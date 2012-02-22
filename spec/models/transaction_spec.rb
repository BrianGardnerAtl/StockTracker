require 'spec_helper'

describe Transaction do
  describe "#valid_symbol" do
    use_vcr_cassette

    it "returns true if the stock symbol is valid" do
      stock = Factory.stub(:valid_symbol)
      stock.valid_symbol?.should be_true
    end

    it "returns false if the stock symbol is invalid" do
      stock = Factory.stub(:invalid_symbol)
      stock.valid_symbol?.should be_false
    end
  end
end

