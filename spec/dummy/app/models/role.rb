class Role < ActiveRecord::Base
  def self.default_role
    Role.where(:name => 'Guest').first
  end
end
