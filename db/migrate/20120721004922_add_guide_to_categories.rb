class AddGuideToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :guide, :text
  end
end
