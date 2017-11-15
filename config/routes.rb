Rails.application.routes.draw do
  get "/vape_url" => "products#all_products_method"

end
