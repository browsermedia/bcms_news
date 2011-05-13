class NewsArticlePortlet < Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor false
  
  def render
    # @news_article should already be set by the page route
    if !@news_article && params[:news_article_id]
      @news_article = NewsArticle.find(params[:news_article_id])
    end
  end
    
end