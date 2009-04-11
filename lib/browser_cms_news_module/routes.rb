module Cms::Routes
  def routes_for_browser_cms_news_module
    
    news_articles '/news/articles.rss', 
      :controller => "news_articles", 
      :conditions => {:method => :get},
      :format => "rss"
    
    namespace(:cms) do |cms|
      cms.content_blocks :news_articles
    end  
  end
end
