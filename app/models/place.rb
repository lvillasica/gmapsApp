class Place < ActiveRecord::Base
  validates_presence_of :place_name
  validates_presence_of :lat
  validates_presence_of :long

end
