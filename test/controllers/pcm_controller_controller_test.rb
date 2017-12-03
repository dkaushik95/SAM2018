require 'test_helper'

class PcmControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pcm_controller_index_url
    assert_response :success
  end

end
