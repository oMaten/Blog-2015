class StaticPagesController < ApplicationController
  def home
  	@posts = Post.page(params[:page]).per(3);
  	respond_to do |format|
      format.html
    end 
  end

  def help
  end
end
