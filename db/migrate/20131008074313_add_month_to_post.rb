class AddMonthToPost < ActiveRecord::Migration
  def change
    add_column :posts, :month, :string
  end
end
