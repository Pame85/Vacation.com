class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :property_type
      t.integer :price
      t.string :location
      t.text :description
      t.integer :rooms
      t.integer :capacity
      t.references :user, null: false, foreign_key: true
      t.boolean :available
      t.float :average_rating

      t.timestamps
    end
  end
end
