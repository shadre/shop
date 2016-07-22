module Shop
  Products_to_seed = [
    Product.new(name: "Football", price: 79.44),
    Product.new(name: "Basketball", price: 60),
    Product.new(name: "Squash racket type A", price: 150),
    Product.new(name: "Squash racket type B", price: 185.60),
    Product.new(name: "Squash balls 3 pack", price: 12),
    Product.new(name: "Sports bag", price: 145),
    Product.new(name: "Tennis racket", price: 199),
    Product.new(name: "Headband", price: 14),
    Product.new(name: "Swimming goggles", price: 35)
  ]
  Stock_items_to_seed = [
    StockItem.new(product_id: 1, level: 26),
    StockItem.new(product_id: 2, level: 23),
    StockItem.new(product_id: 3, level: 6),
    StockItem.new(product_id: 4, level: 2),
    StockItem.new(product_id: 5, level: 44),
    StockItem.new(product_id: 6, level: 11),
    StockItem.new(product_id: 7, level: 9),
    StockItem.new(product_id: 8, level: 22),
    StockItem.new(product_id: 9, level: 14)
  ]
end
