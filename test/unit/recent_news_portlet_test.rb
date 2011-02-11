require 'test_helper'

class RecentNewsArticleTest < ActiveSupport::TestCase


  # Note: There is probably a more elegant way to correctly set the
  # parameters for a portlet than this. But it works for testing purposes.
  class StubPortlet
    attr_accessor :sort_by, :category_id, :limit
  end


  def test_finds_all_articles
    article_1 = NewsArticle.create!(:name => "News Item A",  :release_date => Date.parse("2009-1-1"))
    article_2 = NewsArticle.create!(:name => "News Item B",  :release_date => Date.parse("2009-1-1"))
    p = RecentNewsPortlet.new

    params = StubPortlet.new
    p.instance_variable_set(:@portlet, params)
    p.render

    assert_equal [article_1, article_2], p.instance_variable_get(:@articles)


  end


  def test_looks_up_articles_based_on_category_id
    c_type = CategoryType.create!(:name => "News")
    c = Category.create!(:name => "Category A", :category_type => c_type)    
    article_1 = NewsArticle.create!(:name => "News Item A", :category => c, :release_date => Date.parse("2009-1-1"))
    article_2 = NewsArticle.create!(:name => "News Item B",  :release_date => Date.parse("2009-1-1"))

    p = RecentNewsPortlet.new

    params = StubPortlet.new
    params.category_id = c.id
    p.instance_variable_set(:@portlet, params)
    p.render

    assert_equal(c, p.instance_variable_get(:@category))
    assert_equal([article_1], p.instance_variable_get(:@articles))
  end
  
  
end