require_relative '../lib/basket.rb'

RSpec.describe Basket do

  it "creates basket" do
    expect Basket.new.is_a? Basket
  end

  let(:p1) { Product.new(name: "Football", price: 79) }
  let(:p2) { Product.new(name: "Basketball", price: 60) }
  it "checks if sum with vat is correct" do
    sum = Basket.new([p1, p2]).sum
    sum_with_vat = Basket.new([p1, p2]).sum_with_vat
    expect(sum * 1.23).to eq sum_with_vat
  end



  #it "doesn't take basket arguments"
end