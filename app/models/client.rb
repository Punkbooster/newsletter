class Client < ActiveRecord::Base
	has_and_belong_to_many :letter
end
