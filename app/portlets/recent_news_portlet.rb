class RecentNewsPortlet < Portlet
  
  def render
    if portlet.category_id.blank?
      @articles = NewsArticle.all(:order => "release_date desc", :limit => limit)
    else
      @category = Category.find(category_id)
      @articles = NewsArticle.all(:conditions => ["category_id = ?", @category.id], :order => "release_date desc", :limit => limit)
    end
  end
    
end