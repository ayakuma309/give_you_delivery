class DeliveriesController < ApplicationController
  skip_before_action :require_login, only: %i[show]
  before_action :set_delivery, only: %i[edit update destroy]

  def index
    @deliveries = current_user.deliveries
  end

  def show
    @delivery = Delivery.find(params[:id])
  end

  def create
    @delivery = current_user.deliveries.new(delivery_params)
    if @delivery.save
      redirect_to delivery_path(@delivery), success: t('defaults.message.created', item: Delivery.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Delivery.model_name.human)
      @items = Item.all
      render 'items/index'
    end
  end

  def edit; end

  def update
    if @delivery.update(delivery_params)
      redirect_to delivery_path(@delivery), success: t('defaults.message.updated', item: Delivery.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Delivery.model_name.human)
      render :edit
    end
  end

  def destroy
    @delivery.destroy!
    redirect_to deliveries_path, success: t('defaults.message.deleted', item: Delivery.model_name.human)
  end

  private
  def set_delivery
    @delivery = current_user.deliveries.find(params[:id])
  end

  def delivery_params
    params.require(:delivery).permit(:item_id, :comment, :addressee, :addresser)
  end

end
