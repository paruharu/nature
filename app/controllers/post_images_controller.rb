class PostImagesController < ApplicationController

  before_action :set_q, only: [:index, :search]

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end
  
  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @user = @post_image.user
    @post_comment = PostComment.new
  end

  def edit
    @post_image = PostImage.find(params[:id])
    # @post_image.user_id = current_user.id
    # @post_image = PostImage.new
  end

  def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
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

  def search
    @results = @q.result
  end


  private

  def set_q
    @q = PostImage.ransack(params[:q])
    @post_images = @q.result(distinct: true)
  end

  def post_image_params
    # p "params"
    # p "params"
    # p params
    params.require(:post_image).permit(:title, :image, :introduction, :genre, :latitude, :longitude)
  end

end
