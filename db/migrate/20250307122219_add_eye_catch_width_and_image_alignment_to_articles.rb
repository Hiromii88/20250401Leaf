class AddEyeCatchWidthAndImageAlignmentToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :eye_catch_width, :integer
    add_column :articles, :image_alignment, :string
  end
end
