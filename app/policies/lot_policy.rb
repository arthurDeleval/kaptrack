class LotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.role == "manager"
  end

  def update?
    user.role == "manager"
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def edit?
    update?
  end

  def destroy?
    user.role == "manager"
  end
end
