require 'json'
module API
  class AppointmentsController < ApplicationController

    def show
    end

    def index
      # response.headers['Access-Control-Allow-Origin'] = '*'
      #respond_to do |format|
      #format.html
      #format.json {
      # render json: JSON.pretty_generate(Appointment.all.as_json)  #, status: 200}
      #end
      #format.json render :partial => "users/show.json"
      appointments = Appointment.all
      # respond_to do |format|
        # format.json {
          render json: JSON.pretty_generate(appointments.as_json), status: 200
        # render json: appointments, status: 200
        # }
      # end
    end

    def create
      appointment = Appointment.new(appointment_params)
      if appointment.save
        render json: appointment, status: :created, location: appointment
      else
        render json: appointment.errors, status: 422
      end
    end

    def update

    end

    private
      def appointment_params
        params.require(:appointment).permit(:start_time, :end_time, :first_name, :last_name, :comments, :appt_day)
      end
  end
end
