class InventoryFile < ActiveRecord::Base
  has_many :inventories, dependent: :destroy
  has_many :items, through: :inventories
  belongs_to :user
  validates :user, presence: true

  has_one_attached :inventory
  paginates_per 10

  def import
    inventory.download.split.each do |row|
      item = Item.find_by(item_identifier: row.to_s.strip)
      if item
        unless self.items.where(id: item.id).select('items.id').first
          self.items << item
        end
      end
    end
  end
end

# == Schema Information
#
# Table name: inventory_files
#
#  id         :uuid             not null, primary key
#  user_id    :bigint(8)        not null
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
