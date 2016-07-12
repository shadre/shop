module Shop
  class WarehouseItem
    attr_reader :id, :product_id
    attr_accessor :quantity

    @@id = 0

    def initialize(product_id:, quantity: 1)
      @id = next_id
      @product_id = product_id
      @quantity = quantity
    end

    private
    def next_id
      @@id += 1
    end
  end
end
