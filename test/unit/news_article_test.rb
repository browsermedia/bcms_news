require File.join(File.dirname(__FILE__), '/../test_helper')

class NewsArticleTest < ActiveSupport::TestCase
  
  def test_news_article
    a = NewsArticle.create!(:name => "Test Article", :release_date => Date.parse("2008-12-25"))
    assert a.save
    
    b = NewsArticle.released_on(Date.parse("2008-12-25")).with_slug("test-article").first
    assert_equal a, b

    b = NewsArticle.released_on(:year => "2008", :month => "12", :day => "25").with_slug("test-article").first
    assert_equal a, b
    
    assert_equal({
      :year => "2008",
      :month => "12",
      :day => "25",
      :slug => "test-article"
    }, b.route_params)
  end
  
  
end