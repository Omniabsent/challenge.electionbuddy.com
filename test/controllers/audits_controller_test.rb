require "test_helper"

class AuditsControllerTest < ActionDispatch::IntegrationTest
  test 'should get audits index' do
    get audits_url
    assert_response :success
  end

  test 'should get audits of a single election' do
    get audits_url"?search=1"
    assert_response :success
  end
end
