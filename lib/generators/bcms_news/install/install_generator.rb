require 'cms/module_installation'

class BcmsNews::InstallGenerator < Cms::ModuleInstallation
  add_migrations_directory_to_source_root __FILE__
  
  
  def copy_migrations
    rake 'bcms_news:install:migrations'
  end
  
  def add_seed_data_to_project
    copy_file "../bcms_news.seeds.rb", "db/bcms_news.seeds.rb"
    append_to_file "db/seeds.rb", "load File.expand_path('../bcms_news.seeds.rb', __FILE__)\n"
  end
  
  def add_routes
    mount_engine(BcmsNews)
  end
    
end
