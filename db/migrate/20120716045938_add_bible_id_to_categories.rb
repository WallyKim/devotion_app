class AddBibleIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :bible_id, :integer
  end
end
