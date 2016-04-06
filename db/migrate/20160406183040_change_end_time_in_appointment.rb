class ChangeEndTimeInAppointment < ActiveRecord::Migration
  def change
    change_column :appointments, :end_time, :timestamp
  end
end
