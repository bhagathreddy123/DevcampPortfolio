class Portfolio < ApplicationRecord
	include Placeholder
	has_many :technologies
	validates_presence_of :title, :body, :main_image, :thumb_image
	def self.angular
		where(sub_title: 'Angular')
	end

	scope :ruby_on_rails_portfolio_items, -> { where(sub_title: 'Ruby on Rails') }
	after_initialize :set_defaults

	def set_defaults
	    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
	end
end
