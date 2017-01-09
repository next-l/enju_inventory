class InventoryFile < ActiveRecord::Base
<<<<<<< HEAD
  has_many :inventories, dependent: :destroy
  has_many :items, through: :inventories
  belongs_to :user
  validates_presence_of :user

  include AttachmentUploader[:attachment]
=======
  include AttachmentUploader[:attachment]
  has_many :inventories, dependent: :destroy
  has_many :items, through: :inventories
  belongs_to :user
  validates :user, presence: true
>>>>>>> 1570fd2e76233bbf84d15be1c8710cd9a1e569fe
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
