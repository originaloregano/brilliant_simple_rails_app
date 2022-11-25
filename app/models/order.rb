require_relative 'customer'

class Order
#order is only time customer is brought up
#order kate socks 10
attr_reader :order

  def initialize(input)
    @input = input.chomp.split
    @customer_name = @input[1]
    @product = @input[2]
    @quantity = @input[3]
    @total = total
  end

  def self.process_order(input)
    puts "you made it to the order class"
    if Customer.is_a_customer? && carry_product_already?(@product)
      if has_available_stock?(@product)
        calculate_order_total
        update_product_quantity
      end
    end
  end

  #Ignore any orders for products that either are not in the warehouse or we do not have enough of to fulfill the order.

  def calculate_order_total(product, quantity)
    total = quantity * product.price
    puts "your order total is: #{total}"
  end

  def update_product_quantity
    puts " updated product quantity but not written yet"
  end
end
