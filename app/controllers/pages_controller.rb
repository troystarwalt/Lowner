class PagesController < ApplicationController

	include HighVoltage::StaticPage


	def index
		render :layout => false
	end
end
