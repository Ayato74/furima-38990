class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.image = params[:item][:image]
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :delivery_charge_id, :region_id, :num_of_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
