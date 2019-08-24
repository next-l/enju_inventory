require 'rails_helper'

describe InventoryFile do
  fixtures :users

  before(:each) do
    @file = InventoryFile.create(user: users(:admin))
    @file.inventory.attach(io: File.new("#{Rails.root.to_s}/../../examples/inventory_file_sample.tsv"), filename: 'attachment.txt')
  end

  it "should be imported" do
    expect(@file.import).to be_truthy
  end
end

# == Schema Information
#
# Table name: inventory_files
#
#  id                     :bigint           not null, primary key
#  user_id                :bigint
#  note                   :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  inventory_file_name    :string
#  inventory_content_type :string
#  inventory_file_size    :integer
#  inventory_updated_at   :datetime
#  inventory_fingerprint  :string
#
