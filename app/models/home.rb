class Home < ActiveRecord::Base
	geocoded_by :address   # can also be an IP address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
	validates :address, presence: true

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end