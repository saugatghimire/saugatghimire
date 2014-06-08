class Comment < ActiveRecord::Base
  belongs_to :blog

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :body, presence: true

  default_scope { order('created_at DESC') }
end
