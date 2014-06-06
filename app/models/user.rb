class User < ActiveRecord::Base
  has_many :rounds
  validates :email, uniqueness: true
  validates :email, :hashed_password, presence: true
  validates :email, format: { with: /[\dA-Za-z]{2,}@[\dA-Za-z]{2,}\.[a-zA-Z]{2,3}/,
    message: "invalid e-mail" }
end
