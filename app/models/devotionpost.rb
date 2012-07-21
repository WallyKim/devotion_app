class Devotionpost < ActiveRecord::Base
  belongs_to :category
  attr_accessible :address, :application, :bible_id, :content, :title, :intro
  
  validates :intro, :length => { :maximum => 140 }
  validates :content, :length => { :maximum => 140 }
  validates :application, :length => { :maximum => 140 }
  
  default_scope order: 'devotionposts.created_at DESC'
end
