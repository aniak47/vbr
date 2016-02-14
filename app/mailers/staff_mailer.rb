class StaffMailer < ApplicationMailer

  def account_activation(staff)
    @staff = staff
    mail to: staff.email, subject: "WVBR Account activation"
  end

  def password_reset
    @staff = staff
    mail to: staff.email, subject: "WVBR Password Reset"
  end
end
