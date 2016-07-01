class Job < ActiveRecord::Base

	validates :position, presence: true
		validates :description, presence: true
		validates :company, presence: true
		validates :city, presence: true
end
