require_relative "./fetch_basket_items"

module Shop
  class RemoveBasketItem
    def call(id)
      basket_item = FetchBasketItems.new.call(id)

      return unless basket_item

      reduce_basket_item_quantity(basket_item)
      # maybe change quantity?
    end

    private
    def reduce_basket_item_quantity(basket_item)
      if basket_item.quantity > 1
        basket_item.quantity -= 1
      else
        BASKET_ITEMS.delete(basket_item)
      end
    end
  end
end
