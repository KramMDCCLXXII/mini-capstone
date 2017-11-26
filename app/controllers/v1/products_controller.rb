class V1::ProductsController < ApplicationController
  def index
    products = Product.all
    products = Product.all.order(:id => :asc)
    user_search_terms = params[:search]
    if user_search_terms
      products =  products.where("name ILIKE ?", "%" + user_search_terms + "%")
    end
      # should_I_sort_by_price = params[:sort_by_price]
      # if should_I_sort_by_price == "true"
        
      # end

       
  end
  render json: products.as_json
end

def show
  product_id = params["id"]
  product = Product.find_by(id: product_id)
  render json: product.as_json
end

def create
  product = Product.new(
    name: params["input_name"],
    price: params["input_price"],
    description: params["input_description"],
    image: params["input_image"]
  )
  if product.save
    render jason: product.as_json
  else
    render json: {errors: product.errors.full_messages}, status: :bad_status
  end
end

def update
  product_id = params["id"]
  product = Product.find_by(id: product_id)
  product.name = params["input_name"]
  product.price = params["input_price"]
  product.description = params["input_description"] 
  product.image = params["input_image"]
  if product.save
    render json: product.as_json
  else 
    render json: {errors: product.errors.full_messages}, status: :bad_status
  end
end
def destroy
  product_id = params["id"]
  product = Product.find_by(id: product_id)
  product.destroy
  render json: {message: "Product successfully destroyed!!"}
end

#   def params_method
#     product_id = params[input_product_id]
#     product = Product.find_by(id: product_id)
#     render json: product.as_json
#   end

