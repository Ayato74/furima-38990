class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_edit, only: [:edit, :update]

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
    @user = @item.user
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :delivery_charge_id, :region_id, :num_of_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_edit
    unless user_signed_in? && current_user == @item.user
      redirect_to root_path
    end
  end

end