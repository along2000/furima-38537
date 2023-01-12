class ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item.create(item_params)
    @item.save
  end
  def create
    @item = Item.new(item_params)
     if @item.save
       redirect_to root_path
     else
      render :new
     end
    end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :text, :category_id, :status_id, :delivery_charge_id, :delivery_date_id, :delivery_source_id).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to  '/users/sign_in'
    end
  end

end
