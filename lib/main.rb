require_relative "./product"
require_relative "./warehouse"
require_relative "./basket"

p1 = Product.new(name: "Football", price: 79)
p2 = Product.new(name: "Basketball", price: 60)
p3 = Product.new(name: "Squash racket type A", price: 150)
p4 = Product.new(name: "Squash racket type B", price: 185.60)
p5 = Product.new(name: "Sports bag", price: 145)

basket = Basket.new

basket.add(p1)
basket.add(p2)
basket.add(p2)
basket.add(p2)
basket.add(p3)

p basket.show

basket.delete(10)
basket.delete(2)

p basket.show



