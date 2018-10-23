class Venue < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: :true, uniqueness: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :business_type, presence: true
  validates :age_of_entry, presence: true
end
