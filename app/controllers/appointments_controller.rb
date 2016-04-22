class AppointmentsController < ApplicationController
  def show
    render json: Appointment.find(params[:id]), status: :ok
    rescue
      render json: {appointment: {errors: "appointment not found"}}, status: :not_found
  end

  def index
    render json: Appointment.list(appointment_params), status: :ok
  end

  def create
    appointment = Appointment.new(appointment_params)

    if appointment.save
      render json: appointment, status: :created, location: appointment
    else
      render json: appointment.errors, status: :unprocessable_entity
    end
  end

  def update
    appointment = Appointment.find(params[:id])
    if appointment.update(appointment_params)
      render json: appointment, status: :ok, location: appointment
    else
      render json: appointment.errors, status: :unprocessable_entity
    end
    rescue
      render json: {appointment: {errors: "appointment not found"}}, status: :not_found
  end

  def destroy
    Appointment.destroy(params[:id])
    render json: Appointment.all
    rescue
      render json: {appointment: {errors: "appointment not found"}}, status: :not_found
  end

  private
    def appointment_params
      params.require(:appointment).permit(:appt_day, :start_time, :end_time, :first_name, :last_name, :comments)
      # params.permit(:appt_day, :appt_end, :start_time, :first_name, :last_name, :comments)
    end
end
