class PostsController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :show, :destroy]
before_filter :correct_user,   only: [:edit, :update]
before_filter :admin_user, only: :destroy
	def show
		@post = Post.find(params[:id])
	end

	def new
		@user = current_user
		@post = current_user.posts.build(params[:post])
	end

	def destroy
	end

	def index
		@user = current_user
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
