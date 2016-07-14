module Shop
  class CreateBasketItem
    attr_reader :product_id #, :quantity
    attr_accessor :quantity

    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @quantity = params.fetch("quantity").to_i
    end

    def call
      item_in_basket = BASKET_ITEMS.find { |item| item.product_id == @product_id }
      if item_in_basket
        item_in_basket.quantity += @quantity
      else
        BASKET_ITEMS << BasketItem.new(
          product_id: @product_id,
          quantity: @quantity
        )
      end
    end
  end
end
