Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :v1 do
    post "/user" => "users#create"
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end 
end 