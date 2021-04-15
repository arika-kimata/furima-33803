class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :require_login]
  before_action :set_item, only: [:show, :edit, :update]


  def index
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :status_id, :shipping_charges_id, :prefectures_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def set_item
    @items = Item.find(params[:id])
  end
end
