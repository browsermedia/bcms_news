BcmsNews::Engine.routes.draw do
  
  # This is going to be added under /bcms_news/news/articles.rss
  # Add a routing extension (w/ mount_bcms_news or ), or make a non-isolated engine.
  # Alternatively, just mount as /news rather than /bcms_news then update the match.
  get '/articles/feed', :to=>"news_articles#feed", :defaults => { :format => 'rss' }, :as=>'news_feed'
  
  content_blocks :news_articles 
  
end
