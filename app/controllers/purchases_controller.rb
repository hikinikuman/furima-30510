class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
    if current_user.id == @item.user_id || @item.purchase.present?
        redirect_to root_path
      end 
    end


  def create

    @purchase_address = PurchaseAddress.new(address_params)
    @item = Item.find(params[:item_id])
    if @purchase_address.valid?
      pay_item 
      @purchase_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  #参考内容 donation_app (↓)

  #@user_donation = UserDonation.new(donation_params)   #「UserDonation」に編集
    #if @user_donation.valid?
      #@user_donation.save
      #redirect_to action: :index
    #else
      #render action: :new
    #end
  #end


  private

  #def address_params
    #params.require(:order).permit(:price).merge(token: params[:token])
  #end

    def address_params
      params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :phone_num).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
      #mergeにpurchase_idの内容は不要？
    end

  #参考内容 donation_app (↓)

      # 全てのストロングパラメーターを1つに統合
      #def donation_params
        #params.require(:user_donation).permit(:name, :name_reading, :nickname, :postal_code, :prefecture, :city, :house_number, :building_name, :price)
      #end

      #private

      #furimaの購入機能のカリキュラムではpermitから始める模様（↓）
      #def メソッド名
        #params.permit(指定のカラムを記述する)
      #end
  


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      #amount: address_params[:price],  # 商品の値段 ここの内容を一手間加えて,itemのpriceを入れる。
    # amount: item_params[:price],
      amount: @item.price,
      card: address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end