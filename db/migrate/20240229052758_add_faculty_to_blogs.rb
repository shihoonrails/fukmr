class AddFacultyToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :faculty, :string
  end
end
