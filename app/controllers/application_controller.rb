class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :pick_out_ward, :pick_out_city, :pick_out_prefecture

  def pick_out_ward(address)
    num = address.index(',')
    address.slice(0, num)
  end

  def pick_out_city(address)
    ward_num = address.index(',')
    num = address.index(',', (ward_num + 1))
    address.slice((ward_num + 2), ((num - 1) - (ward_num + 1)))
  end

  def pick_out_prefecture(address)
    ward_num = address.index(',')
    city_num = address.index(',', (ward_num + 1))
    num = address.index(',', (city_num + 1))
    address.slice((city_num + 2), ((num - 1) - (city_num + 1)))
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
