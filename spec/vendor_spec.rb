require "spec_helper"

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@vendor).to be_a(Vendor)
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it "starts with an empty hash of inventory" do
      expect(@vendor.inventory).to eq({})
    end
  end
end