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


  def test_released_should_show_articles_from_today_and_previous_dates
    today = NewsArticle.create!(:name => "Today", :release_date => Date.today, :publish_on_save => true)
    tomorrow = NewsArticle.create!(:name => "Tomorrow", :release_date => Date.tomorrow, :publish_on_save => true)
    yesterday = NewsArticle.create!(:name => "Yesterday", :release_date => Date.yesterday, :publish_on_save => true)

    # only published articles are considered to be releasable
    assert today.published?
    assert tomorrow.published?
    assert yesterday.published?

    released = NewsArticle.released.all(:order => "release_date asc")

    assert_equal [yesterday, today], released
  end
  
  
end