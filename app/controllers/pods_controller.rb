class PodsController < ApplicationController

  def index
    @pods = Pod.all
    @comment = Comment.new
  end

  def new
    @pod = Pod.new
  end

  def create
    @pod = Pod.new(params.require(:pod).permit([:title, :body]))

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


end
