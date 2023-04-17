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

      @vendor.stock(@item1, 25)
      expect(@vendor.check_stock(@item1)).to eq(55)

      @vendor.stock(@item2, 12)
      expect(@vendor.inventory).to eq({ @item1 => 55,
                                        @item2 => 12})
    end
  end

  describe "#potential revenue" do
    it "calculates revenue based on item price * quantity" do
      @vendor.stock(@item1, 55)
      @vendor.stock(@item2, 12)

      expect(@vendor.potential_revenue).to eq(47.25)
    end
  end

  describe "#sell item" do
    it "can sell an item" do
      @vendor.stock(@item1, 55)
      @vendor.stock(@item2, 12)
      @vendor.sell(@item1)

      expect(@vendor.check_stock(@item1)).to eq(54)

      2.times {@vendor.sell(@item1)}
      6.times {@vendor.sell(@item2)}
      expect(@vendor.check_stock(@item1)).to eq(52)
      expect(@vendor.check_stock(@item2)).to eq(6)
    end
  end
end