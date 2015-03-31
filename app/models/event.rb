class Event < ActiveRecord::Base
  belongs_to :location
  has_many :timecards
  has_many :equipment_items
  has_many :dresscodes
  has_many :positions, through: :dresscodes

  validates :name,
    presence: true
  validates :start_time,
    presence: true
  validates :end_time,
    presence: true
  validates :location_id,
    presence: true
end
