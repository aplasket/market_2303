require "spec_helper"

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market") 
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@market).to be_a(Market)
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end

    it "starts with an empty array of vendors" do
      expect(@market.vendors).to eq([])
    end
  end
end