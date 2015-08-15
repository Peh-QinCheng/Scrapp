class ItemsController < ApplicationController
  
  before_action :item_params

  def index
    @items = Item.where(deal: false)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    @item.save
    redirect_to items_path
  end

  def close_deal
    @item = Item.find(params[:id])
    @item.update_attribute(:deal, true)
    redirect_to root_path
  end

  private

  def item_params
    params.permit!
  end

end
