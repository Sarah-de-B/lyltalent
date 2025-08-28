class ChangeCategoryToArrayInEvents < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :category, :string, array: true, default: [], using: 'ARRAY[category]'
  end
end
