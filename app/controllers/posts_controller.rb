class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
  def index
  	@posts=Post.all
    
  end
  
  def show  
  @post = Post.find(params[:id])
  end 
  

  def new
	@user=User.find(params[:user_id])
	@post = Post.new
  end

	
	

private


def post_params
	params.require(:post).permit(:image, :description, :user_id)
end
def set_post  
		@post = Post.find(params[:post_id])
end
end
