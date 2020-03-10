require 'pry'

class CashRegister
    attr_accessor :total, :discount, :last_price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity=1)
        self.last_price = price * quantity
        quantity.times {self.items << item} 
        self.total += price * quantity
    end

    def apply_discount
        if self.discount > 0
            self.total = @total - @total * self.discount / 100 
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= self.last_price
    end
end
