class ItemsController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :item_text, :category_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, :item_price).merge(user_id: current_user.id)
  end


  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  
end
