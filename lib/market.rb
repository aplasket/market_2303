class  Market 
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor_object)
    @vendors << vendor_object
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.keys.include?(item)
    end
  end

  def sorted_item_list
    # array of item.names of all items Vendors have in stock, 
    # sorted alphabetically
    # uniq --- no duplicate items listed
    sorted_list = @vendors.map do |vendor|
      vendor
      require 'pry'; binding.pry
    end 
  end

  def total_inventory
    #reports the quanitites of all items sold at the market
  # {item: { quantity: totalinventory of that item, 
            # vendors: [vendors that sell item]}}
  end

  def overstocked_items
    # array of Item objects that are overstocked. 
    # it's overstocked if sold by more than 1 vendor AND total quantity is > 50

  end
end