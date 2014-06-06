class AddUrlToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :url, :string
    add_index :blogs, :url, unique: true
  end
end
