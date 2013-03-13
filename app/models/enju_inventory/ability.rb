module EnjuInventory
  class Ability
    include CanCan::Ability

    def initialize(user, ip_address = nil)
      case user.try(:role).try(:name)
      when 'Administrator'
        can :manage, [
          Inventory,
          InventoryFile
        ]
      when 'Librarian'
        can :manage, [
          Inventory,
          InventoryFile
        ]
      end
    end
  end
end
