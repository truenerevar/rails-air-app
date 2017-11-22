class Airport < ApplicationRecord
	has_many :planes
	mount_uploader :avatar, AvatarUploader
end
