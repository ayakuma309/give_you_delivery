class Admin::ItemsController < Admin::BaseController
  before_action :set_item, only: %w[edit update destroy]

  def index
    @items = Item.all.order(created_at: :desc).page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path, success: t('defaults.message.created', item: Item.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Item.model_name.human)
      render :new
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to admin_items_path, success: t('defaults.message.updated', item: Item.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Item.model_name.human)
      render :edit
    end
  end


  def destroy
    @item.destroy!
    redirect_to admin_items_path, success: t('defaults.message.deleted', item: Item.model_name.human)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :image)
  end
end
