class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase.present?
  end

  def create
    @purchase_address = PurchaseAddress.new(address_params)
    @item = Item.find(params[:item_id])
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end



  private



  def address_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_num).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])

  end



  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(

      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'                
    )
  end
end
