class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :pet_name, null: false
      t.text :pet_explanation, null: false

      t.timestamps
    end
  end
end
