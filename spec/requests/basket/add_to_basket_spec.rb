RSpec.describe "POST /basket", type: :request do

  context "when parameters are invalid" do
    let(:invalid_params) { { foo: "bar" } }

    before do
      do_request(invalid_params)
    end

    it "returns 422 HTTP status code" do
      do_request
      expect(last_response.status).to eq(422)
    end
  end

  context "when parameters are valid" do
    let(:valid_params) { {product_id: 1, quantity: 10 } }

    before do
      do_request(valid_params)
    end

    it "redirects to basket" do
      follow_redirect!
      expect(last_request.url). to include("/basket")
    end

    it "returns 200 HTTP status code after redirect" do
      follow_redirect!
      expect(last_response.status).to eql(200)
    end
  end

  it "calls CreateBasketItem with proper parameters" do
    parameters_as_strings = { "product_id" => "1", "quantity" => "10" }
    expect(Shop::CreateBasketItem).to receive(:new).with(parameters_as_strings).and_call_original
    do_request(parameters_as_strings)
  end

  private
  def do_request(params= {})
    post "/basket", params
  end

end
