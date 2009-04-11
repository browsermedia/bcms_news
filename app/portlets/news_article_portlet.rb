class NewsArticlePortlet < Portlet
  
  def render
    # @news_article should already be set by the page route
    if !@news_article && params[:news_article_id]
      @news_article = NewsArticle.find(params[:news_article_id])
    end
  end
    
end