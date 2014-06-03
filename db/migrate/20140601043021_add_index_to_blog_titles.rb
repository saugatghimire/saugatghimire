class AddIndexToBlogTitles < ActiveRecord::Migration
  def change
    add_index :blogs, :title, unique: true
  end
end
