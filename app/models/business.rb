class Business < ActiveRecord::Base
  acts_as_profile
  accepts_nested_attributes_for :user
end
