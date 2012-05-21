require 'test_helper'
class NewsArticlesTest < ActionController::IntegrationTest
 
  def setup
    Factory(:article_type)
    Factory(:article)
    
    silence_stream(STDOUT) do
      file = File.expand_path(File.join(File.dirname(__FILE__), '../../test/dummy/db/seeds.rb'))
      require file
    end
  end
  
  test "Access the RSS feed via the 'ugly' URL" do
    get "/bcms_news/articles/feed"
    
    assert_response :success, "What the heck is a 406 response code?"
    assert @response.body.include?("<rss")
    # Checking vs @response.body rather than using assert_select since the later throws invalid warnings when parsing XML
  end
end

