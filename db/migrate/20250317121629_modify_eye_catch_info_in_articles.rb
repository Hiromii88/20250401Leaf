class ModifyEyeCatchInfoInArticles < ActiveRecord::Migration[7.0]
  def change
    # `image_alignment` カラムを削除
    remove_column :articles, :image_alignment, :string
    # `eyecatch_align` カラムを追加（デフォルト値 0、NULL不可）
    add_column :articles, :eyecatch_align, :integer, default: 0, null: false
  end
end
