class Tutor < ApplicationRecord
  belongs_to :course

  validates :name, :title, :bio, :company, presence: true
end
