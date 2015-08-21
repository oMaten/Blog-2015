class Reply < ActiveRecord::Base
  attr_accessible :content
  belongs_to :post
  belongs_to :user
  validates :content, presence: true, length: { maximum: 150 }
  validates :post_id, presence: true
  validates :user_id, presence: true
  default_scope order: 'replies.created_at ASC'
end
