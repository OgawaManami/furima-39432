class ItemsController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  # def update
  #   @item.update(item_params)
  #   if @item.valid?
  #     redirect_to item_path(item_params)
  #   else
  #     render "edit"
  #   end
  # end

  # def destroy
  #   if @item.destroy
  #     redirect_to root_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_text, :category_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, :item_price).merge(user_id: current_user.id)
  end  

  def set_item
    @item = Item.find(params[:id])
  end

end
