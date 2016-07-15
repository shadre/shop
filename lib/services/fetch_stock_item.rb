module Shop
  class FetchStockItem
    def call(id)
      return unless id
      STOCK_ITEMS.find { |item| item.product_id == id.to_i }
    end
  end
end
