class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_pod

  def create
    @tag = Tag.new params[:tag_id]
    @tag.user = current_user
    @tag.pod = @pod
    if @tag.save
    redirect_to root_path, notice: "Post tagged"
    else
    redirect_to root_path, alert: "Can't tag"
    end
  end

  def destroy
    @tag = Tag.tag_for(current_user)
    @tag.destroy
    redirect_to root_path, notice: "Un-tagged"
  end

  private

  def find_pod
    @pod = Pod.find params[:pod_id]
  end
end
