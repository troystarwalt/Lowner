require "twilio-ruby"

##Check ENV variables.

class TwilioController < ApplicationController

	skip_before_action :verify_authenticity_token

	


	def create
		account_sid = ENV['TWILIO_API_ACCOUNTSID']
		auth_token = ENV['TWILIO_AUTHTOKEN']



		begin
			
			@client = Twilio::REST::Client.new account_sid, auth_token

			from = ENV['TWILIO_PHONE_NUMBER']
			body = "Just a quick reminder that you still have my crap. With Love: #{current_user.username}"

			@to = "+1" + params[:phone]
			@to.gsub(/[ .,-]/, "")

			message = @client.account.messages.create(
				:from => from,
				:to => @to,
				:body => body   
				)   
			puts body

			redirect_to profile_path(current_user.id), notice: "Message Sent!"
			end

			rescue Twilio::REST::RequestError => e
			puts e.message

		end
end



