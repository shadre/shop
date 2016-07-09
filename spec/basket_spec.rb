require_relative '../lib/basket.rb'

RSpec.describe Basket do

  let(:product1) { Product.new(name: "Football", price: 79) }
  let(:product2) { Product.new(name: "Basketball", price: 60) }
  let(:basket) { Basket.new([product1, product2]) }

  describe "#sum" do
    it "calculates products sum correctly" do
      expect(basket.sum).to eq 139
    end
  end

  describe "#sum_with_vat" do
    it "checks if sum with vat is correct" do
      expect(basket.sum_with_vat).to eq 170.97
    end
  end

  describe "#delete" do
    context "when product does not exist in basket" do 
      it "raises ProductNotFound error" do
        expect {
          basket.delete(0)
        }.to raise_error(Basket::ProductNotFound)
      end
    end

    context "when product exists in basket" do
      it "deletes product from basket" do
        expect(basket.delete(product1.id)). to eq (product1)
      end
    end
  end
end
