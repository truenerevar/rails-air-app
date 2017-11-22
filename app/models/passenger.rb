class Passenger < ApplicationRecord
	belongs_to :plane
	has_many :bags
end
