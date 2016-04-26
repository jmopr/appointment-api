class AppointmentsController < ApplicationController
  def show
    render json: Appointment.find(params[:id]), status: :ok
    rescue
      render json: {appointment: {errors: "appointment not found"}}, status: :not_found
  end

  def index
    (params.keys.include? "appointment") ? appointment = Appointment.find_appointments(appointment_params) :
                                           appointment = Appointment.all
    render json: appointment, status: :ok
    rescue
      render json: {appointments: {errors: "no appointments found"}}, status: :not_found
  end

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      render json: appointment, status: :created, location: appointment
    else
      render json: {appointment: {errors: "appointment was not created"}}, status: :unprocessable_entity
    end
  end

  def update
    appointment = Appointment.find(params[:id])
    if appointment.update(appointment_params)
      render json: appointment, status: :ok, location: appointment
    else
      render json: {appointment: {errors: "appointment was not updated"}}, status: :unprocessable_entity
    end
    rescue
      render json: {appointment: {errors: "appointment not found"}}, status: :not_found
  end

  def destroy
    appointment = Appointment.find(params[:id])
    render json: appointment.destroy, status: :no_content
    rescue
      render json: {appointment: {errors: "appointment not found"}}, status: :not_found
  end

  private
    def appointment_params
      params.require(:appointment).permit(:appt_day, :appt_end, :first_name, :last_name, :comments)
    end
end
