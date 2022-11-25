require_relative 'order'
require_relative 'product'

class Interface
  attr_accessor :input

  def initialize(input)
    @input = input.chomp.split
    puts @input[0]
  end

  def process_input
    if @input[0] == "order"
      puts "*robot voice* processing order..."
      Order.process_order(@input)
    elsif @input[0] == "register" || @input[0] == "checkin"
      puts "*robot voice* adding product to inventory or registering new product"
      Product.checkin_or_register_product(@input)
    end
  end

  def is_valid_command?
    @input[0].include?('"register", "checkin", "order"')
  end

  def is_an_order_command?
    @input[0] == "order" && @input.count == 4
  end
end
