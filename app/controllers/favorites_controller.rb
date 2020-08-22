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
    favorites = @haiku.favorites
    favorites.each do |favorite|
      if favorite.user_id == current_user.id
        @favorite = Favorite.find(favorite.id)
      end
    end
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
