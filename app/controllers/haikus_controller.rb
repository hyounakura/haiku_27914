class HaikusController < ApplicationController
  def index
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

  private

  def haiku_params
    params.require(:haiku).permit(:kami, :naka, :simo).merge(user_id: current_user.id)
  end
end
