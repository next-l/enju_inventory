class InventoryFile < ActiveRecord::Base
  has_many :inventories, dependent: :destroy
  has_many :items, through: :inventories
  belongs_to :user
  validates_presence_of :user

  include AttachmentUploader[:attachment]
  validates :attachment, presence: true, on: :create

  paginates_per 10

  def import
    self.reload
    file = File.open(inventory.download.path)
    reader = file.read
    reader.split.each do |row|
      item = Item.where(item_identifier: row.to_s.strip).first
      if item
        unless self.items.where(id: item.id).select('items.id').first
          self.items << item
        end
      end
    end
    file.close
    true
  end

  def set_fingerprint
    self.inventory_fingerprint = Digest::SHA1.file(inventory.download.path).hexdigest
  end
end

# == Schema Information
#
# Table name: inventory_files
#
#  id                     :integer          not null, primary key
#  filename               :string
#  content_type           :string
#  size                   :integer
#  user_id                :integer
#  note                   :text
#  created_at             :datetime
#  updated_at             :datetime
#  inventory_filename     :string
#  inventory_content_type :string
#  inventory_size         :integer
#  inventory_updated_at   :datetime
#  inventory_fingerprint  :string
#  inventory_id           :string
#
