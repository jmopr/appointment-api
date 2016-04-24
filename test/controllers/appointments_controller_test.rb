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
  #   get :index, appointments: {first_name: 'MyString'}
  #   assert_response :ok
  #   assert_not_nil assigns(:appointments)
  # end
  
  # test "should create appointment" do
  #   assert_difference('Appointment.count') do
  #     post :create, {appointment: {appt_day: '17/11/05 7:05', appt_end: "17/11/05 7:10", first_name: "Jose", last_name: "Valentin"}}
  #     byebug
  #   end
  #   assert_response :created
  #   assert_redirected_to appointment_path(assigns(:appointment))
  # end
  #
  # test "should update appointment" do
  #   put :update, id: @appointment.id, appointment: {appt_day: '17/11/05 7:05', appt_end: "7:10", first_name: "Jose", last_name: "Valentin"}
  #   assert_response :updated
  # end

  test "should delete appointment" do
    assert_difference('Appointment.count', -1) do
      delete :destroy, id: @appointment.id
    end
    assert_response :no_content
  end

  # Tests for the routes
  test "should route to appointment" do
    assert_routing '/appointments/1', { controller: "appointments", action: "show", id: "1" }
  end

  test "should route to appointments" do
    assert_routing '/appointments', { controller: "appointments", action: "index" }
  end

  test "should route to create appointment" do
    assert_routing({ method: 'post', path: '/appointments' }, { controller: "appointments", action: "create" })
  end

  test "should route to update appointment" do
    assert_routing({ method: 'put', path: '/appointments/1' }, { controller: "appointments", action: "update", id: "1" })
  end

  test "should route to delete appointment" do
    assert_routing({ method: 'delete', path: '/appointments/1' }, { controller: "appointments", action: "destroy", id: "1" })
  end

  private
    def initialize_appointment
      @appointment = appointments(:one)
    end
end
