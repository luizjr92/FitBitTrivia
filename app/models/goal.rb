class Goal < ActiveRecord::Base
  has_many :engagements
  has_many :users, through: :engagements

  validates :name

end
