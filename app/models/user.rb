class User < ApplicationRecord
  has_secure_password

  has_many :campaigns, dependent: :destroy
  has_many :signups, dependent: :destroy
  has_many :plays, through: :signups, source: :campaign

  validates :name, presence: true
  validates :email, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end
