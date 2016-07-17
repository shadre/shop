module Shop
  class Product
    attr_reader :name, :price, :id

    @@id = 0

    def initialize(name:, price:)
      @id = next_id
      @name = name
      @price = price.to_f

      raise ArgumentError unless price.is_a?(Numeric) && price > 0 && name.is_a?(String)
    end

    private
    def next_id
      @@id += 1
    end
  end
end
