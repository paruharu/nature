class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id と同じ
    comment.post_image_id = post_image.id
    if comment.save
       redirect_to post_image_path(post_image)
    else
        @error_comment = comment
        @post_image = PostImage.find(params[:post_image_id])
        @post_comment = PostComment.new
        redirect_to post_image_path(post_image)
    end
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
