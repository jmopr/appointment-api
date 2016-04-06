class RemoveStartTimeFromAppointment < ActiveRecord::Migration
  def change
    remove_column :appointments, :start_time
  end
end
