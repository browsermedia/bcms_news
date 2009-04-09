class NewsArticlePortlet < Portlet
  
  def self.default_template
    open(File.join(File.dirname(__FILE__), 
      "..", "views", "portlets", "news_article", "render.html.erb")) {|f| f.read}
  end  
  
  def inline_options
    if params[:news_article_id]
      @article = NewsArticle.find(params[:news_article_id])
      {:inline => template}
    else
      {:inline => "<b>Missing required parameter</b><br/>This portlet expects a request parameter 'news_article_id'. Be sure the calling page provides it."}
    end
  end
    
end