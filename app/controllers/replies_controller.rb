class RepliesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :index, :destroy]
	before_filter :admin_user, only: [:index, :destroy]
	def create
		@post = Post.find(params[:post_id])
		@reply = @post.replies.build(params[:reply])
		@reply.user = current_user
  	if @reply.save
  		UserMailer.remind_reply(current_user, @reply).deliver
  		respond_to do |format|
	      format.js
    	end
  	else
  		render 'static_pages/home'
  	end
	end

	def index
		@post = Post.find(params[:post_id])
		@replies = @post.replies.page(params[:page]).per(10)
	end

	def destroy
		Reply.find(params[:id]).destroy
    redirect_to posts_path
	end
	private
		def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end