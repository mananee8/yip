class Business < ActiveRecord::Base
  acts_as_profile
  accepts_nested_attributes_for :user
  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
end
