Rails.application.routes.draw do
  namespace :v1 do
    get "/products" => "products#index"
    get "/params_url" => "products#params_method"
  end 
end
