class OdersController < ApplicationController

  before_action :authenticate_user!, only:[:index]#ログインしてないユーザーはindexアクション時にログイン画面に遷移

  def index
    @item = Item.find(params[:item_id])#購入する商品の情報を習得し、oderでも使えるようにしている
  end

  # def new
  #   @order = OrderBuy.new
  # end

  def create
    @order = OrderBuy.new(order_params)
    pay_item
    @order.save
    binding.pry
    if @order.valid?
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_buy).permit(:postalcode, :delivery_area_id, :municipalities, :address,
                                      :building, :phone, :token, :item_id, :buy_id)
  end

  def pay_item
    Payjp.api_key = "sk_test_9a03947f622f7f086dbb083e"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end