class AddCoords < ActiveRecord::Migration
  def change
  	add_column :posts, :latitude, :numeric
  	add_column :posts, :longitude, :numeric
  	add_column :users, :address, :string
  	add_column :posts, :address, :string
  end
end
