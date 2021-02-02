class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index,:same_user_index,:create]
  before_action :same_user_index, only: [:index]


  def index
    @order_address = OrderAddress.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(purchase_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :municipalities, :purchaser_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def same_user_index
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
