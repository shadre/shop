module Shop
  class BasketItem
    attr_reader :product_id
    attr_accessor :quantity

    ProductNotFound = Class.new(StandardError)
    WrongQuantityRequested = Class.new(StandardError)
    NoSuchItem = Class.new(StandardError)

    def initialize(product_id:, quantity: 1)
      @product_id = product_id
      @quantity = quantity

      raise ArgumentError unless quantity.is_a?(Integer) && quantity > 0
    end

    def fetch_product
      FetchProduct.new.call(product_id)
    end

    def unit_price
      fetch_product.price
    end

    def total_price
      (unit_price * quantity).round(2)
    end

    def total_price_with_vat
      (total_price * 1.23).round(2)
    end
  end
end
