class AddUserIdToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :blogs, :user, foreign_key: true unless column_exists?(:blogs, :user_id)
  end
end
