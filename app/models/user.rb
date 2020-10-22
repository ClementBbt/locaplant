class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, :first_name, :address, presence: true

  has_one_attached :photo

  has_many :plants, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookings_as_owner, through: :plants, source: :bookings
end
