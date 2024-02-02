class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    
    puts @item.inspect
    if @item.save
      redirect_to root_path
    else
      puts @item.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:title,:expantion,:category_id, :status_id, :delivery_cost_id, :schedule_id, :prefecture_id, :price, :image)
  end

  def set_item
    # @item = item.find(params[:id])
  end

  def move_to_index
    # unless current_user == @item.user
    #  redirect_to action: :index
    # end
  end
end
