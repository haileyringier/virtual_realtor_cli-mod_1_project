class Viewing < ActiveRecord::Base 
    belongs_to :client
    belongs_to :house
end