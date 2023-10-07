class ItemsController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    #@items = Item.new
  end



  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
