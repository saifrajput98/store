# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Store@gmail.com'
  layout 'mailer'
end
