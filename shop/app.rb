require "bundler/setup"
require "sinatra/base"
require "sinatra/reloader"

Dir["../lib/**/*.rb"].each { |path| require path }
Dir["./lib/**/*.rb"].each { |path| require path } # needed for RSpec to work
require_relative "../db/seeds.rb"

module Shop
  # pseudo database tables
  PRODUCTS = []
  BASKET_ITEMS = []
  WAREHOUSE_ITEMS = []

  # pseudo database seeding
  Products_to_seed.each do |product|
    PRODUCTS << product
  end

  class App < Sinatra::Base
    set :root, File.join(File.dirname(__FILE__), '..')
    set :views, Proc.new { File.join(root, "views") }
    set :method_override, true

    configure :development do
      register Sinatra::Reloader
    end

    get "/" do
      products = FetchProductList.new.call
      erb :"products/index", locals: { products: products }
    end

    get "/products/:id" do |id|
      product = FetchProduct.new.call(id)
      halt 404 unless product
      erb :"products/show", locals: { product: product }
    end

    get "/basket" do
      basket_items = FetchBasketItems.new.call
      erb :"basket/show", locals: { items: basket_items }
    end

    post "/basket" do
      begin
        CreateBasketItem.new(params).call
        redirect "/basket"
      rescue KeyError
        halt 422
      end
    end

    put "/basket/update" do
      ChangeBasketItemQuantity.new(params).call
      redirect "/basket"
    end

    not_found do
      "This site does not exist! :("
    end

    error do
      "Application error. :( Please try later." + request.env["sinatra.error"].message
    end
  end
end
