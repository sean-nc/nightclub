class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  validates :email, presence: :true, uniqueness: true
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username
  validates :date_of_birth, presence: :true
  validates :location, presence: :true
  validates :mobile, presence: :true
  validates :gender, presence: :true
  validate :validate_age

  attr_writer :login

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def validate_age
    if date_of_birth.present? && date_of_birth > Date.today - 18.years
      errors.add(:date_of_birth, "Sorry, you are not old enough")
    end
  end
end
