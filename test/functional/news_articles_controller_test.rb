require File.join(File.dirname(__FILE__), '/../test_helper')

class NewsArticlesControllerTest < ActionController::TestCase

  test "User can call RSS Feed" do
    get :index, {:format => "rss"}
    assert :success
    assert_select "rss"

  end

 
end
