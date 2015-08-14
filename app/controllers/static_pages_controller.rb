class StaticPagesController < ApplicationController
  def home
  	@posts = User.find_by_id(1).posts
  end

  def help
  end
end
