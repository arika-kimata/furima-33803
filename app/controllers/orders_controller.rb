class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if user_signed_in? && current_user.id != @item.user_id && @item.order == nil
      @order_item = OrderItem.new
    else
      redirect_to root_path
    end
  end

  def create
    @order_item = OrderItem.new(order_params)
    if @order_item.valid?
      pay_item
      @order_item.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:postcode, :prefectures_id, :municipality, :municipality, :address, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      charge = Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end
end