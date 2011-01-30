class Unit < ActiveRecord::Base
  belongs_to :chemical
  belongs_to :location
  belongs_to :added_by, :class_name => User
  belongs_to :destroyed_by, :class_name => User
  belongs_to :changed_by, :class_name => User
end
