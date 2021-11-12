require 'test_helper'

class SyncControllerTest < ActionDispatch::IntegrationTest
  test "should get sync" do
    get sync_sync_url
    assert_response :success
  end

end
