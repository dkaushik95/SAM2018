require 'test_helper'

class PccControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pcc_index_url
    assert_response :success
  end

end
