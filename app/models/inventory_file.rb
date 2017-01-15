class InventoryFile < ActiveRecord::Base
  include AttachmentUploader[:attachment]
  has_many :inventories, dependent: :destroy
  has_many :items, through: :inventories
  belongs_to :user
  validates :user, presence: true
  validates :attachment, presence: true, on: :create

  paginates_per 10

  def import
    reload
    file = File.open(attachment.download.path)
    reader = file.read
    reader.split.each do |row|
      item = Item.where(item_identifier: row.to_s.strip).first
      next unless item
      items << item unless items.where(id: item.id).select('items.id').first
    end
    file.close
    true
  end
end

# == Schema Information
#
# Table name: inventory_files
#
#  id                    :integer          not null, primary key
#  filename              :string
#  content_type          :string
#  size                  :integer
#  user_id               :integer
#  note                  :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  inventory_fingerprint :string
#  attachment_data       :jsonb
#
