class Devotionpost < ActiveRecord::Base
  belongs_to :category
  attr_accessible :address, :application, :bible_id, :content, :title, :intro
  
  validates :title, presence: true
  validates :address, presence: true
  validates :intro, :length => { :maximum => 200 }, presence: true
  validates :content, :length => { :maximum => 200 }, presence: true
  validates :application, :length => { :maximum => 200 }, presence: true
  
  default_scope order: 'devotionposts.created_at DESC'
end
