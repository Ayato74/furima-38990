class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]


  def index
    @item = Item.find(params[:item_id])
    if @item.user == current_user
      redirect_to root_path
    else
      @orderaddress = OrderAddress.new
    end
  end

  def create
    @orderaddress = OrderAddress.new(order_params)
    if @orderaddress.valid?
    pay_item
    @orderaddress.save(params,current_user.id)
    redirect_to root_path
    else
    @item = Item.find(params[:item_id])
    render :index
    end
  end
      
    private

    def order_params
    params.require(:order_address).permit(:post_code, :region_id, :municipalities, :address_num, :building_name, :tel_num).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end