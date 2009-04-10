SPEC = Gem::Specification.new do |spec| 
  spec.name = "browser_cms_news_module" 
  spec.rubyforge_project = spec.name
  spec.version = "3.0.0" 
  spec.summary = "The News Module for BrowserCMS" 
  spec.author = "BrowserMedia" 
  spec.email = "github@browsermedia.com" 
  spec.homepage = "http://www.browsercms.org" 
  spec.files += Dir["app/controllers/news_articles_controller.rb"]  
  spec.files += Dir["app/controllers/cms/news_articles_controller.rb"]
  spec.files += Dir["app/models/news_article.rb"]
  spec.files += Dir["app/portlets/*"]
  spec.files += Dir["app/views/news_articles/*"]
  spec.files += Dir["app/views/cms/news_articles/*"]
  spec.files += Dir["app/views/portlets/**/*"]
  spec.files += Dir["db/migrate/[0-9]*_create_news_articles.rb"]
  spec.files += Dir["lib/browser_cms_news_module.rb"]
  spec.files += Dir["lib/browser_cms_news_module/*"]  
  spec.files += Dir["rails/init.rb"]
  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README"]
  #spec.require_path "lib"
end