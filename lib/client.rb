class Client < ActiveRecord::Base
    has_many :viewings
    has_many :houses, through: :viewings
end