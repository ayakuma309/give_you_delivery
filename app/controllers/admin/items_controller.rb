class Admin::ItemsController < Admin::BaseController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all.order(created_at: :desc).page(params[:page])
  end

  def show; end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    tag_list = params[:item][:tag_name].split(',').uniq
    if @item.save
      @item.save_tags(tag_list)
      redirect_to admin_items_path, success: t('defaults.message.created', item: Item.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_created', item: Item.model_name.human)
      render :new
    end
  end

  def edit
    @tag_list = @item.tags.pluck(:name).join(',')
  end

  def update
    tag_list = params[:item][:tag_name].split(',').uniq
    if @item.update(item_params)
      @item.save_tags(tag_list)
      redirect_to admin_items_path, success: t('defaults.message.updated', item: Item.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_updated', item: Item.model_name.human)
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
