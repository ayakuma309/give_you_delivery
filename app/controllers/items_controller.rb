class ItemsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @delivery = Delivery.new
  end

  def search
    if (tag_name = params[:tag_name])
      @items = Item.with_tag(tag_name)
      @tag = Tag.find_by(name: tag_name)
    else
      @items = Item.all.page(params[:page])
    end
  end
end
