require_relative '../lib/basket.rb'

RSpec.describe Basket do

  let(:football) { Product.new(name: "Football", price: 79) }
  let(:basketball) { Product.new(name: "Basketball", price: 60) }
  let(:tennis_ball) { Product.new(name: "Tennis ball", price: 10) }
  let(:footballs_in_basket) { BasketItem.new(product: football, quantity: 2)}
  let(:basketballs_in_basket) { BasketItem.new(product: basketball, quantity: 1)}
  let(:tennis_balls_in_basket) { BasketItem.new(product: tennis_ball, quantity: 3)}
  let(:basket) { Basket.new([footballs_in_basket, basketballs_in_basket]) }

  describe "#sum" do
    it "calculates products sum correctly" do
      expect(basket.sum).to eq(218)
    end
  end

  describe "#sum_with_vat" do
    it "checks if sum with vat is correct" do
      expect(basket.sum_with_vat).to eq(268.14)
    end
  end

  describe "#add" do
    it "adds selected item to basket" do
      basket.add(tennis_balls_in_basket)
        products_in_basket_names = basket.items.map do |item|
         { name: item.product.name }
        end
      expect(products_in_basket_names.select { |prod| prod[:name] == "Tennis ball" }.empty?).to eq(false)
    end
  end

  describe "#remove" do
    context "when product does not exist in basket" do
      it "raises ProductNotFound error" do
        expect {
          basket.remove(0)
        }.to raise_error(Basket::ProductNotFound)
      end
    end

    context "when product exists in basket" do
      it "deletes product from basket" do
        expect(basket.remove(football.id)).to eq(footballs_in_basket)
      end
    end
  end

  describe "#summary" do
    it "does not include products with zero quantity" do
      basketballs_in_basket.change_quantity(-1)
      expect(basket.summary.select { |prod| prod[:name] == "Basketball" }.empty?).to eq(true)
    end

    it "does include selected products" do
      expect(basket.summary.select { |prod| prod[:name] == "Basketball" }.empty?).to eq(false)
    end
  end
end
