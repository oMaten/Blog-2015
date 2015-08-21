class RepliesController < ApplicationController
	before_filter :signed_in_user, only: [:create]
	def create
		@post = Post.find(params[:post_id])
		@reply = @post.replies.build(params[:reply])
		@reply.user = current_user
  	if @reply.save
  		respond_to do |format|
	      format.js
    	end
  	else
  		render 'static_pages/home'
  	end
	end

end
