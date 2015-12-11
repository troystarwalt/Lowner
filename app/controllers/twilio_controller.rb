require "twilio-ruby"

##Check ENV variables.

class TwilioController < ApplicationController

	skip_before_action :verify_authenticity_token




	def create

		begin
			account_sid = ENV['TWILIO_TEST_API_ACCOUNTSID']
			auth_token = ENV['TWILIO_TEST_AUTHTOKEN']
			@client = Twilio::REST::Client.new account_sid, auth_token

		from = "+15005550006"
			@to = "+1" + params[:format]
			@to.gsub(/[ .,-]/, "")
			message = @client.account.messages.create(
				:from => from,
				:to => @to,
				:body => "Just a quick reminder that you still have my crap."   
				)   
			puts "#{:body}"
		end

	rescue Twilio::REST::RequestError => e
		puts e.message

	end
end



