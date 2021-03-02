class User < ActiveRecord::Base
    has_many :surf_spots
    has_many :boards
    has_secure_password
end