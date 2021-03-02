class User < ActiveRecord::Base
    has_many :breaks
    has_many :boards
    has_secure_password
end