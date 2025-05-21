class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end
  
  private

  def item_params
    params.require(:item).permit(:name,:description,:price,:category_id,:status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
    
  end
  
end
