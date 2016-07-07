require_relative '../lib/basket.rb'

RSpec.describe Basket do

  let(:p1) { Product.new(name: "Football", price: 79) }
  let(:p2) { Product.new(name: "Basketball", price: 60) }

  it "creates basket" do
    expect Basket.new.is_a? Basket
  end

  it "doesn't delete product not existing in basket" do
    bas = Basket.new
      expect(bas.delete(0)).to eq nil
  end

  it "deletes product from basket" do
    prod = Product.new(name: "Product", price: 50)
    bas = Basket.new([prod])
    expect(bas.delete(prod.id)).to eq prod 
  end

  it "calculates products sum correctly" do
    bas = Basket.new([p1, p2])
    expect(bas.sum).to eq 139
  end


  it "checks if sum with vat is correct" do
    sum = Basket.new([p1, p2]).sum
    sum_with_vat = Basket.new([p1, p2]).sum_with_vat
    expect(sum * 1.23).to eq sum_with_vat
  end
end