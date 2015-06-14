class CommentsController < ApplicationController


  def index
    @comment = Comment.new
  end

  def create
    @pod = Pod.find params[:pod_id]
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new comment_params

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

end
