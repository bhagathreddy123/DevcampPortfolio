class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	
	include DeviseWhitelist

	before_action :set_source
	include SetSource
	include CurrentUserConcern
	include DefaultPageContent

end
