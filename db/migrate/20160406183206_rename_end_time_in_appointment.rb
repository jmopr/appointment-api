class RenameEndTimeInAppointment < ActiveRecord::Migration
  def change
    rename_column :appointments, :end_time, :appt_end
  end
end
