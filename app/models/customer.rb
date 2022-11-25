class Customer
  attr_reader :customer
  #only ask questions about customer when placing an order
  # validates_uniqueness_of :name

  def initialize(input)
    @name = input[1]
  end

  def self.is_a_customer?
    if Customer.where(name: @name).exists?
      puts "this customer already exists"
    end
  end

  def add_customer
    self.create!(name: name, active: true)
    puts "New customer added: #{Customer.last.name}"
  end

  #deactivate customer- out of scope
end
