class User < ActiveRecord::Base
	has_many :dogs, foreign_key: :owner_id
	has_many :created_playdates, {class_name: "Playdate", foreign_key: :creator_id}

	validates :username, :first_name, :last_name, :email, :password_hash, presence: true
	validates :username, uniqueness: true
	validates :email, uniqueness: true, format: { with: /\A.+@.+\..+/, message: "please add valid password e.g. doge@wow.plz" }


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
