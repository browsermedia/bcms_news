# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bcms_news/version"

Gem::Specification.new do |s|
  s.name = %q{bcms_news}
  s.version = BcmsNews::VERSION

  s.authors = ["BrowserMedia"]
  s.description = %q{The News Module for BrowserCMS}
  s.email = %q{github@browsermedia.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files += Dir["app/**/*"]
  s.files += Dir["db/migrate/[0-9]*_create_news_articles.rb"]
  s.files += Dir["db/bcms_news.seeds.rb"]
  s.files += Dir["lib/**/*"] 
  s.files += Dir["Gemfile", "LICENSE.txt", "COPYRIGHT.txt", "GPL.txt" ]
  s.files -= Dir['config/**/*', 
                    'public/**/*', 
                    'config.ru', 
                    'script/**/*',
                    'app/controllers/application_controller.rb',
                    'app/helpers/application_helper.rb',
                    'app/layouts/templates/**/*',
                    'lib/tasks/*']
  s.homepage = %q{https://github.com/browsermedia/bcms_news}
  s.require_paths = ["lib"]
  s.rubyforge_project = s.name
  s.summary = %q{The News Module for BrowserCMS}
  s.test_files = Dir["test/**/*"]
  
  s.add_dependency(%q<browsercms>, ["~> 3.3.0"])
 
end

