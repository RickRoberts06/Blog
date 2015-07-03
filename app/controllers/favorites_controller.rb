class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_pod

  def index
    @users = @pod.favoriting_users
    @pods = @pod.favorite_for(current_user)
  end

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.pod = @pod
    if @favorite.save
      redirect_to root_path, notice: "Favorited"
    else
      render root_path, alert: "Not Favorited"
    end
  end

  def destroy
  @favorite = @pod.favorite_for(current_user)
  if @favorite.destroy
    redirect_to root_path, notice: "Un-Favorited"
  end
end

private

  def find_pod
    @pod = Pod.find params[:pod_id]
  end
end
