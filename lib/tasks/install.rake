namespace :db do
  namespace :seed do
    desc "Load the seed data from db/bcms_news.seeds.rb."
    task :bcms_news => :environment do
      require "#{Rails.root}/db/bcms_news.seeds.rb"
    end
  end
end
