class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
    # @post_image = PostImage.new

     if @post_image.update(post_image_params)
        flash[:notice] = "更新しました。"
        redirect_to post_image_path(@post_image.id)
     else
        render :edit
     end

  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    flash[:notice] = "削除しました。"
    redirect_to post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:title, :image, :introduction, :address, :genre)
  end

end
