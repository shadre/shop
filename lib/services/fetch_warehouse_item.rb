module Shop
  class FetchWarehouseItem
    def call(id)
      WAREHOUSE_ITEMS.find do |item|
        item.id == id
      end
    end
  end
end
