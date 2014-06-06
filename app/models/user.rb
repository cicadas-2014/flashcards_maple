class User < ActiveRecord::Base
  has_many :rounds
  validates :email, uniqueness: true
  validates :email, :hashed_password, presence: true
end
