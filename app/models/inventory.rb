class Inventory < ActiveRecord::Base
  belongs_to :item
  belongs_to :inventory_file

  validates_associated :item, :inventory_file
  validates_presence_of :item, :inventory_file
  validates_uniqueness_of :item_id, scope: :inventory_file_id

  paginates_per 10
end

# == Schema Information
#
# Table name: inventories
#
#  id                :bigint(8)        not null, primary key
#  item_id           :uuid
#  inventory_file_id :uuid
#  note              :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
