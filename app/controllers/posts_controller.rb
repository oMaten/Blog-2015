class PostsController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :show, :destroy]
before_filter :correct_user,   only: [:edit, :update]
before_filter :admin_user, only: :destroy
	def show

	end

	def create

	end

	def destroy

	end

	def index
		@user = current_user
	end
end
