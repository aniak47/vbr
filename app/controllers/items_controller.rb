class ItemsController < ApplicationController
  before_action :logged_in_staff, only: [:new, :edit, :update, :create]
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "Item was created!"
      redirect_to '/store'
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
  end

  def show
  end
  
  private

    def item_params
      params.require(:item).permit(:name, :description, :price, :picture, :button)
    end
    
end
