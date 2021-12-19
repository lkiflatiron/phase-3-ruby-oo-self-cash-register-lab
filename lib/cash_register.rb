require 'pry'

class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0.0
    @discount = discount
    @items_arr = []
    @last_transaction = 0.0
  end

  def add_item(title, price, quantity = 1)
    new_money = price * quantity
    self.total += new_money
    @last_transaction = new_money
    quantity.times { @items_arr << title }
  end

  def apply_discount
   # binding.pry
    if self.discount > 0
      subtract = self.total * (self.discount / 100.0)
      self.total -= subtract
      return "After the discount, the total comes to $#{self.total.to_i}."
    else
     return "There is no discount to apply."
    end
  end

  def items
    return @items_arr
  end

  def void_last_transaction
    return @total -= @last_transaction
  end
end

# new_register = CashRegister.new
# new_register.add_item("tomato", 1.76, 2)
# new_register.void_last_transaction
# puts new_register.total



