require 'pry'

class CashRegister
    
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount=0)
        @total = 0
        @discount=discount
        @items = []
    end

    def add_item(title, price, qty=1)
        self.total += price * qty
        qty.times do
            self.items << title
        end
        self.last_transaction = price * qty
    end

    def apply_discount
        if discount != 0
            percent_off = discount / 100.0
            self.total = total - ((total * percent_off).to_i)
            "After the discount, the total comes to $#{total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= last_transaction
    end
end
