require "web_spec"

RSpec.describe "GET /", type: :request do
  before do
    do_request
  end

  it "returns 200 HTTP code" do
    expect(last_response.status).to eql(200)
  end

  it "returns valid html content-type" do
    expect(last_response.headers["Content-Type"]).to include("text/html")
  end

  it "shows correct page title" do
    expect(last_response.body).to include("<title>Sports Shop</title>")
  end

  it "generates a page with content" do
    content_length = last_response.headers["Content-Length"].to_i
    expect(content_length > 50).to eql(true)
  end

  it "generates page header" do
    expect(last_response.body).to include("<header>")
  end

  it "generates page footer" do
    expect(last_response.body).to include("<footer>")
  end

  it "generates navigation menu" do
    expect(last_response.body).to include("<nav>")
  end

  it "includes link to product details" do
    expect(last_response.body).to include("<a href=\"products/")
  end

  private
  def do_request
    get "/"
  end
end
