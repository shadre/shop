class BasketItem
  attr_reader :product
  attr_accessor :quantity

  WrongQuantityRequested = Class.new(StandardError)
  NoSuchItem = Class.new(StandardError)

  def initialize(product:, quantity: 1)
    @product = product
    @quantity = quantity

    raise ArgumentError unless quantity.is_a?(Integer)
    raise ArgumentError unless quantity > 0
  end

  def change_quantity(num)
    raise ArgumentError unless num.is_a?(Integer)

    if @quantity + num >= 0
    # it's OK to set @quantity = 0 here, because Basket#summary method rejects such items
      @quantity = @quantity + num
    else
      raise WrongQuantityRequested
    end
  end

  # the method below could potentially be used instead of current Basket .remove method
  # def remove(product_id)
  #   product_is_a_basket_item = product.id == product_id
  #   raise NoSuchItem unless product_is_a_basket_item
  #   @quantity = 0
  # end
end
