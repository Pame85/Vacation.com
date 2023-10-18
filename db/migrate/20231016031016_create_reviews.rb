class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.integer :user_id
      t.string :reviewable_type
      t.integer :reviewable_id

      t.timestamps
    end
  end
end
