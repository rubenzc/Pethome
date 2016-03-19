class Home < ActiveRecord::Base
	geocoded_by :address   # can also be an IP address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	# has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
	validates :address, presence: true
	# validates :avatar, attachment_presence: true, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end