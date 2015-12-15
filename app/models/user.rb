class User < ActiveRecord::Base
	has_many :posts, class_name: 'Post'

	has_secure_password

	validates_presence_of :email, uniqueness: true
end
