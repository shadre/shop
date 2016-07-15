module Shop
  class StockItem
    attr_reader :product_id
    attr_accessor :level

    def initialize(product_id:, level:)
      @product_id = product_id
      @level = level

      raise ArgumentError unless level.is_a?(Integer)
      raise ArgumentError unless level > 0
    end
  end
end
