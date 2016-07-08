require_relative '../lib/basket.rb'

RSpec.describe Basket do

  let(:product1) { Product.new(name: "Football", price: 79) }
  let(:product2) { Product.new(name: "Basketball", price: 60) }
  let(:basket1) { Basket.new([product1, product2]) }

  it "calculates products sum correctly" do
    expect(basket1.sum).to eq 139
  end

  it "checks if sum with vat is correct" do
    sum = Basket.new([product1, product2]).sum
    sum_with_vat = Basket.new([product1, product2]).sum_with_vat
    expect(sum * 1.23).to eq (sum_with_vat)
  end

  describe "#delete" do
    context "for product not existing in basket" do 
      it "raies ProductNotFound error" do
        expect {
          basket1.delete(0)
          }.to raise_error(Basket::ProductNotFound)
      end
    end

    context "for product existing in basket" do
      it "deletes product from basket" do
        prod = Product.new(name: "Product", price: 50)
        bas = Basket.new([prod])
        expect(bas.delete(prod.id)).to eq (prod) 
      end
    end
  end
end