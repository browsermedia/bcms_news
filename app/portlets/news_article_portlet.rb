class NewsArticlePortlet < Portlet
  
  def render
    @article = NewsArticle.find(params[:news_article_id]) if params[:news_article_id]
  end
    
end