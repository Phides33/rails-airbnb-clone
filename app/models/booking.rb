class Booking < ApplicationRecord
  belongs_to :rv
  belongs_to :user
  validates :price, presence: true
  validates :check_in_on, presence: true
  validates :check_out_on, presence: true
  validates :status, presence: true, inclusion: { in: ["Pending", "Accepted"] }
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false }, numericality: { only_integer: true }
  validate :date_validation
  validate :date_is_past


  def date_validation
    if check_out_on.present? &&  check_in_on.present? && check_out_on < check_in_on
      errors.add(:check_out_on, "can't be before check-in")
    end
  end

  def date_is_past
    if check_in_on.present? && check_in_on < Date.today
      errors.add(:check_in_on, "can't be in the past")
    end
  end
end


