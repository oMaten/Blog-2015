class Post < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user
  has_many :replies, dependent: :destroy
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true
  validates :user_id, presence: true
  default_scope order: 'posts.created_at DESC'
end
