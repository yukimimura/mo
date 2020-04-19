class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.integer :review
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
