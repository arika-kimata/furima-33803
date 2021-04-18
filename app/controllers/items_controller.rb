class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :require_login]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    redirect_to '/users/sign_in' unless @item.user_id == current_user.id
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :status_id, :shipping_charges_id,
                                 :prefectures_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @items = Item.find(params[:id])
  end
end
