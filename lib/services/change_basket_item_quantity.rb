require_relative "./fetch_basket_items"

module Shop
  class ChangeBasketItemQuantity
    attr_accessor :quantity

    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @new_quantity = params.fetch("new_quantity").to_i
    end

    def call
      basket_item = BASKET_ITEMS.find { |item| item.product_id == @product_id }

      change_basket_item_quantity(basket_item, @new_quantity) unless !basket_item
    end

    private
    def change_basket_item_quantity(basket_item, new_quantity)
        if new_quantity > 0
          basket_item.quantity = new_quantity
        elsif new_quantity == 0
          BASKET_ITEMS.delete(basket_item)
        else
          raise ArgumentError
        end
      end
  end
end
