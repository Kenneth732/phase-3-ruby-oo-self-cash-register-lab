class CashRegister
    attr_accessor :total, :discount, :last_transaction
  
    def initialize
      @total = 0
      @discount = 0
      @last_transaction = 0
    end
  
    def add_item(price, quantity = 1)
      self.last_transaction = price * quantity
      self.total += self.last_transaction
    end
  
    def apply_discount
      self.total = (self.total * (1 - self.discount.to_f / 100)).to_i
      "After the discount, the total comes to $#{self.total}."
    end
  
    def void_last_transaction
      self.total -= self.last_transaction
      self.last_transaction = 0
    end
end
  

register = CashRegister.new
register.add_item(10)
register.add_item(20, 2)
register.discount = 20
puts register.apply_discount
register.void_last_transaction
puts register.total
