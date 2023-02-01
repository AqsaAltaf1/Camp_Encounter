# frozen_string_literal: true

# Mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'CampEncounter@.com'
  layout 'mailer'
end
