class Rv < ApplicationRecord
  $RV_KIND = ["Standard", "Large", "Compact", "Truck camper"]
  $MAX_GUESTS = 8
  has_many :bookings
  has_attachment :photo
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :localisation, presence: true
  validates :kind, presence: true, inclusion: { in: $RV_KIND }
  validates :number_of_beds, presence: true, numericality: { only_integer: true, less_than_or_equal_to: $MAX_GUESTS }
  validates :number_of_guests, presence: true, numericality: { only_integer: true }
  validates :price_per_night, presence: true
  validates :min_stay, presence: true, numericality: { only_integer: true, greater_than: 1 }
  validate :guests_inf_to_beds
  geocoded_by :localisation
  after_validation :geocode

  def guests_inf_to_beds
    if number_of_beds.present? && number_of_guests.present? && number_of_guests > number_of_beds
      errors.add(:number_of_guests, "can't be more than number of beds")
    end
  end
end
