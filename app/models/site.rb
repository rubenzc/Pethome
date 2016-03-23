class Site < ActiveRecord::Base
	def search(search)
		where("city LIKE ?", "%#{search}%")
	end
end
