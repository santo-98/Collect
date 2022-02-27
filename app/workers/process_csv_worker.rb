class ProcessCsvWorker
  require 'csv'
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(responses, headers)
    CSV.generate(headers: true) do |csv|
      csv << headers

      responses.values.each do |response|
        temp_array = []
        response.each do |r|
          temp_array.append(r.response)
        end
        csv << temp_array.append(response.first.responder.email)
      end
    end
  end
end
