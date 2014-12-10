class Notifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #
  def email_friend(article, sender_name, receiver_email)
    @article = article
    @sender_name = sender_name
    @receiver_email = receiver_email

    attachments["logo_rubyonrails.png"] = File.read(Rails.root.join("public/rubyonrails.png"))
    mail to: receiver_email, subject: "#{@article.title}"
  end
end
