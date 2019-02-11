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
#  id                     :bigint(8)        not null, primary key
#  filename               :string
#  content_type           :string
#  size                   :integer
#  user_id                :bigint(8)
#  note                   :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  inventory_file_name    :string
#  inventory_content_type :string
#  inventory_file_size    :integer
#  inventory_updated_at   :datetime
#  inventory_fingerprint  :string
#
