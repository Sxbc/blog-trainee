class HomeController < ApplicationController
  layout "landing"
  skip_before_action :authenticate_user!
  def welcome
  end

  def special_dashboard
    if current_user.role == "admin"
      @posts = Post.all.order('created_at DESC')
    elsif current_user.role == "reviewer"
      @posts = Post.reviewing.order('created_at DESC')
    else
      @posts = current_user.posts.order('created_at DESC')
    end
  end
end
