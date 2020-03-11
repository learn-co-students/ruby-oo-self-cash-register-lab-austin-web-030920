class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
    
    def initialize(disc = 0)
        @discount = disc
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total += (price * quantity)
        quantity.times do
            items << title
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        if discount > 0
            self.total = (total - ((discount.to_f / 100.0) * total)).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end

end