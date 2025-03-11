class RenameEyeCathWidthToEyecatchWidth < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles, :eye_catch_width, :eyecatch_width
  end
end
