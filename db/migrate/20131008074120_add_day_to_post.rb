class AddDayToPost < ActiveRecord::Migration
  def change
    add_column :posts, :day, :string
  end
end
