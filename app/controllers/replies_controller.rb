class RepliesController < ApplicationController
	before_filter :signed_in_user, only: [:create]
	def create
		@post = Post.find(params[:post_id])
		@reply = @post.replies.build(params[:reply])
		@reply.user = current_user
  	if @reply.save
  		redirect_to @post
  	else
  		render 'static_pages/home'
  	end
	end

end
