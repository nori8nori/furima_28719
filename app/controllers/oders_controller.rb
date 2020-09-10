class OdersController < ApplicationController

  before_action :authenticate_user!, only:[:index]#ログインしてないユーザーはindexアクション時にログイン画面に遷移

  def index
    @item = Item.find(params[:item_id])#購入する商品の情報を習得し、oderでも使えるようにしている
  end

  def new
    @oder = OderBuy.new
  end

  def create
    # binding.pry
    @oder = OderBuy.new(oder_params)
    
    pay_item
    @oder.save

    if @oder.valid?
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def oder_params
    params.permit(:postalcode, :delivery_area_id, :municipalities, :address, :building, :phone, :token, :item_id, :buy, :price)
    #params.require(:oder_buy).permit(:authenticity_token, :postalcode, :delivery_area_id, :municipalities, :address, :building, :phone, :token, :item_id)
    #params.require(:oder_buy).permit(:postalcode, :delivery_area_id, :municipalities, :address, :building, :phone, :token, :item_id, :buy_id)
    #params.permit(:postalcode, :delivery_area_id, :municipalities, :address, :building, :phone, :token, :item_id, :buy_id)
  end

  def pay_item
    Payjp.api_key = "sk_test_9a03947f622f7f086dbb083e"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: oder_params[:price],  # 商品の値段
      card: oder_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end