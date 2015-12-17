require "twilio-ruby"

class TwilioController < ApplicationController

	skip_before_action :verify_authenticity_token

	# Start the Text Message Send
	# NOTE: I'm using the the free version of Twilio so the active
	# number is my number. Any other numbers will return an error.

	def create
		account_sid = ENV['TWILIO_API_ACCOUNTSID']
		auth_token = ENV['TWILIO_AUTHTOKEN']

		begin
			
			@client = Twilio::REST::Client.new account_sid, auth_token

			from = ENV['TWILIO_PHONE_NUMBER']
			
			body = "Just a quick reminder that you still have my crap. With Love: #{current_user.username}"

			@to = "+1" + params[:phone]
			
			# Attempting to clean up number.

			@to.gsub(/[ .,-]/, "")
			

			message = @client.account.messages.create(
				:from => from,
				:to => @to,
				:body => body   
				)   
			
			redirect_to profile_path(current_user.id), notice: "Message Sent!"
			
			end

		# If the message doesn't send return the error message to the console.
		# Redirect to the user's profile.

		rescue Twilio::REST::RequestError => e

			puts e.message

			redirect_to profile_path(current_user.id), alert: "Message not sent."
	end
end



