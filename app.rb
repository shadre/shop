# This file will be moved to /shop/ directory later on.
# I had some issues with changing a root in Sinatra when trying to move it.
# So for now I'm leaving it here and will change it later.

require "bundler/setup"
require "sinatra/base"
require "sinatra/reloader"

Dir["./lib/**/*.rb"].each { |path| require path }
require_relative "./db/seeds.rb"

module Shop
  PRODUCTS = []
  BASKET_ITEMS = []
  WAREHOUSE_ITEMS = []

  Products_to_seed.each do |product|
    PRODUCTS << product
  end

  class App < Sinatra::Base
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
        redirect "/"
      rescue KeyError
        halt 422
      end
    end

    not_found do
      "This site does not exist! :("
    end

    error do
      "Application error. :( Please try later." + request.env["sinatra.error"].message
    end
  end
end
