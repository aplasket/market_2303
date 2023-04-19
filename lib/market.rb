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
    #An array of the names of all items the Vendors have in stock, 
    # sorted alphabetically. 
    #This list should not include any duplicate items.
    # [item.name, ...].uniq.sort
    sorted = []
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |item|
        sorted << item.name
      end
    end
    sorted.uniq.sort
  end

  def total_inventory
    # Reports the quantities of all items sold at the market. 
    #Specifically, it should return a hash with items as keys and hashes as values - 
    #this sub-hash should have two key/value pairs: 
    #   quantity pointing to total inventory for that item and 
    #   vendors pointing to an array of the vendors that sell that item. 

    # {item_object => {quantity: amount, vendors: [vendor_objects]}
    all_inventory = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        if all_inventory.keys.include?(item) 
          all_inventory[item][:quantity] += amount
        else
          all_inventory[item] = {quantity: amount,
                                vendors: vendors_that_sell(item)}
        end
      end
    end
    all_inventory
  end

  def overstocked_items
    #An array of `Item` objects that are overstocked. 
    #An item is overstocked if it is sold by more than 1 vendor AND the total quantity is greater than 50.

  end
end