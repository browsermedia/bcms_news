Gem::Specification.new do |s|
  s.name = %q{bcms_news}
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["BrowserMedia"]
  s.date = %q{2011-05-23}
  s.description = %q{The News Module for BrowserCMS}
  s.email = %q{github@browsermedia.com}
  s.required_ruby_version = '>= 1.9.2'
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    "app/controllers/cms/news_articles_controller.rb",
    "app/controllers/news_articles_controller.rb",
    "app/models/news_article.rb",
    "app/portlets/news_archive_portlet.rb",
    "app/portlets/news_article_portlet.rb",
    "app/portlets/recent_news_portlet.rb",
    "app/views/cms/news_articles/_form.html.erb",
    "app/views/cms/news_articles/render.html.erb",
    "app/views/news_articles/index.rss.builder",
    "app/views/portlets/news_archive/_form.html.erb",
    "app/views/portlets/news_archive/render.html.erb",
    "app/views/portlets/news_article/_form.html.erb",
    "app/views/portlets/news_article/render.html.erb",
    "app/views/portlets/recent_news/_form.html.erb",
    "app/views/portlets/recent_news/render.html.erb",
    "db/migrate/20090410193313_create_news_articles.rb",
    "lib/bcms_news.rb",
    "lib/bcms_news/engine.rb",
    "lib/bcms_news/routes.rb",
    "lib/generators/bcms_news/install/USAGE",
    "lib/generators/bcms_news/install/install_generator.rb"
  ]
  s.homepage = %q{https://github.com/browsermedia/bcms_news}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{The News Module for BrowserCMS}
  s.test_files = [
    "test/integration/news_articles_test.rb",
    "test/performance/browsing_test.rb",
    "test/test_helper.rb",
    "test/unit/news_article_test.rb",
    "test/unit/recent_news_portlet_test.rb"
  ]

  s.add_dependency(%q<browsercms>, ["= 3.3.0"])

end

