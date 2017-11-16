Rails.application.routes.draw do
  namespace :v1 do
    get "/all_products_url" => "products#all_products_method"
  end 
end
