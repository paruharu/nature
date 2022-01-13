class CreatePostImages < ActiveRecord::Migration[5.0]
  def change
    create_table :post_images do |t|
      t.text :title
      t.string :post_image_id
      t.text :introduction
      t.string :genre
      t.text :address
      t.integer :user_id

      t.timestamps
    end
  end
end
