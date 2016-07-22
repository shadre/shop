RSpec.describe "POST /basket/new", type: :request do

  context "when parameters are invalid" do
    let(:invalid_params) { { foo: "bar" } }

    before do
      do_request(invalid_params)
    end

    it "returns 500 HTTP status code" do
      do_request
      expect(last_response.status).to eq(500)
    end
  end

  context "when parameters are valid" do
    let(:valid_params) { {product_id: 1, quantity: 1 } }

    before do
      do_request(valid_params)
    end

    it "redirects to basket" do
      follow_redirect!
      expect(last_request.url). to include("/basket")
    end
  end

  it "calls CreateBasketItem with proper parameters" do
    parameters_as_strings = { "product_id" => "1", "quantity" => "10" }
    expect(Shop::CreateBasketItem).to receive(:new).with(parameters_as_strings).and_call_original
    do_request(parameters_as_strings)
  end

  private
  def do_request(params= {})
    post "/basket/new", params
  end

end
