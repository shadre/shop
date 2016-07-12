module Shop
  class FetchProduct
    def call(id)
      return unless id
      PRODUCTS.find do |prod|
        prod.id == id.to_i
      end
    end
  end
end
