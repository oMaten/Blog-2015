class PostsController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :destroy]
before_filter :admin_user, only: [:destroy, :edit, :update, :new, :index]
	def show
		@user = User.find(1);
		@post = Post.find(params[:id])
		@posts = @user.posts
		@replies = @post.replies
		@pre = Post.all(:having => ["created_at < ?", @post.created_at]).first
		@next = Post.all(:having => ["created_at > ?", @post.created_at]).last
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
      redirect_to @post
    else
      render 'edit'
    end
	end

	def new
		@user = current_user
		@post = current_user.posts.build(params[:post])
	end

	def destroy
		Post.find(params[:id]).destroy
    redirect_to :back
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
