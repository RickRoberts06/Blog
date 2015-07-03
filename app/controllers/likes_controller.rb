class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_pod

  def index
    @users = @pod.liking_users
  end

  def create
    @like = Like.new params[:tag_id]
    @like.user = current_user
    @like.pod = @pod
    if @like.save
      redirect_to root_path, notice: "Liked"
    else
      redirect_to root_path, alert: "Can't Like"
    end
  end

  def destroy
    @like = @pod.like_for(current_user)
    @like.destroy
      redirect_to root_path, notice: "Un-Liked"
  end

  private

  def find_pod
    @pod = Pod.find params[:pod_id]
  end
end
