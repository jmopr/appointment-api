require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  test "should not save appointment without appointment date" do
    appointment = Appointment.new
    assert_not appointment.save, "Saved the appointment without a date."
  end

  test "should not have a first name with numbers" do
    appointment = Appointment.new(first_name: "J1")
    assert_not appointment.save, "Saved the appointment with a first name containing a number."
  end

  test "should not have a last name with numbers" do
    appointment = Appointment.new(last_name: "O1")
    assert_not appointment.save, "Saved the appointment with a last name containing a number."
  end

end
