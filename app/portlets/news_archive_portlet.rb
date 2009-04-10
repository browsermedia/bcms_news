class NewsArchivePortlet < Portlet

  def render
    if self.category_id.blank?
      @articles = NewsArticle.all(:order => "release_date desc", :limit => self.limit)
    else
      @category = Category.find(self.category_id)
      @articles = NewsArticle.all(:conditions => ["category_id = ?", @category.id], :order => "release_date desc", :limit => self.limit)
    end
  end

end