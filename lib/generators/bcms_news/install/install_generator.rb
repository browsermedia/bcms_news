require 'cms/module_installation'

class BcmsNews::InstallGenerator < Cms::ModuleInstallation
  add_migrations_directory_to_source_root __FILE__
  
  copy_migration_file '20090410193313_create_news_articles.rb'
  
  def add_seed_data_to_project
    copy_file "../bcms_news.seeds.rb", "db/bcms_news.seeds.rb"
    append_to_file "db/seeds.rb", "load File.expand_path('../bcms_news.seeds.rb', __FILE__)"
  end
end
