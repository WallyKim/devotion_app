class CreateDevotionposts < ActiveRecord::Migration
  def change
    create_table :devotionposts do |t|
      t.string :title
      t.string :address
      t.text :content
      t.text :application
      t.integer :bible_id
      t.references :category

      t.timestamps
    end
    add_index :devotionposts, :category_id
  end
end
