class InventoryPolicy < AdminPolicy
  def index?
    user.try(:has_role?, 'Librarian')
  end

  def create?
    user.try(:has_role?, 'Administrator')
  end

  def destroy?
    user.try(:has_role?, 'Administrator')
  end
end
