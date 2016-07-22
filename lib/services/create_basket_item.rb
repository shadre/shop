module Shop
  class CreateBasketItem
    attr_reader :product_id
    attr_accessor :quantity

    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @quantity = params.fetch("quantity").to_i
    end

    def call
      item_in_basket = BASKET_ITEMS.find { |item| item.product_id == product_id }
      stock_item = STOCK_ITEMS.find { |item| item.product_id == product_id }
      enough_in_stock = stock_item.level >= @quantity

      if item_in_basket && enough_in_stock
        item_in_basket.quantity += @quantity
        stock_item.level -= @quantity
      elsif enough_in_stock
        BASKET_ITEMS << BasketItem.new(
          product_id: @product_id,
          quantity: @quantity
        )
        stock_item.level -= @quantity
      else
        raise ArgumentError
      end
    end
  end
end
