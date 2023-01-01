class ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @delivery = Delivery.new
  end
end
