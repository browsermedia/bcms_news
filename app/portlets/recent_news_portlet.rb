class RecentNewsPortlet < Portlet
  
  def render
    order = "release_date DESC"
    if !@portlet.sort_by.blank? and !@portlet.sort_order.blank?
      order = "#{@portlet.sort_by} #{@portlet.sort_order}"
    end

    if @portlet.category_id.blank?
      @articles = NewsArticle.all(:order => order, :limit => @portlet.limit)
    else
      @category = Category.find(@portlet.category_id)
      @articles = NewsArticle.all(:conditions => ["category_id = ?", @category.id], :order => order, :limit => @portlet.limit)
    end
  end
    
end