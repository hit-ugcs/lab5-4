class Usermailer < ActionMailer::Base
  default from: "testgradeemail@gmail.com"

  def send_grade_info(course, user)
    @course = course
    @sheet_info = @course.sheet_info
    @user = user
    mail to: @user.email, subject: "Send Grade Info"
  end

end
