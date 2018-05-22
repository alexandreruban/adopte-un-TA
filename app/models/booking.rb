class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user_id, uniqueness: { scope: :course_id }

  def status
    approved? ? "Accepted" : "Waiting for the teacher's approval"
  end
end
