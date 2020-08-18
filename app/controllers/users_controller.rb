class UsersController < ApplicationController
  def index
    @haikus = Haiku.where(['user_id LIKE(?)', "%#{current_user.id}%"])
  end
end
