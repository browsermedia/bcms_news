require 'test_helper'
class NewsArticlesTest < ActionController::IntegrationTest
 
  test "login and browse site" do
    get "/news/articles.rss"
    
    assert_response :success
    assert_select "rss"
  end
  
  
end