module Cms
  module Routes
    def routes_for_bcms_news
    
      match '/news/articles.rss', :to=>"news_articles#index", :as=>'news_articles', :method=>:get, :defaults => { :format => 'rss' }
      namespace(:cms) do 
        content_blocks :news_articles
      end  
    end
  end
end
