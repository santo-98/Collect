class TwilioTextMessenger
  attr_reader :invite_link

  INVITATION_MESSAGE = "You have been to fill out the form"

  def initialize(invite_link, form=nil, phone_number=nil)
    @invite_link = invite_link
    @form = form
    @phone_number = phone_number
    @message = "#{INVITATION_MESSAGE} #{@invite_link}"
  end

  # Since SMS to be sent should be verified by twilio, passing default value
  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.config.twilio_phone_number,
      to: Rails.application.config.to_twilio_number,
      body: @message
    })
  end
end
