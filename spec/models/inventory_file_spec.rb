require 'rails_helper'

describe InventoryFile do
  fixtures :users

  before(:each) do
    @file = InventoryFile.new attachment: File.open("#{Rails.root.to_s}/../../examples/inventory_file_sample.tsv")
    @file.user = users(:admin)
    @file.save
  end

  it "should be imported" do
    expect(@file.import).to be_truthy
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
