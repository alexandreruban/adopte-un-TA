class Course < ApplicationRecord
  belongs_to :user_id
  validates :title, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
end
