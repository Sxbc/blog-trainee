class HomeController < ApplicationController
  def welcome
  end

  def special_dashboard
    if current_user.role == "admin"
      @posts = Post.all
    elsif current_user.role == "reviewer"
      @posts = Post.reviewing
    else
      @posts = current_user.posts
    end
  end
end
