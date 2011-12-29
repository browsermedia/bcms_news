class RecentNewsPortlet < Cms::Portlet

  # Mark this as 'true' to allow the portlet's template to be editable via the CMS admin UI.
  enable_template_editor false
  
  def render
    order = "release_date DESC"
    if !attributes.sort_by.blank? and !attributes.sort_order.blank?
      order = "#{attributes.sort_by} #{attributes.sort_order}"
    end

    if attributes.category_id.blank?
      @articles = BcmsNews::NewsArticle.released.all(:order => order, :limit => attributes.limit)
    else
      @category = Cms::Category.find(attributes.category_id)
      @articles = BcmsNews::NewsArticle.released.all(:conditions => ["category_id = ?", @category.id], 
          :order => order, :limit => attributes.limit)
    end
  end
    
  def category
    @category
  end 
  
  # For testing
  def articles
    @articles
  end

  # For testing
  def attributes
    @portlet
  end
end