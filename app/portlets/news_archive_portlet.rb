class NewsArchivePortlet < Cms::Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor false

  def render
    if self.category_id.blank?
      @articles = BcmsNews::NewsArticle.released.all(:order => "release_date desc", :limit => self.limit)
    else
      @category = Cms::Category.find(self.category_id)
      @articles = BcmsNews::NewsArticle.released.all(:conditions => ["category_id = ?", @category.id], :order => "release_date desc", :limit => self.limit)
    end
  end

end