class Home < ActiveRecord::Base
	geocoded_by :address   # can also be an IP address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	validates :address, presence: true
	validates :postcode, presence: true
end