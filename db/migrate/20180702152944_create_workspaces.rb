class CreateWorkspaces < ActiveRecord::Migration[5.1]
  def change
    create_table :workspaces do |t|
      t.string :yelp_id
      t.string :name
      t.string :image_url
      t.string :yelp_url
      t.integer :rating
      t.integer :latitude
      t.integer :longitude
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :zip_code
      t.string :phone

      t.timestamps
    end
  end
end
