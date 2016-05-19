class User < ActiveRecord::Base
	has_many :dogs
	has_many :created_playdates, foreign_key: :creator_id

	validates :username, :first_name, :last_name, :email, :password_hash, presence: true
	validates :username, :email, uniqueness: true


	def password
		@password ||= BCrypt::Password.new(password_hash)
	end

	def password=(new_password)
		@password = BCrypt::Password.create(new_password)
		self.password_hash = @password
	end

	def self.authenticate(username, password)
		user = User.find_by(username: username)
		user && user.password == password ? user : nil
	end
end
