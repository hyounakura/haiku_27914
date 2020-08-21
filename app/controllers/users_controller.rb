class UsersController < ApplicationController
  def index
    @haikus = Haiku.where(['user_id LIKE(?)', "%#{current_user.id}%"])
  end

  def show
    @user = User.find(params[:id])
    @haikus = Haiku.where(['user_id LIKE(?)', "%#{params[:id]}%"])
  end

  def like

  end
end
