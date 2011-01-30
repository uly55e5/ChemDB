class Location < ActiveRecord::Base
  has_many :units
  belongs_to :changed_by, class_name => "User"
end
