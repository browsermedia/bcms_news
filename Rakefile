# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "bcms_news"
    gemspec.rubyforge_project = "browsercms"
    gemspec.summary = "The News Module for BrowserCMS"
    gemspec.email = "github@browsermedia.com"
    gemspec.homepage = "http://browsercms.org"
    gemspec.description = "The News Module for BrowserCMS"
    gemspec.authors = ["BrowserMedia"]
    gemspec.files = Dir["app/controllers/news_articles_controller.rb"]  
    gemspec.files += Dir["app/controllers/cms/news_articles_controller.rb"]
    gemspec.files += Dir["app/models/news_article.rb"]
    gemspec.files += Dir["app/portlets/*"]
    gemspec.files += Dir["app/views/news_articles/*"]
    gemspec.files += Dir["app/views/cms/news_articles/*"]
    gemspec.files += Dir["app/views/portlets/**/*"]
    gemspec.files += Dir["db/migrate/*.rb"]
    gemspec.files -= Dir["db/migrate/*_browsercms_*.rb"]
    gemspec.files -= Dir["db/migrate/*_load_seed_data.rb"]
    gemspec.files += Dir["lib/bcms_news.rb"]
    gemspec.files += Dir["lib/bcms_news/*"]
    gemspec.files += Dir["rails/init.rb"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

# These are new tasks
begin
  require 'rake/contrib/sshpublisher'
  namespace :rubyforge do
    desc "Release gem and RDoc documentation to RubyForge"
    task :release => ["rubyforge:release:gem"]
  end
rescue LoadError
  puts "Rake SshDirPublisher is unavailable or your rubyforge environment is not configured."
end