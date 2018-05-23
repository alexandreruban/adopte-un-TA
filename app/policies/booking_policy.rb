class BookingPolicy < ApplicationPolicy

  def create?
    record.course.user != user
  end

  def destroy?
    record.course.user == user
  end

  def update?
    destroy?
  end

  def update_approved?
    update?
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
