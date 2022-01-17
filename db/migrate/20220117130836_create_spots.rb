class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :post_image_id, foreign_key: true

      t.timestamps
    end
  end
end
