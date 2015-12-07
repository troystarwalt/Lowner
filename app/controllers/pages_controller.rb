class PagesController < ApplicationController
	# include HighVoltage::StaticPage


	def index
		if user_signed_in?
			redirect_to profile_path
		else
			render pages_path('/')
	end
end
