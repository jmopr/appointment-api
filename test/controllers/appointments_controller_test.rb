require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  # called before every single test
  setup :initialize_appointment

  # called after every single test
  def teardown
    @appointment = nil
  end

  test "should show appointment" do
    get :show, id: @appointment.id
    assert_response :ok
  end

  # test "should get index" do
  #   get :index
  #   assert_response :ok
  #   # assert appointments.errors[:id]
  #   # assert_not_nil assigns(:appointments)
  # end
  #
  # test "should create appointment" do
  #   assert_difference('Appointment.count') do
  #     post :create, {id: 200, appt_day: '17/11/05', start_time: "7:05", end_time: "7:10", first_name: "Juan", last_name: "Ortiz"}
  #   end
  #   assert_response :created
  #   # assert_redirected_to appointment_path(assigns(:appointment))
  # end
  #
  # test "should update appointment" do
  #   patch :update, id: @appointment.id, {} #appt_day: '17/11/05', start_time: "7:05", end_time: "7:10", first_name: "Juan", last_name: "Ortiz"}
  #   # assert_response :updated
  # end
  #
  # test "should destroy appointment" do
  #   assert_difference('Appointment.count', -1) do
  #     delete :destroy, id: @appointment.id
  #   end
  #   # assert_redirected_to appointments_path
  # end

  private

    def initialize_appointment
      @appointment = appointments(:one)
    end
end
