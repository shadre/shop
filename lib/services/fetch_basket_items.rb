module Shop
  class FetchBasketItems
    def call
      BASKET_ITEMS.map do |item|
        {
          product: item.fetch_product,
          quantity: item.quantity,
          unit_price: item.unit_price,
          total_price: item.total_price,
          total_price_with_vat: item.total_price_with_vat
        }
      end
    end
  end
end
