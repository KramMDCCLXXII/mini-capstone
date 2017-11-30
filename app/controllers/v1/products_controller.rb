class V1::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index

    # products = Product.all
    products = Product.all.order(:id => :asc)
    user_search_terms = params[:search]
    if user_search_terms
      products =  products.where("name ILIKE ?", "%" + user_search_terms + "%")
    end
      # should_I_sort_by_price = params[:sort_by_price]
      # if should_I_sort_by_price == "true"
        
      # end

       
    render json: products.as_json
  end


  def show
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    render json: product.as_json
  end

  def create
    if current_user && current_user.admin 
      product = Product.new(
        name: params[:name],
        price: params[:price],
        description: params[:description],
        image: params[:image]
      )
      if product.save
        render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :bad_status
      end
    else  
      render json: {errors: "Not Authorised"}, status: unauthorised
    end
  end

  def update
    if current_user && current_user.admin
      product_id = params[:name]
      product = Product.find_by(id: product_id)
      product.name = params[:name]
      product.price = params[:price]
      product.description = params[:description] 
      product.image = params[:image]
      if product.save
        render json: product.as_json
      else 
        render json: {errors: product.errors.full_messages}, status: :bad_status
      end
    else render json: {erros: "Not Authorised"}, status: unauthorised
    end
  end
  def destroy
    if current_user && current_user.admin
      product_id = params[:id]
      product = Product.find_by(id: product_id)
      product.destroy
      render json: {message: "Product successfully destroyed!!"}
  
    end
  else  render json: {errors: "Not Authorised"}, status: unauthorised
  end

#   def params_method
#     product_id = params[input_product_id]
#     product = Product.find_by(id: product_id)
#     render json: product.as_json
#   end

end