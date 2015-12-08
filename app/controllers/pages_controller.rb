class PagesController < ApplicationController
	# include HighVoltage::StaticPage


	def index
		if user_signed_in?
			redirect_to profile_path(current_user)
		else
			render root_path
	end
end
