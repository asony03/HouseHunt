class InquiryNotifierMailer < ApplicationMailer
  default from: 'no-reply@househunt.com',
          return_path: 'no-reply@househunt.com'

  def reply(inquiry)
    @inquiry = inquiry
    mail(to: inquiry.user.email)
  end
end
