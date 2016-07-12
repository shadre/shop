require_relative "./lib/product"
require_relative "./lib/basket"
require_relative "./lib/basketitem"

begin
  football = Product.new(name: "Football", price: 79.44)
  basketball = Product.new(name: "Basketball", price: 60)
  squash_racket_a = Product.new(name: "Squash racket type A", price: 150)
  squash_racket_b = Product.new(name: "Squash racket type B", price: 185.60)
  squash_ball_pack = Product.new(name: "Squash balls 3 pack", price: 12)
  sports_bag = Product.new(name: "Sports bag", price: 145)

  basket = Basket.new

  footballs_in_basket = BasketItem.new(product: football, quantity: 2)
  squash_rackets_a_in_basket = BasketItem.new(product: squash_racket_a, quantity: 1)
  squash_ball_packs_in_basket = BasketItem.new(product: squash_ball_pack, quantity: 2)
  sports_bags_in_basket = BasketItem.new(product: sports_bag, quantity: 1)

  basket.add(footballs_in_basket)
  basket.add(squash_rackets_a_in_basket)
  basket.add(squash_ball_packs_in_basket)
  basket.add(sports_bags_in_basket)

  puts
  puts "-Added some products to basket"
  puts

  puts " My Basket:"
  puts " ==============================================================="
  printf("%-22s", " Product name:")
  printf("%-7s", "| ID:")
  printf("%-15s", "| Unit price:")
  printf("%-7s", "| QTY:")
  printf("%-15s", "| Total:")
  puts
  puts " ==============================================================="

  basket.summary.each do |prod|
  printf("%-22s", " #{prod[:name]}")
  printf("%-7s", "| #{prod[:id]}")
  printf("%-15s", "| #{'%.02f' % prod[:unit_price]} EUR")
  printf("%-7s", "| #{prod[:qty]}")
  printf("%-15s", "| #{'%.02f' % prod[:price]} EUR")
  puts
  end
  puts " ==============================================================="
  printf("%64s", "Total SUM: #{basket.sum} EUR")
  puts
  printf("%64s", "Total SUM with VAT: #{basket.sum_with_vat} EUR")
  puts

  footballs_in_basket.change_quantity(-1)
  puts
  puts "-Removed 1 Football from basket"
  puts

  puts " My Basket:"
  puts " ==============================================================="
  printf("%-22s", " Product name:")
  printf("%-7s", "| ID:")
  printf("%-15s", "| Unit price:")
  printf("%-7s", "| QTY:")
  printf("%-15s", "| Total:")
  puts
  puts " ==============================================================="

  basket.summary.each do |prod|
  printf("%-22s", " #{prod[:name]}")
  printf("%-7s", "| #{prod[:id]}")
  printf("%-15s", "| #{'%.02f' % prod[:unit_price]} EUR")
  printf("%-7s", "| #{prod[:qty]}")
  printf("%-15s", "| #{'%.02f' % prod[:price]} EUR")
  puts
  end
  puts " ==============================================================="
  printf("%64s", "Total SUM: #{basket.sum} EUR")
  puts
  printf("%64s", "Total SUM with VAT: #{basket.sum_with_vat} EUR")
  puts

rescue Basket::ProductNotFound
rescue BasketItem::WrongQuantityRequested
rescue BasketItem::NoSuchItem
end
