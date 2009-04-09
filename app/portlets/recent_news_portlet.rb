class RecentNewsPortlet < Portlet
  
  def self.default_template
    open(File.join(File.dirname(__FILE__), 
      "..", "views", "portlets", "recent_news", "render.html.erb")) {|f| f.read}
  end  
  
  def inline_options
    if portlet.category_id.blank?
      @articles = NewsArticle.all(:order => "release_date desc", :limit => limit)
    else
      @category = Category.find(category_id)
      @articles = NewsArticle.all(:conditions => ["category_id = ?", @category.id], :order => "release_date desc", :limit => limit)
    end
    {:inline => portlet.template}
  end
    
end