class Basket
  attr_reader :name, :price, :id, :product
  attr_accessor :items

  ProductNotFound = Class.new(StandardError)

  def initialize(items = [])
    @items = items
  end

  def add(basket_item)
    items << basket_item
  end

  def remove(product_id)
    existing_basket_item = items.find { |item| item.product.id == product_id }
    raise ProductNotFound unless existing_basket_item
    items.delete(existing_basket_item)
  end

  def summary
    items.
      reject { |item| item.quantity.zero? }.
      map do |item|
        { name: item.product.name,
          id: item.product.id,
          unit_price: item.product.price,
          qty: item.quantity,
          price: (item.product.price * item.quantity) }
      end
  end

  def sum
    summary
    .map{ |prod| prod[:price] }
    .reduce(:+)
    .round(2)
  end

  def sum_with_vat
    (sum * 1.23).round(2)
  end
end
