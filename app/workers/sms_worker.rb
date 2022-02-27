class SmsWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(form, headers)
    message = "Your response from #{form.name} form\n"
      form.responses.where(responder_id: current_user.id).each do |response|
        message = message + "#{response.responsable.title} : #{response.response}\n"
      end
    TwilioTextMessenger.new(message).call
  end
end
