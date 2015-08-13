class PostsController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :show, :destroy]
before_filter :correct_user,   only: [:edit, :update]
before_filter :admin_user, only: :destroy
	def show
		@user = current_user
		@post = Post.find(params[:id])
		@replies = @post.replies
		@pre = Post.find_by_id(@post.id-1)
		@next = Post.find_by_id(@post.id+1)
	end

	def new
		@user = current_user
		@post = current_user.posts.build(params[:post])
	end

	def destroy
	end

	def index
		@user = current_user
		@posts = current_user.posts.page(params[:page]).per(5)
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
end
