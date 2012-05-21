require 'test_helper'

module BcmsNews
  class RecentNewsArticleTest < ActiveSupport::TestCase

    def setup
      @past_article_1 = Factory(:article)
      @past_article_2 = Factory(:article)
    end

    # Note: There is probably a more elegant way to correctly set the
    # parameters for a portlet than this. But it works for testing purposes.
    class StubAttributes
      attr_accessor :sort_by, :category_id, :limit
    end


    def test_finds_all_articles
      p = RecentNewsPortlet.new
      
      expects_attributes(p)

      p.render
      
      assert_equal [@past_article_1, @past_article_2], p.articles
    end


    def test_looks_up_articles_based_on_category_id
      c_type = Cms::CategoryType.create!(:name => "News")
      assert_equal true, c_type.persisted?
      c = Cms::Category.create!(:name => "Category A", :category_type_id => c_type.id)    
      @article_in_category = Factory(:article, :category_id => c.id)

      p = RecentNewsPortlet.new
      
      params = expects_attributes(p)
      params.category_id = c.id

      p.render

      assert_equal(c, p.category)
      assert_equal([@article_in_category], p.articles)
    end
  
    private
    
    def expects_attributes(portlet)
      params = StubAttributes.new
      portlet.expects(:attributes).returns(params).at_least_once
      params
    end
  end
end