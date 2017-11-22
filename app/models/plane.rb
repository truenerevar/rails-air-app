class Plane < ApplicationRecord
	belongs_to :airport
	has_many :passengers
end
