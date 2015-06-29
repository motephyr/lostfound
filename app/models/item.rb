class Item < ActiveRecord::Base

  def self.ransackable_attributes(auth_object = nil)
    super
  end
end
