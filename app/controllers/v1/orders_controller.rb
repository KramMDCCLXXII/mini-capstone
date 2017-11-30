class V1::OrdersController < ApplicationController
  before_action :authenticate_user
  def index
    orders = current_user.orders
    render json: orders.as_json
  end

  def create
    product = Product.find_by(id: params[:product_id])
    subtotal = product.price.to_f * params[:quantity].to_i
    tax = subtotal * 0.09
    total = subtotal + tax
    
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
      )
    if order.save
      render json: order.as_json
      # render json: {status: 'Order created successfully'}, status: :created
    else
      render json: {errors: order.errors.full_messages}, status: :bad_request
    end
  end
end



