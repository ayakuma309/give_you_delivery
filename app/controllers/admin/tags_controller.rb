class Admin::TagsController < Admin::BaseController
  before_action :set_tag, only: %i[edit update destroy]

  def index
    @tags = Tag.all
  end

  def edit; end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path, success: t('defaults.message.updated', item: Tag.model_name.human)
    else
      flash.now[:error] = t('defaults.message.not_created', item: Tag.model_name.human)
      render :edit
    end
  end

  def destroy
    @tag.destroy!
    redirect_to admin_tags_path, success: t('defaults.message.deleted', item: Tag.model_name.human)
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
