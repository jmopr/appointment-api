require 'test_helper'

class ListingAppointmentsTest < ActionDispatch::IntegrationTest
  setup { host! 'localhost:3000' }

  test 'returns list of appointments' do
    get '/appointments/?appointment[first_name]=Brenda'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'returns appointments in JSON' do
    get '/appointments/?appointment[first_name]=Brenda', {}, { 'Accept' => Mime::JSON }
    assert response.ok?
    assert_equal Mime::JSON, response.content_type
  end
end
