class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction
    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        quantity.times do
            self.items << title 
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        if @discount > 0
            self.total = (self.total * (1 - (@discount.to_f / 100)))
            return "After the discount, the total comes to $#{((self.total).to_i)}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= last_transaction
    end
end