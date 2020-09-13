class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new] # ログインしてないユーザーはnewアクション時にログイン画面に遷移

  def index
    # item（商品情報）の箱に入っているもの全てを表示させる
    @item = Item.all.order("created_at DESC")
  end

  def new
    # item（商品情報）を入れる箱の生成
    @item = Item.new
  end

  def create
    # item(初商品情報)を入れる箱の中に情報を入れてその情報を保存している
    @item = Item.new(item_params)
    # もし保存できたらトップ画面に遷移
    if @item.save
      redirect_to root_path
      # もし保存できなかったら商品登録画面（今のページに）遷移。しかし、入力している情報は入っているのでエラー設定も反映される。
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    else
      render :index
    end
  end

  # プライベートメソッド
  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :delivery_charge_id, :delivery_area_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
