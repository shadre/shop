class Basket
  attr_reader :products
  
  ProductNotFound = Class.new(StandardError)

  def initialize(products = [])
    @products = products
  end

# later: def add(product, quantity=1)
  def add(product)
    products << product
    #add warehouse quantity -= 1 later on
  end

  def delete(product_id)
    product_in_basket = products.find { |prod| prod.id == product_id }
    if product_in_basket
      products.delete(product_in_basket)
    else
      raise ProductNotFound
    end
  end

  def sum
    products
      .map(&:price)
      .reduce(0, :+)
      .round(2)    
  end

  def sum_with_vat
    (sum * 1.23).round(2)
  end

  def show 
    products.each do |prod|
    puts "Product: #{prod.name}, ID: #{prod.id}, price: #{prod.price} \t"
    end
    puts "----------------------------"
    print "Total SUM: " 
    puts sum
    print "With VAT: " 
    puts sum_with_vat
  end
end
