class Product
  attr_reader :name, :price, :id

  @@id = 0

  def initialize(name:, price:)
    @id = next_id
    @name = name
    @price = price
  end

  private
  def next_id
    @@id += 1
  end
end