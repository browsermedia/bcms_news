module Cms::Routes
  def routes_for_bcms_news
    
    news_articles '/news/articles.rss', 
      :controller => "news_articles", 
      :conditions => {:method => :get},
      :format => "rss"
    
    namespace(:cms) do |cms|
      cms.content_blocks :news_articles
    end  
  end
end
