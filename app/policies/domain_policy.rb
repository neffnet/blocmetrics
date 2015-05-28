class DomainPolicy < ApplicationPolicy
  def show?
    @user = @record.user
  end

  def destroy?
    show?
  end
end
