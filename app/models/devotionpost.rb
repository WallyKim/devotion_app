class Devotionpost < ActiveRecord::Base
  belongs_to :category
  attr_accessible :address, :application, :bible_id, :content, :title
  
  default_scope order: 'devotionposts.created_at DESC'
end
