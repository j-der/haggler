class AddPosts < ActiveRecord::Migration
  def change
    create_table :posts do |t| 
      t.string :title
      t.string :description 
      t.string :image_url
      t.references :users, index: true 
      t.timestamps null: false
    end
  end
end
