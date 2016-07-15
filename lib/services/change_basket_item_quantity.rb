require_relative "./fetch_basket_items"

module Shop
  class ChangeBasketItemQuantity
    attr_accessor :quantity, :level

    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @new_quantity = params.fetch("new_quantity").to_i
    end

    def call
      basket_item = BASKET_ITEMS.find { |item| item.product_id == @product_id }
      stock_item = STOCK_ITEMS.find { |item| item.product_id == @product_id }
      stock_level_change = basket_item.quantity - @new_quantity
      enough_in_stock = stock_item.level + stock_level_change >= 0

      if @new_quantity >= 0 && basket_item && enough_in_stock
        change_stock_level(stock_item, stock_level_change)
        change_basket_item_quantity(basket_item, @new_quantity)
      end
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

    def change_stock_level(stock_item, level_change)
      stock_item.level += level_change
    end
  end
end
