class AddEnglishToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :title_en, :string
    add_column :categories, :guide_en, :text
  end
end
