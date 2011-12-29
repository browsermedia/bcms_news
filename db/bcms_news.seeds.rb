# Create the content type, category type and section for news
Cms::ContentType.create!(:name => "BcmsNews::NewsArticle", :group_name => "News")
Cms::CategoryType.create!(:name => "News Article")
news = Cms::Section.create!(:name => "News", 
  :path => "/news", 
  :parent => Cms::Section.root.first, 
  :group_ids => Cms::Group.all.map(&:id))      

# Create the page to display the recent news
overview = Cms::Page.create!(:name => "Overview", 
  :path => "/news/articles", 
  :section => news, 
  :template_file_name => "default.html.erb")
RecentNewsPortlet.create!(:name => "Recent News Portlet", 
  :limit => 5, 
  :more_link => "/news/archive", 
  :template => RecentNewsPortlet.default_template,
  :connect_to_page_id => overview.id,
  :connect_to_container => "main")


# Create the page to display the news archives
archives = Cms::Page.create!(:name => "Archive", 
  :path => "/news/archive", 
  :section => news, 
  :template_file_name => "default.html.erb")
NewsArchivePortlet.create!(:name => "News Archive Portlet", 
  :template => NewsArchivePortlet.default_template,
  :connect_to_page_id => archives.id,
  :connect_to_container => "main")

# Create the page to display a given news article
article = Cms::Page.create!(:name => "Article", 
  :path => "/news/article", 
  :section => news, 
  :template_file_name => "default.html.erb")
NewsArticlePortlet.create!(:name => "News Article Portlet", 
  :template => NewsArticlePortlet.default_template,
  :connect_to_page_id => article.id,
  :connect_to_container => "main")

# Create Page Route to article page
route = article.page_routes.build(
  :name => "News Article",
  :pattern => "/news/articles/:year/:month/:day/:slug",
  :code => "@news_article = BcmsNews::NewsArticle.released_on(params).with_slug(params[:slug]).first")
route.add_condition(:method, "get")
route.add_requirement(:year, '\d{4,}')
route.add_requirement(:month, '\d{2,}')
route.add_requirement(:day, '\d{2,}')
route.save!