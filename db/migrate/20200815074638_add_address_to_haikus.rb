class AddAddressToHaikus < ActiveRecord::Migration[6.0]
  def change
    add_column :haikus, :address, :string
  end
end