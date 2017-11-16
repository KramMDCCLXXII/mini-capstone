class V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end
#   def params_method
#     product_id = params[input_product_id]
#     product = Product.find_by(id: product_id)
#     render json: product.as_json
#   end
end
