require "spec_helper"

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
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

  describe "#check stock" do
    it "has default stock of 0 if item is not in stock" do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
  end

  describe "#stock" do
    it "can add stock to items and update inventory" do
      @vendor.stock(@item1, 30)
      expect(@vendor.inventory).to eq({@item1 => 30})
      expect(@vendor.check_stock(@item1)).to eq(30)
    end
  end
end