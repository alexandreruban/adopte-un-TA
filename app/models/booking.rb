class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course

  def status
    approved? ? "Accepted" : "Waiting for the teacher's approval"
  end
end
