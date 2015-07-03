class CommentsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_comment, only: [:destroy, :edit]
  before_action :authorize, only: [:destroy, :edit]

  def index
    @comment = Comment.new
  end

  def create
    @pod = Pod.find params[:pod_id]
    @comment = current_user.comments.new comment_params
    @comment.pod = @pod
    if @comment.save
    CommentMailer.notify_pod_owner(@comment).deliver_now
    redirect_to root_path
    end
  end

  def edit
    @pod     = Pod.find params[:pod_id]
    @comment = Comment.find params[:id]
  end

  def update
         @comment = Comment.find params[:id]
      if @comment.update(comment_params)
        flash[:notice] = "Comment updated!"
        redirect_to root_path
      else
        flash[:alert] = "Oups something went wrong!"
        render :edit
      end
  end

  def destroy
    @comment = Comment.find params[:id]

    @comment.destroy
      flash[:notice] = "Comment deleted!"
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_comment
    @comment = Comment.find params[:id]
  end

  def authorize
    unless can? :manage, @comment
      redirect_to root_path, alert: "Access Denied!"
    end
  end

end
