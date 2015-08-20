class UsersController < ApplicationController
before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
before_filter :correct_user,   only: [:edit, :update, :show, :post]
before_filter :admin_user, only: :destroy

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
  end

  def post
    @user = User.find(params[:id])
    @posts = Post.all(:conditions=>{:created_at=>(1.days.ago)..(Time.now)})
  end

  def update
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to @user
    else
      render 'show'
    end
  end

  private

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        redirect_to(root_path)
      end
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
