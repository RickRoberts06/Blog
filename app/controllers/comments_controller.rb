class CommentsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_comment, only: [:destroy, :edit]
  before_action :authorize, only: [:destroy, :edit]

  def index
    @comment = Comment.new
  end

  def create
    @pod = Pod.find params[:pod_id]
    # @user = User.find params[:user_id]
    comment_params = params.require(:comment).permit(:body)
    @comment = current_user.comments.new comment_params
    #@comment = Comment.new comment_params

#   @comment.pod_id = @pod_id (for reference)
    @comment.pod = @pod
    if @comment.save


    redirect_to root_path
    end
  end

  def edit
    @pod     = Pod.find params[:pod_id]
    @comment = Comment.find params[:id]
  end

  def update
    # @pod              = Pod.find params[:pod_id]
    @comment          = Comment.find params[:id]
    # comment_params    = params.require(:comment).permit(:body)

      if @comment.update(params.require(:comment).permit(:body))
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

  def find_comment
    @comment = Comment.find params[:id]
  end

  def authorize
    unless can? :manage, @comment
      redirect_to root_path, alert: "Access Denied!"
    end
  end

end
