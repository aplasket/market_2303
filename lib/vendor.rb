class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    revenue = 0
    @inventory.each_pair do |item, quantity|
      revenue += (item.price * quantity)
    end
    revenue
  end

  def sell(item)
    @inventory[item] -= 1
  end
end