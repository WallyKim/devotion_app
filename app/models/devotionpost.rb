class Devotionpost < ActiveRecord::Base
  belongs_to :category
  attr_accessible :address, :application, :bible_id, :content, :title, :intro, :title_en, :address_en, :content_en, :application_en, :intro_en
  
  validates :title, presence: true
  validates :address, presence: true
  validates :intro, :length => { :maximum => 200 }, presence: true
  validates :content, :length => { :maximum => 200 }, presence: true
  validates :application, :length => { :maximum => 200 }, presence: true
  validates :title_en, presence: true
  validates :address_en, presence: true
  validates :intro_en, :length => { :maximum => 200 }, presence: true
  validates :content_en, :length => { :maximum => 200 }, presence: true
  validates :application_en, :length => { :maximum => 200 }, presence: true
  
  default_scope order: 'devotionposts.created_at DESC'
end
