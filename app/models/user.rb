class User < ActiveRecord::Base
    has_many :breaks
    has_many :boards
    has_many :leashes
    has_secure_password
    validates_uniqueness_of :username
    validates_presence_of :username
    validates_presence_of :email
end