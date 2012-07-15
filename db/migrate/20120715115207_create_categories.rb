class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
    add_index :categories, [:user_id, :created_at]
  end
end
