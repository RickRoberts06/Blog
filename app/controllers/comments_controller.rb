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

  def destroy
    
  end

end
