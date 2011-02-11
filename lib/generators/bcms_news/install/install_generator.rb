require 'cms/module_installation'

class BcmsNews::InstallGenerator < Cms::ModuleInstallation
  add_migrations_directory_to_source_root __FILE__
  
  copy_migration_file '20090410193313_create_news_articles.rb'
  
end
