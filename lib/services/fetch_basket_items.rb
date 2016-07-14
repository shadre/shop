module Shop
  class FetchBasketItems
  attr_reader :product_id #, :quantity
  attr_accessor :quantity
    def call
      BASKET_ITEMS.map do |item|
        {
          product: item.fetch_product,
          product_id: item.product_id,
          quantity: item.quantity,
          unit_price: item.unit_price,
          total_price: item.total_price,
          total_price_with_vat: item.total_price_with_vat
        }
      end
    end
  end
end
