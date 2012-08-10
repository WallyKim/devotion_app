class AddEnglishToDevotionposts < ActiveRecord::Migration
  def change
    add_column :devotionposts, :title_en, :string
    add_column :devotionposts, :address_en, :string
    add_column :devotionposts, :content_en, :text
    add_column :devotionposts, :application_en, :text
    add_column :devotionposts, :intro_en, :text
  end
end
