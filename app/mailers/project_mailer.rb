class ProjectMailer < ApplicationMailer
    default from: 'system@redcarats.com'
    def alert_email(message)
        @message = message
        mail(to: 'alerts@redcarats.com', subject: "New Contact Request has been received from #{@message.contact_email}")
    end
end
