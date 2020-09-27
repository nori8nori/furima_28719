class OdersController < ApplicationController
  before_action :authenticate_user!, only: [:index] # ログインしてないユーザーはindexアクション時にログイン画面に遷移
  before_action :set_item, only: [:index, :create]

  def index
    @oder = OderBuy.new
  end

  def create
    @oder = OderBuy.new(oder_params)
    if @oder.valid?
      pay_item
      @oder.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def oder_params
    params.require(:oder_buy).permit(:postalcode, :delivery_area_id, :municipalities, :address, :building, :phone,
                                     :token).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: oder_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id]) # 購入する商品の情報を習得し、oderでも使えるようにしている
  end
end
