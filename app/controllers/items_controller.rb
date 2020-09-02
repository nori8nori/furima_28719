class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  def checked

  end

  #プライベートメソッド
  private

  #画像の保存を許可する設定
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
