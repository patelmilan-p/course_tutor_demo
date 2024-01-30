class Course < ApplicationRecord
  has_many :tutors

  validates :name, :price, :duration, presence: true
end
