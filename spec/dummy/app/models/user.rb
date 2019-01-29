class User < ActiveRecord::Base
  devise :database_authenticatable, # :registerable,
    :recoverable, :rememberable, # :validatable
    :lockable, lock_strategy: :none, unlock_strategy: :none

  include EnjuSeed::EnjuUser
end

Item.include(EnjuInventory::EnjuItem)
