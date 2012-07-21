class Category < ActiveRecord::Base
  attr_accessible :title, :guide #:bible_id 컨텐츠 플로우 수정되면서 
  
  belongs_to :user
  
  validates :title, presence: true
  validates :user_id, presence: true
  # validates :bible_id, presence: true
  validates :guide, presence: true
  
  has_many :devotionposts, dependent: :destroy
  
  # default_scope order: 'categories.bible_id ASC'
  default_scope order: 'categories.created_at DESC'
end
