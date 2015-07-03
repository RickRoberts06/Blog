class PodsController < ApplicationController
   before_action :find_pod, only: [:edit, :update, :destroy, :show]
   before_action :authorize, only: [:destroy, :edit]

  def index
    @pods = Pod.all
    @comment = Comment.new
    @pods = Pod.page(params[:page]).per(10)
  end

  def new
    @pod = Pod.new
  end

  def show
    @comment = Comment.all
     @pod = Pod.find params[:id]
     @favorite = @pod.favorite_for(currrent_user)
  end

  def create
    @pod = Pod.new(params.require(:pod).permit([:title, :body, :user_id]))
    @pod.user = current_user
    if @pod.save
      flash[:notice] = "Your post have been saved!"
      redirect_to root_path
    else
      flash[:alert] = "Oupss, something went wrong. Please try again. "
      render :new
    end
  end

  def edit
    @pod = Pod.find params[:id]
  end

  def update
    @pod = Pod.find(params[:id])
    if @pod.update(params.require(:pod).permit([:title, :body]))
      redirect_to root_path
      flash[:notice] = "Your post have been updated!"
    else
      flash[:alert] = "Oupss, something went wrong! Please try again."
      render :edit
    end
  end

  def destroy
    @pod = Pod.find(params[:id])

    if @pod.destroy
      flash[:notice] = "You post have been destroy"
      redirect_to root_path
    else
      flash[:alert] = "Oups, something went wrong!"
      render :delete
    end
  end

  def find_pod
    @pod = Pod.find params[:id]
  end

  def authorize
    unless can? :manage, @pod
      redirect_to root_path, alert: "Access Denied"
    end
  end

  def find_pod
    @pod = Pod.find params[:id]
  end

end
