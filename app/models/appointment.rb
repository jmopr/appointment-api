class Appointment < ActiveRecord::Base
  validates :appt_day, :appt_end, :first_name, :last_name, presence: true
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters for first name" }, length: { in: 2..20 }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters for last name" }, length: { in: 2..30 }
  validate :appointment_date_cannot_be_in_the_past, :appointment_date_conflict, on: :create

  #Validate appointment date is in the future.
  def appointment_date_cannot_be_in_the_past
    if appt_day.present? && appt_day < Date.today
      errors.add(:appt_day, "appointment cannot be in the past")
    end
  end
  # Validate if there is not an appointment already in that slot.
  def appointment_date_conflict
    if Appointment.exists?(['(appt_day BETWEEN ? AND ?) OR (appt_end BETWEEN ? AND ?)', appt_day, appt_end, appt_day, appt_end])
      errors.add(:appointment, "appointment conflict")
    end
  end
end
