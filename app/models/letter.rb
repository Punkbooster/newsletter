class Letter < ActiveRecord::Base
  has_and_belongs_to_many :client
end