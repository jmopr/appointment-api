class AppointmentsController < ApplicationController
  def show
    render json: Appointment.find(params[:id]), status: :ok
  end

  def index
    render json: Appointment.all, status: :ok
  end

  def create
    appointment = Appointment.new #(appointment_params)
    appointment.appt_day = params[:appt_day]
    appointment.start_time = params[:start_time]
    appointment.end_time = params[:end_time]
    appointment.last_name = params[:last_name]
    appointment.first_name = params[:first_name]

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
  end

  def destroy
    Appointment.destroy(params[:id])
    render json: Appointment.all
  end

  private
    def appointment_params
      # params.require(:appointment).permit(:appt_day, :start_time, :end_time, :first_name, :last_name, :comments)
      params.permit(:appt_day, :start_time, :end_time, :first_name, :last_name, :comments)
    end
end
