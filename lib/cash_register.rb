
class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize (employee_discount = 0)
        @discount = employee_discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times do
            @items << title
        end
        self.last_transaction = price * quantity
        self.total += price * quantity
    end

    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        end
        self.total -= @discount*@total/100
        "After the discount, the total comes to $#{self.total}."
    end

    def void_last_transaction
        @items.pop
        @total -= @last_transaction
    end
end