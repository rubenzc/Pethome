class Home < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
	validates :address, presence: true

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: '/images/:style/missing.png'
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end