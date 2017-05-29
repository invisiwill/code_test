class AlertMailer < ActionMailer::Base
  default from: "appointments@mydroffice.com"

  def patient(appointment)
    @appointment = appointment
    @patient = @appointment.patient
    @doctor = @appointment.doctor
    mail(to: @patient.email,
         subject: "Your Appointment Details With #{@doctor.name}")
  end

  def doctor(appointment)
    @appointment = appointment
    @patient = @appointment.patient
    @doctor = @appointment.doctor
    mail(to: @doctor.email,
         subject: "New Appointment For #{@patient.name}")
  end
end
