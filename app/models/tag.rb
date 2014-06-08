class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :blogs, through: :taggings

  default_scope { order('name ASC') }

  def to_param
    name
  end
end
