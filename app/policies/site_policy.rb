class SitePolicy < ApplicationPolicy
  def update?
    user.admin?
  end

  def remove_image?
    user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
