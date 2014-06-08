class User < ActiveRecord::Base
	has_many :logged_beers
	
	before_save { email.downcase! }
	before_create :create_remember_token
	
	validates :name, presence: { message: "Måste ange namn" }, length: { maximum: 50, message: "Max 50 tecken" }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: {message: "Måste ange e-post"}, format: { with: VALID_EMAIL_REGEX, message: "Ogiltig e-post" }, uniqueness: { case_sensitive: false, message: "E-postadressen finns redan registrerad" }
	has_secure_password
	validates :password, length: { minimum: 6, messaage: "Lösenordet måste bestå av minst 6 tecken." }
	
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
		end
end