class ItemsController < ApplicationController
  
  before_action :item_params

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    @item.save
  end

  private

  def item_params
    params.permit!
  end

end
