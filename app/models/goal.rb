class Goal < ActiveRecord::Base

=begin
  validates :title, presence: true,
            length: { minimum: 5 }

  validates :description, presence: true,
            length: { minimum: 5 }
=end

end
