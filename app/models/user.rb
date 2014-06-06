require 'bcrypt'

class User < ActiveRecord::Base

  	has_many :rounds

	def password=(plaintext)
		self.hashed_password = BCrypt::Password.create(plaintext)
	end
end
