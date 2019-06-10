class PostsController < ApplicationController
  before_action :post_setup, only:[:edit,:update,:destroy]
  

  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post

    else
      render :new
    end

  end

  def show
    @post = Post.find(params[:id])
    @good = Good.find_by(user_id: current_user.id, post_id: params[:id])
  end

  def edit
  end

  def update
    
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:name,:description,:url)
  end

  def post_setup
    if current_user.admin?
      @post = Post.find(params[:id])
    else
      @post = current_user.posts.find(params[:id])
    end
  end

  


  




end
