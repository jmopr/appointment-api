class Appointment < ActiveRecord::Base
  validates :appt_day, :start_time, :end_time, :first_name, :last_name, presence: true
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { in: 2..20 }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { in: 2..30 }
  # validate :appointment_date_cannot_be_in_the_past, on: :create

  #Validate appointment date is in the future.
  def appointment_date_cannot_be_in_the_past
    if appt_day.present? && appt_day < Date.today
      errors.add(:appt_day, "can't be in the past")
    end
  end
  # Validate if there is not an appointment already in that slot.


end
