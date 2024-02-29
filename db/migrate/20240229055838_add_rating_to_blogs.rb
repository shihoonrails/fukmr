class AddRatingToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :rating, :string
  end
end
