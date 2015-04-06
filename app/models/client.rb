class Client < ActiveRecord::Base
	has_and_belongs_to_many :letter

	def self.search(query)
  		where("imie like ?", "%#{query}%")
	end
end
