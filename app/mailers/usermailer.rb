class Usermailer < ActionMailer::Base
  default from: "testgradeemail@gmail.com"

  def send_grade_info(user)
    @user = user
    mail to: @user.email, subject: "Send Grade Info"
  end

end
