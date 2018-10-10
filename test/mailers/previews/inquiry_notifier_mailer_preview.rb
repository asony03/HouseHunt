# Preview all emails at http://localhost:3000/rails/mailers/inquiry_notifier_mailer
class InquiryNotifierMailerPreview < ActionMailer::Preview
  def reply
    InquiryNotifierMailer.reply(Inquiry.first)
  end
end
