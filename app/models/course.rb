class Course < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :title, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
end
