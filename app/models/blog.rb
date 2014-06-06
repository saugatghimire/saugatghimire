class Blog < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true
  validates :body, presence: true

  default_scope { order('created_at DESC') }

  before_save { self.url = self.title.split(' ').join('_').downcase }

  def to_param
    url
  end
end
