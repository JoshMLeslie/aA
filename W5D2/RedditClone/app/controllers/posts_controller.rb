class PostsController < ApplicationController
  before_action :redirect_unless_logged_in

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.sub_ids = params[:post][:sub_ids]
    @post.author_id = current_user.id
    # @post.sub_id = params[:sub_id]

    if @post.save
      redirect_to sub_url(params[:sub_id]) # @post.sub => @post.sub.id
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to sub_url(@post.sub)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
      @post = current_user.posts.find(params[:id])
      @post.destroy
      redirect_to sub_url(@post.sub)
  end

  def post_params
    params.require(:post).permit(
      :title,
      :url,
      :content,
      sub_ids: []
    )
  end
end
