require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase

  test "should not save appointment without appointment start date" do
    appointment = Appointment.new
    assert_not appointment.save, "Saved the appointment without a start date."
  end

  test "should not save appointment without appointment end date" do
    appointment = Appointment.new
    assert_not appointment.save, "Saved the appointment without an end date."
  end

  test "should not save appointment without first_name" do
    appointment = Appointment.new
    assert_not appointment.save, "Saved the appointment without a first name"
  end

  test "should not save appointment without last_name" do
    appointment = Appointment.new
    assert_not appointment.save, "Saved the appointment without a last name"
  end

  test "should not have a first name with numbers" do
    appointment = Appointment.new(first_name: "J1")
    assert_not appointment.save, "Saved the appointment with a first name containing a number."
  end

  test "should not have a last name with numbers" do
    appointment = Appointment.new(last_name: "O1")
    assert_not appointment.save, "Saved the appointment with a last name containing a number."
  end

  test "should not have an appointment date on past" do
    appointment = Appointment.new(appt_day: "2013-11-01 07:05:00")
    assert_not appointment.save, "Saved the appointment with a date in the past."
  end

  test "should not have an appointment conflict" do
    appointment = Appointment.new(appt_day: "2013-11-01 07:05:00")
    assert_not appointment.save, "Saved the appointment in conflict with another."
  end
end
