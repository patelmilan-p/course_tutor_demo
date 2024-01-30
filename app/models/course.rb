class Course < ApplicationRecord
  has_many :tutors

  accepts_nested_attributes_for :tutors, reject_if: :all_blank

  validates :name, :price, :duration, presence: true
end
