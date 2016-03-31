class AddDayToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :start_day, :date
  end
end
