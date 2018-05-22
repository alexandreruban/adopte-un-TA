class BookingPolicy < ApplicationPolicy

  def create?
    record.course.user != user
  end

  def destroy?
    record.user == user
  end


  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
