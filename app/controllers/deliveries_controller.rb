class DeliveriesController < ApplicationController
  def index
    @deliveries = current_user.deliveries
  end

  def show
    @delivery = current_user.deliveries.find(params[:id])
  end

  def create
    @delivery = current_user.deliveries.new(delivery_params)
    if @delivery.save
      redirect_to delivery_path(@delivery), success: t('defaults.message.created', item: Delivery.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Delivery.model_name.human)
      render :index
    end
  end

  def update

  end

  def destroy

  end

  private

  def delivery_params
    params.require(:delivery).permit(:item_id, :comment, :addressee, :addresser)
  end

end
