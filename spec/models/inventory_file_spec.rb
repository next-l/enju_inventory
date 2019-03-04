require 'rails_helper'

describe InventoryFile do
  fixtures :users

  before(:each) do
    @file = InventoryFile.create!(user: users(:admin))
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
#  id         :uuid             not null, primary key
#  user_id    :bigint(8)        not null
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
