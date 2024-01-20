class CreateUploads < ActiveRecord::Migration[7.1]
  def change
    create_table :uploads do |t|
      t.string :image
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
