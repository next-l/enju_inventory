class InventoryFile < ActiveRecord::Base
  has_many :inventories, :dependent => :destroy
  has_many :items, :through => :inventories
  belongs_to :user
  validates_presence_of :user

  if Rails.application.config_for(:enju_leaf)["uploaded_file"]["storage"] == :s3
    has_attached_file :inventory, storage: :s3,
      s3_credentials: "#{Rails.application.config_for(:enju_leaf)["amazon"]}",
      s3_permissions: :private
  else
    has_attached_file :inventory,
      path: ":rails_root/private/system/:class/:attachment/:id_partition/:style/:filename"
  end
  validates_attachment_content_type :inventory, :content_type => ['text/csv', 'text/plain', 'text/tab-separated-values']
  validates_attachment_presence :inventory

  paginates_per 10

  def import
    self.reload
    file = File.open(self.inventory.path)
    reader = file.read
    reader.split.each do |row|
      item = Item.where(:item_identifier => row.to_s.strip).first
      if item
        unless self.items.where(:id => item.id).select('items.id').first
          self.items << item
        end
      end
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
#  filename               :string(255)
#  content_type           :string(255)
#  size                   :integer
#  user_id                :integer
#  note                   :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  inventory_file_name    :string(255)
#  inventory_content_type :string(255)
#  inventory_file_size    :integer
#  inventory_updated_at   :datetime
#  inventory_fingerprint  :string(255)
#

