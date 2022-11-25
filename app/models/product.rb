class Product
  # has_many :customers
  # validates_uniqueness_of :type

  attr_reader :product
  #ask the product about itself
  def initialize(input)
    @input = input.chomp.split
    @command = input[0]
    @product = input[1] #type
    @price = input[2].to_f
    @quantity = input[3]
  end

  def self.checkin_or_register_product(input)
    puts "you made it to the product class"
    if @command == "register"
      register_product
    elsif @command == "checkin"
      checkin_produce
    end
  end


  def register_product
    if carry_product_already? #perhaps redundant but I don't trust like that with duplicates
      checkin_product
    else
      add_new_product
    end
  end

  def checkin_product
    product = Product.find_by_type(product)
    puts "checking in product called #{product.type}"
    product.quantity = product.quantity + quantity
    product.save!
  end

  def has_available_stock?
    if !self.find_by_type(product).quantity.zero?
      puts "this product: #{product.type} is available in stock"
    end
  end

  def carry_product_already?
    if Product.find_by_type(product)
      puts "this product #{product.type} is something we already carry"
    end
  end

  def add_new_product
    self.create!(type: product, quantity: quantity, price: price)
    puts "new product called #{Product.last.type} has been added"
  end
end
