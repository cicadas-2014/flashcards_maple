require 'bcrypt'
class User < ActiveRecord::Base
    has_many :rounds
	validates :email, uniqueness: true
	validates :email, :hashed_password, presence: true
	
	def password=(plaintext)
		self.password_hash = BCrypt::Password.create(plaintext)
	end
end