class BookingPolicy < ApplicationPolicy

  def create?
    record.course.user != user
  end

  def destroy?
    record.user == user
  end

  def update?
    destroy?
  end

  def my_bookings?
    true # To be changed
  end

  def update_approved?
    record.course.user == user
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
