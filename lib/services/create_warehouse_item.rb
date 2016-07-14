module Shop
  class CreateWarehouse
    def call(product_id, quantity)
      WAREHOUSE_ITEMS << WarehouseItem.new(product_id, quantity)
    end
  end
end
