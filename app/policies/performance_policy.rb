class PerformancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    user.role == "manager"
  end
end
