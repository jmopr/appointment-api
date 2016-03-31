require 'test_helper'

class ListingAppointmentsTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  # test 'returns list of all appointments' do
  #   get '/appointments'
  #   assert_equal 200, response.status
  #   refute_empty response.body
  # end

  # test '/appointments?page=2&per_page=25' do
  #   get '/appointments?page=2&per_page=25'
  #     assert_equal 200, response.status
  #     appointments = JSON.parse(response.body, symbolize_names: true)
  # end

  test 'returns appointments in JSON' do
    get '/appointments', {}, { 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
