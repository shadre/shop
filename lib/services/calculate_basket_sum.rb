module Shop
  class CalculateBasketSum
    def call
      {
      basket_total: (BASKET_ITEMS.map { |item| item.total_price }.reduce(:+)),
      basket_total_with_vat:
        (BASKET_ITEMS.map { |item| item.total_price_with_vat }.reduce(:+))
      }
    end
  end
end
