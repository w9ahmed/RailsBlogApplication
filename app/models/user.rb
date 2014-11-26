class User < ActiveRecord::Base
	validates_uniqueness_of :email
	validates_length_of :email, :within => 5..50
	validates_format_of :email, :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2-4}$/i

	validates_length_of :password, :within => 6..16
	validates_confirmation_of :password

	has_one :profile
	has_many :articles, -> { order('published_at DESC, title ASC') }, :dependent => :nullify
	has_many :replies, :through => :articles, :source => :comments
end