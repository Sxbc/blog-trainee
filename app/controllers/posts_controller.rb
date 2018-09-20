class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
