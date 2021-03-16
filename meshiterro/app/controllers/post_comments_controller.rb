class PostCommentsController < ApplicationController

# 4章で追加
def create
  post_image = PostImage.find(params[:post_image_id])
  comment = current_user.post_comments.new(post_comment_params)
  comment.post_image_id = post_image.id
  comment.save
  redirect_to post_image_path(post_image)
end


def destroy
 PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
    redirect_to post_image_path(params[:post_image_id])
end

# ４章で追加
private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end


end
