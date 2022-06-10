require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get relationship" do
    get relationships_relationship_url
    assert_response :success
  end
end
