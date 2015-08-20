class PostsController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :destroy]
before_filter :correct_user,   only: [:edit, :update]
before_filter :admin_user, only: :destroy
	def show
		@user = User.find(1);
		@post = Post.find(params[:id])
		@posts = @user.posts
		@replies = @post.replies
		@pre = Post.find_by_id(@post.id-1)
		@next = Post.find_by_id(@post.id+1)
	end

	def new
		@user = current_user
		@post = current_user.posts.build(params[:post])
	end

	def destroy
		Post.find(params[:id]).destroy
    redirect_to posts_path
	end

	def index
		@user = current_user
		@posts = current_user.posts.page(params[:page]).per(10)
	end

	def create
		@user = current_user
		@post = current_user.posts.build(params[:post])
  	if @post.save
  		redirect_to current_user
  	else
  		render 'new'
  	end
	end

	private
		def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
