class StaffMailer < ApplicationMailer

  def account_activation(staff)
    @staff = staff
    mail to: "web@wvbr.com", subject: "WVBR Account Created"
    mail to: staff.email, subject: "WVBR Account Created"
  end

  def password_reset(staff)
    @staff = staff
    mail to: staff.email, subject: "WVBR Password Reset"
    
  end
end
