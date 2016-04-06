class ChangeApptDayInAppointment < ActiveRecord::Migration
  def change
    change_column :appointments, :start_time, :time
    change_column :appointments, :end_time, :time
    change_column :appointments, :appt_day, :datetime
  end
end
