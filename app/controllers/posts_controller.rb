class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
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

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path, notice: "Update successful"
    else
      render :edit
    end
  end

  def index
    @posts = Post.published.order('created_at DESC')
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post destroyed"
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

  def format_post
    @post = Kramdown::Document.new(params[:raw_post], kramdown_options).to_html.html_safe
    respond_to do |format|
      format.json { render json: @post.to_json }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find params[:id]
  end

  def kramdown_options
    {
      hard_wrap: false
    }
  end
end
