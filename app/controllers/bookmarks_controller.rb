class BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmark_deliveries
  end

  def create
    delivery = Delivery.find(params[:delivery_id])
    bookmark = current_user.bookmarks.new(delivery_id: delivery.id)
    bookmark.save
    redirect_to bookmarks_path, success: '保存しました'
  end

  def destroy
    delivery = Delivery.find(params[:delivery_id])
    bookmark = current_user.bookmarks.find_by(delivery_id: delivery.id)
    bookmark.destroy
    redirect_to delivery_path(delivery), success: '外しました'
  end
end
