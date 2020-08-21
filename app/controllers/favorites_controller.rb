class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(['user_id LIKE(?)', "%#{current_user.id}%"]).limit(30)
  end

  def create
    @favorite = Favorite.new(user_id: current_user.id, haiku_id: params[:haikuId])
    if @favorite.save
      respond_to do |format|
        format.json
      end
    end
  end

  def destroy
    @haiku = Haiku.find(params[:haikuId])
    @favorite = Favorite.find(@haiku.favorite.id)
    if @favorite.destroy
      respond_to do |format|
        format.json
      end
    end
  end


  private

  def favorite_params
    params.merge(user_id: current_user.id, haiku_id: params[:haikuId])
  end
end
