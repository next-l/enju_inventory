class InventoryFile < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :items, through: :inventories
  belongs_to :user

  if ENV['ENJU_STORAGE'] == 's3'
    has_attached_file :inventory, storage: :s3,
                                  s3_credentials: {
        access_key: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        bucket: ENV['S3_BUCKET_NAME']
      },
                                  s3_permissions: :private
  else
    has_attached_file :inventory,
      path: ":rails_root/private/system/:class/:attachment/:id_partition/:style/:filename"
  end
  validates_attachment_content_type :inventory, content_type: ['text/csv', 'text/plain', 'text/tab-separated-values']
  validates_attachment_presence :inventory

  paginates_per 10

  def import
    self.reload
    file = File.open(self.inventory.path)
    reader = file.read
    reader.split.each do |row|
      item = Item.where(item_identifier: row.to_s.strip).first
      if item
        unless self.items.where(id: item.id).select('items.id').first
          Inventory.create(
            inventory_file: self,
            item: item
          )
        end
      end
    end
    file.close
    true
  end

  def export(col_sep: "\t")
    file = Tempfile.create do |f|
      inventories.each do |inventory|
        f.write inventory.to_hash.values.to_csv(col_sep)
      end

      f.rewind
      f.read
    end

    file
  end

  def missing_items
    Item.where(Inventory.where('items.id = inventories.item_id AND inventories.inventory_file_id = ?', id).exists.not)
  end

  def found_items
    items
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
#  inventory_file_name    :string
#  inventory_content_type :string
#  inventory_file_size    :integer
#  inventory_updated_at   :datetime
#  inventory_fingerprint  :string
#
