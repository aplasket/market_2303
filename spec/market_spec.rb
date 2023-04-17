require "spec_helper"

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market") 
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3 = Vendor.new("Palisade Peach Shack") 
    @vendor3.stock(@item1, 65)
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@market).to be_a(Market)
      expect(@market.name).to eq("South Pearl Street Farmers Market")
      expect(@vendor1).to be_a(Vendor)
      expect(@item4).to be_an(Item)
      expect(@vendor3.inventory).to eq({@item1 => 65})
    end

    it "starts with an empty array of vendors" do
      expect(@market.vendors).to eq([])
    end
  end

  describe "add_vendors" do
    xit "can add vendors to vendor array" do

    end
  end
end