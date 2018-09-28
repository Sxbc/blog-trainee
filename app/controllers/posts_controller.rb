class PostsController < ApplicationController
  load_and_authorize_resource param_method: :post_params

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  def index
    @posts = Post.published.order('created_at DESC')
  end

  def review
    @post.review!
    redirect_to posts_path
  end

  def publish
    @post.publish!
    redirect_to posts_path
  end

  def cancel
    @post.cancel!
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
