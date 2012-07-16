# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bcms_news/version"

Gem::Specification.new do |s|
  s.name        = "bcms_news"
  s.version     = BcmsNews::VERSION

  s.authors = ["BrowserMedia"]
  s.date = %q{2011-12-29}
  s.description = %q{The News Module for BrowserCMS}
  s.summary = %q{The News Module for BrowserCMS}
  s.email = %q{github@browsermedia.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  
  s.files = Dir["{app,config,db,lib}/**/*"]
  s.files += Dir["Gemfile", "LICENSE.txt", "COPYRIGHT.txt", "GPL.txt" ]

  s.test_files += Dir["test/**/*"]
  s.test_files -= Dir['test/dummy/**/*']
  
  s.homepage = %q{https://github.com/browsermedia/bcms_news}
  s.require_paths = ["lib"]
  s.rubyforge_project = s.name


  s.add_dependency("browsercms", "< 3.6.0", ">= 3.5.0.rc2")
end
