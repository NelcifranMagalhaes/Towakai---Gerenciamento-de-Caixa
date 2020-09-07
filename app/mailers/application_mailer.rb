# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'naltispace@gmail.com'
  layout 'mailer'
end
