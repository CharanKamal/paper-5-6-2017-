class User < ApplicationRecord
	
    before_save {self.email=email.downcase}
	validates :fname,presence: true,length: {maximum: 50}
	validates :lname,presence: true,length: {maximum: 50}
	validates :uname,presence: true,uniqueness: true,length: {maximum: 50}
	validates :email,presence: true,uniqueness: {case_sensitive: false},length: {maximum: 50}
	validates :password,presence: true,length: {minimum: 6}

	has_secure_password

	has_many :friendships, dependent: :destroy
	has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

	has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
	has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
	has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
	has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user

	def friends
	  active_friends | received_friends
	end

	def pending
		pending_friends | requested_friendships
	end

	def name
		email.split('@')[0].titleize
	end

end
