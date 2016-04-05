class Appointment < ActiveRecord::Base
  validates :appt_day, :start_time, :end_time, :first_name, :last_name, presence: true
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters for first name" }, length: { in: 2..20 }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters for last name" }, length: { in: 2..30 }
  # validate :appointment_date_cannot_be_in_the_past, on: :create

  #Validate appointment date is in the future.
  def appointment_date_cannot_be_in_the_past
    if appt_day.present? && appt_day < Date.today
      errors.add(:appt_day, "appointment can not be in the past")
    end
  end
  # Validate if there is not an appointment already in that slot.
  def appointment_date_cannot_conflict

  end

  
end


# class Appointment < ActiveRecord::Base
#   validate :time_intersects?,:start_time_cannot_be_in_the_past, :start_time_always_before_end_time, on: :create
#   validate :appointment_kept_same_time, :start_time_cannot_be_in_the_past, :start_time_always_before_end_time, on: :update

#       def time_intersects?
#           if Appointment.exists?(['(start_time BETWEEN ? AND ?) OR (end_time BETWEEN ? AND ?)', start_time, end_time,  start_time, end_time])
#             errors.add(:appointment, "appointment time already taken")
#           end
#       end
#       def appointment_kept_same_time
#         unless Appointment.find(id).start_time == start_time && Appointment.find(id).end_time == end_time
#           time_intersects?
#         else
#           false
#         end
#       end
#       def start_time_cannot_be_in_the_past
#         if start_time.present? && start_time < Date.today
#           errors.add(:start_time, "can't be in the past")
#         end
#       end
#       def start_time_always_before_end_time
#         if start_time == nil || end_time == nil
#           errors.add(:start_time, "can't be nil")
#         elsif start_time > end_time
#           errors.add(:start_time, "can't be after end time")
#         end
#       end


#       def self.search(params)
#         query = Appointment.all
#         if params["first_name"].present?
#           query = Appointment.where(first_name: params["first_name"])
#         end
#         if params["last_name"].present?
#           query = Appointment.where(last_name: params["last_name"])
#         end
#         unless params["start_time"].present? && params["end_time"].present?
#           if params["start_time"].present?
#             query = Appointment.where('start_time > ?', params["start_time"] )
#           end
#           if params["end_time"].present?
#             query = Appointment.where('end_time < ?', params["end_time"])
#           end
#         else
#           query = Appointment.where(['(start_time BETWEEN ? AND ?) OR (end_time BETWEEN ? AND ?)', params["start_time"], params["end_time"],  params["start_time"], params["end_time"]])
#         end
#         query
#       end
#   end
