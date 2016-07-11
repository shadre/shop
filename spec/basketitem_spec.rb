require_relative '../lib/basketitem.rb'

RSpec.describe BasketItem do
  let(:football) { Product.new(name: "Football", price: 79) }
  let(:basketball) { Product.new(name: "Basketball", price: 60) }
  let(:tennis_ball) { Product.new(name: "Tennis ball", price: 10) }

  describe "#new" do
    it "raises argument error when product not provided" do
      expect {
        BasketItem.new(price: 100)
      }.to raise_error(ArgumentError)
    end

    it "assumes quantity is 1 when no quantity provided" do
      expect(BasketItem.new(product: "basketballs_in_basket").quantity).to eql(1)
    end

    it "returns argument error when quantity is not an integer" do
      expect {
        BasketItem.new(product: "tennis_rackets_in_basket", price: 1.5)
      }.to raise_error(ArgumentError)
    end

    it "returns argument error when product is not a string" do
      expect {
        BasketItem.new(product: 1, price: 100)
      }.to raise_error(ArgumentError)
    end

    it "returns argument error when quantity is not a positive number" do
      expect {
        BasketItem.new(product: "BasketItem", price: -1)
      }.to raise_error(ArgumentError)
    end
  end
end
