class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :appt_day, :appt_end, :comments
end
