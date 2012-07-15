class Category < ActiveRecord::Base
  attr_accessible :title
  
  belongs_to :user
  
  validates :title, presence: true
  validates :user_id, presence: true
  
  default_scope order: 'categories.created_at DESC'
end
