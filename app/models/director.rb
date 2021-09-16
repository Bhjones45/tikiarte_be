class Director < ApplicationRecord
  has_many :artists
  has_many :images, through: :artists
  validates :email, uniqueness: true, presence: true
end
