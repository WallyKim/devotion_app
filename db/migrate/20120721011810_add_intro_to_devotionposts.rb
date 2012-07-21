class AddIntroToDevotionposts < ActiveRecord::Migration
  def change
    add_column :devotionposts, :intro, :text
  end
end
