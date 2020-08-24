class HaikusController < ApplicationController
  def index
    latitude = params[:latitude]
    longitude = params[:longitude]
    distance = params[:distance]
    @haikus = Haiku.within_box(distance, latitude, longitude).order(id: :DESC).limit(100)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @haiku = Haiku.new
  end

  def create
    @haiku = Haiku.new(haiku_params)
    if @haiku.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @haiku = Haiku.find(params[:id])
    @fav_count = @haiku.favorites.count
  end

  def destroy
    @haiku = Haiku.find(params[:id])
    if @haiku.destroy
      redirect_to root_path
    end
  end

  private

  def haiku_params
    params.require(:haiku).permit(:kami, :naka, :simo).merge(user_id: current_user.id, latitude: params[:latitude], longitude: params[:longitude])
  end
end
