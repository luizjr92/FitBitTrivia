class User < ActiveRecord::Base
  has_many :engagements
  has_many :goals, through: :memberships

  validates :name
end
