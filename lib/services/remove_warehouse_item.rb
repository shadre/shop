require_relative "./fetch_warehouse_item"

module Shop
  class RemoveWarehouseItem
    def call(id)
      warehouse_item = FetchWarehouseItem.new.call(id)

      return unless warehouse_item

      reduce_warehouse_item_quantity(warehouse_item)
    end

    private
    def reduce_warehouse_item_quantity(warehouse_item)
      if warehouse_item.quantity > 1
        warehouse_item.quantity -= 1
      else
        WAREHOUSE_ITEMS.delete(warehouse_item)
      end
    end
  end
end
