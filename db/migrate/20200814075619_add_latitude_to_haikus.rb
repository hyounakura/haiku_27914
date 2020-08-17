class AddLatitudeToHaikus < ActiveRecord::Migration[6.0]
  def change
    add_column :haikus, :latitude, :float
    add_column :haikus, :longitude, :float
  end
end
