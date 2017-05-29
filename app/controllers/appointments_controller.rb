class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
    @appointment.build_patient
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:danger] = ''
      AlertMailer.patient(@appointment).deliver_now
      AlertMailer.doctor(@appointment).deliver_now
      render :thanks
    else
      flash[:danger] = @appointment.errors.full_messages
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_time, :diagnosis_id, patient_attributes: [:first_name, :last_name, :email, :street, :city, :state, :zip])
  end
end
