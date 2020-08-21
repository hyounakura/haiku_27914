class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :haiku, null: false, foreign_key: true
      t.timestamps
      t.index [:user_id, :haiku_id], unique: true
    end
  end
end
