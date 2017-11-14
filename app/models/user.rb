class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rvs, dependent: :destroy
  has_many :bookings
  validates :first_name, presence: true, length: { minimum: 1 }
  validates :last_name, presence: true, length: { minimum: 1 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :phone_number, :with => /\A\+?[\d\s{1}\/\(\)\-]{8,}\Z/, :on => :create, :message=>  "must be more than 7 digits"
  validates :date_of_birth, presence: true
  validate :validate_age

  private

  def validate_age
    if date_of_birth.present? && date_of_birth > 18.years.ago.to_date
      errors.add(:date_of_birth, 'You should be over 18 years old.')
    end
  end
end
