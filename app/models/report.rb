# Dan: n/a
# Kate: hats - $410.00, socks - $34.50 | Average Order Value: $222.25
module Report

  def initialize
  end

  def generate_report_per_customer
    puts "#{customer.name}: #{product.type} - $#{@total} | Average Order Value: $#{}"
  end

  def average_order_value
    @customer.order.total / @customer.order.count
  end
end
