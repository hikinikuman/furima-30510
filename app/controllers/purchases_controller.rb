class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_find, only: [:index, :create]
  before_action :redirect_contents, only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(address_params)
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

  def item_find
    @item = Item.find(params[:item_id])
  end

  def redirect_contents
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase.present?
  end
end
