RSpec.describe "GET /products/:id", type: :request do
  context "when product with given id does not exist" do
    before do
      do_request(id: 0)
    end

    it "shows information about not existing page" do
      expect(last_response.body).to include("does not exist!")
    end

    it "returns valid html content-type" do
      expect(last_response.headers["Content-Type"]).to include("text/html")
    end
  end

  context "when product with given id exists" do
    before do
      do_request(id: 1)
    end

    it "shows price of the product in correct format" do
      expect(last_response.body).to match(/Price: \d*.\d\d EUR/)
    end

    it "shows an \"Add to my basket\" button " do
      expect(last_response.body).to include("type=\"submit\" value=\"Add to my basket\">")
    end

    it "returns valid html content-type" do
      expect(last_response.headers["Content-Type"]).to include("text/html")
    end

    it "shows correct page title" do
      expect(last_response.body).to include("<title>Sports Shop")
    end

    it "generates a page with content" do
      content_length = last_response.headers["Content-Length"].to_i
      expect(content_length > 50).to eql(true)
    end

    it "generates page header" do
      expect(last_response.body).to include("<header>")
    end

    it "generates page footer" do
      expect(last_response.body).to include("<footer")
    end

    it "generates navigation menu" do
      expect(last_response.body).to include("<nav>")
    end
  end

  private
  def do_request(id:)
    get "products/#{id}"
  end
end
