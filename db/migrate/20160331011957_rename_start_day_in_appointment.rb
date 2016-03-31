class RenameStartDayInAppointment < ActiveRecord::Migration
  def change
    rename_column :appointments, :start_day, :appt_day
  end
end
