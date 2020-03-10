require 'pry'
class CashRegister
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @last_price = 0
    end

    attr_accessor :total, :discount, :items, :last_price



    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        quantity.times do
            self.items << title
        end
        self.last_price = price * quantity
    end

    def apply_discount
        if self.discount > 0
            self.total = (self.total * (1 - (self.discount.to_f / 100)))
            return "After the discount, the total comes to $#{((self.total).to_i)}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        return @items
    end

    def void_last_transaction
        self.total -= self.last_price
    end

end