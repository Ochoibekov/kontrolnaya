class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
  	def index
    	@posts = Post.paginate(:page => params[:page], :per_page => 10).order('id DESC') 
  	end
  
  	def show  
  		@post = Post.find(params[:id])
  	end 
  	
  	def my_profile
    
	    @user=User.find(params[:user_id])
	    @posts = @user.posts.paginate(:page => params[:page], :per_page => 10).order('id DESC')
	    @post=Post.new
    
  	end

  	def new
		@user=User.find(params[:user_id])
		@post = Post.new
  	end

	def create  
  		@post = Post.create(post_params)
  		redirect_to user_posts_path
	end 

	def destroy
		@post=Post.find(params[:id])
		@post.destroy
		redirect_to :back		
	end

	def edit
		@post = Post.find(params[:id])
		
	end
	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to root_url
		
	end
	

private


def post_params
	params.require(:post).permit(:image, :description, :user_id)
end
def set_post  
		@post = Post.find(params[:post_id])
end
end
