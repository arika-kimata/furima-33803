class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :status_id, :shipping_charges_id, :prefectures_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
