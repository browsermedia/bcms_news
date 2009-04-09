class NewsArchivePortlet < Portlet
  
  def self.default_template
    open(File.join(File.dirname(__FILE__), 
      "..", "views", "portlets", "news_archive", "render.html.erb")) {|f| f.read}
  end  
  
  def render
    if category_id.blank?
      @articles = NewsArticle.all(:order => "release_date desc", :limit => limit)
    else
      @category = Category.find(category_id)
      @articles = NewsArticle.all(:conditions => ["category_id = ?", @category.id], :order => "release_date desc", :limit => limit)
    end
  end
  
  def inline_options
    {:inline => template}
  end
    
end