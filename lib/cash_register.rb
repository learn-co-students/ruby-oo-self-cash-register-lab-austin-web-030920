
class CashRegister
    attr_accessor :total, :discount, :items, :prices

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def items
        @items.map{|i| [].fill(i[:title],0,i[:quantity])}.flatten
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @items << {:title => title, :price => price, :quantity => quantity}
    end

    def apply_discount
        if @discount
            @total *= (1 - @discount / 100.0)
            return "After the discount, the total comes to $#{total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        #puts "\n\nFront:     Items: #{@items}\nTotal: #{@total}\n\n"
        if !@items.empty?
            @total -= @items.last[:price] * @items.last[:quantity]
            @items.pop
        end
        #puts "\n\nBack:     Items: #{@items}\nTotal: #{@total}\n\n"
    end

end
