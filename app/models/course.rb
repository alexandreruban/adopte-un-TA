class Course < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
  validate :begin_date_must_be_before_end_date

  def begin_date_must_be_before_end_date
    if end_date.class == Date && begin_date.class == Date && end_date < begin_date
      errors.add(:end_date, "can't be greater than total value")
    end
  end
end
