class Artist < ApplicationRecord
  belongs_to :director
  has_many :images
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true

  has_secure_password
end
