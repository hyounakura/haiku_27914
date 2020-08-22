class FollowsController < ApplicationController
  def index
    @friends = Follow.where(['followed_id LIKE(?)', "%#{current_user.id}%"])
  end

  def create
    @user =User.find(params[:follow][:following_id])
    current_user.follow(@user)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = User.find(params[:follow][:following_id])
    current_user.unfollow(@user)
    respond_to do |format|
      format.js
    end
  end
end
