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
    sorted_list = @vendors.map do |vendor|
      vendor.inventory.keys.map do |inventory|
        sorted_list = inventory.name
      end
    end.flatten.uniq.sort
  end

  def total_inventory
    #reports the quanitites of all items sold at the market
  # {item: { quantity: totalinventory of that item, 
            # vendors: [vendors that sell item]}}
  end

  def overstocked_items
    # array of Item objects that are overstocked. 
    # it's overstocked if sold by more than 1 vendor AND total quantity is > 50
    overstocked_items = []
    quantity = 0 
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if vendors_that_sell(item).count > 1 
          vendors_that_sell(item).each do |vendor_item|
            quantity += vendor.inventory[item]
          end
        end
        quantity
  
        if quantity > 50
          overstocked_items << item
        end
      end
    end
    overstocked_items.uniq
  end
end