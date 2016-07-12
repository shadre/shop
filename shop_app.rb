require "bundler/setup"
require "sinatra/base"
require "sinatra/reloader"

Dir["./lib/**/*.rb"].each { |ruby_file| require ruby_file }
require "./db/seeds.rb"

module Shop
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
