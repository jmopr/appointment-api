class ChangeStartTimeOfAppointment < ActiveRecord::Migration
  def change
    change_column :appointments, :appt_day, :timestamp
  end
end
