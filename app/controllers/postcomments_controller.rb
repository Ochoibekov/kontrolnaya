class PostcommentsController < ApplicationController
  	before_action :set_post
def create
  @postcomment = @post.postcomments.build(postcomment_params)
  @postcomment.user_id = current_user.id
  if @postcomment.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  else
    flash[:alert] = "Check the comment form, something went wrong."
    render root_path
  end
end
def destroy
    @postcomment = @post.postcomments.find(params[:id])
    if @postcomment.user_id == current_user.id or @post.user==current_user
      @postcomment.delete
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
end
private
def postcomment_params  
  params.require(:postcomment).permit(:content)
end
def set_post  
  @post = Post.find(params[:post_id])
end  
end
