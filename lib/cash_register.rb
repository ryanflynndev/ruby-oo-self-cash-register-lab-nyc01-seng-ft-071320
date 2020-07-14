class CashRegister
    def initialize (discount = 0)
        @total = 0.0
        @discount = discount 
        @items = []
        @prices = []
    end

    def discount 
        @discount
    end

    def total=(total)
        @total = total
    end

    def total 
        @total 
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity 
        quantity.times {@items << title}
        @prices << price * quantity
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total -= @total * @discount.to_f / 100
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items 
        @items
    end

    def void_last_transaction
        @total -= @prices[-1]
        @prices.delete_at(-1)
        if @prices == []
            return 0.0
        end
    end
end
  