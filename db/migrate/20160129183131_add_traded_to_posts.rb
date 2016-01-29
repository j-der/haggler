class AddTradedToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :traded, :boolean, default: false
  end
end
