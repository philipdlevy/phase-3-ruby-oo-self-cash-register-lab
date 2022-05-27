require 'pry'

class CashRegister 
    attr_accessor :total, :discount, :quantity, :cart, :last_transaction
    attr_reader :add_item



    def initialize(discount = 0)
        @total = 0 
        @discount = discount
        @cart = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times { self.cart << title }
        @last_transaction = price * quantity
    end

    def apply_discount
        discount_percent = (100.0 - discount.to_f) / 100
        @total = total * discount_percent
        discount != 0 ? "After the discount, the total comes to $#{total.to_i}." : "There is no discount to apply."
    end

    def items
        return @cart
    end

    def void_last_transaction
        self.total -= self.last_transaction
        # @cart - last_item.to_a
        # binding.pry
        # binding.pry
        # @last_item = cart - cart.slice!(-1)
    end

end