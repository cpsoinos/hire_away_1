class Location < ActiveRecord::Base
  has_many :events

  validates :name, null: false
end
