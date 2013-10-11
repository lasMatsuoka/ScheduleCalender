class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :name
      t.string :date
      t.integer :price

      t.timestamps
    end
  end
end
