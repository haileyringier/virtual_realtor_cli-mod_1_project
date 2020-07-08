class House < ActiveRecord::Base 
    has_many :viewings
    has_many :clients, through: :reviews
end