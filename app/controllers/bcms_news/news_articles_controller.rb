module BcmsNews
  class NewsArticlesController < Cms::ContentBlockController
    
    # Better as something like: allow :guests, :only=>:feed
    skip_filter :redirect_to_cms_site, :only=>:feed
    skip_filter :login_required, :only=>:feed
    skip_filter :cms_access_required, :only=>:feed
      
    # Different method to avoid clashing with the backend content library for this.
    def feed
      @articles = NewsArticle.released.all(:limit => 15, :order => "release_date desc")
    end
  end
end