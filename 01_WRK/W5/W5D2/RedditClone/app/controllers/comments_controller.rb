class CommentsController < ApplicationController

  before_action :redirect_unless_logged_in
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.save

    flash[:errors] = @comment.errors.full_messages unless @comment.valid?

    redirect_to post_url(comment_params[:post_id])
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_url(params[:post_id])
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to post_url(@comment.post)
  end

  def comment_params
    params.require(:comment).permit(:content,:post_id, :parent_comment_id)
  end

end
