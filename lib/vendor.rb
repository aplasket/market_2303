class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory[item].nil?
      0
    else
      @inventory[item]
    end
  end

  def stock(item, amount)
    if @inventory.keys.include?(item)
      new_stock = check_stock(item) + amount
      @inventory[item] = new_stock
    else
      @inventory[item] = amount
    end
  end

  def potential_revenue
    revenue = 0
    @inventory.each_pair do |item, quantity|
      revenue += (item.price * quantity)
    end
    revenue
  end
end