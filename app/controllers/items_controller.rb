class ItemsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @delivery = Delivery.new
  end
end
