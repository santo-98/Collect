class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def error_sentence
    errors.full_messages.to_sentence
  end
end
