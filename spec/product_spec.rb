require_relative '../lib/product.rb'

RSpec.describe Product do
  it "tests spec" do
    expect(true).to eq true
  end

  it "creates product" do
    expect(Product.new(name: "New product", price: 100)).is_a? Product
  end

  it "returns argument error when name not provided" do
    expect {
      Product.new(price: 100)
      }.to raise_error(ArgumentError)
  end

    it "returns argument error when price not provided" do
    expect {
      Product.new(name: "Product")
      }.to raise_error(ArgumentError)
  end

  it "creates products with incremental IDs" do
    last_id = Product.new(name: "Product1", price: 55).id
    expect(Product.new(name: "Product2", price: 100).id).to eq(last_id + 1)
  end
end