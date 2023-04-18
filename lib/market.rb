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
    @vendors.flat_map do |vendor|
      vendor.inventory.keys.map {|inventory| inventory.name }
    end.uniq.sort
  end

  def overstocked_items
    overstocked_items = []
    @vendors.map do |vendor|
      vendor.inventory.each_pair do |item, quantity|
        if vendors_that_sell(item).count > 1 && total_quantities(item) > 50
          overstocked_items << item
        end
      end
    end
    overstocked_items.uniq
  end

  def total_quantities(item)
    count = @vendors.map do |vendor| 
      vendor.check_stock(item)
    end.sum
  end

  def total_inventory
    all_inventory = {}

    @vendors.map do |vendor|
      vendor.inventory.each_pair do |item, quantity|
        all_inventory[item] = {quantity: total_quantities(item),
                            vendors: vendors_that_sell(item)}
      end
    end

    all_inventory
  end
end