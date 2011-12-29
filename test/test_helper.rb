# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

module FakeFactoryGirl
  mattr_accessor :count
  
  # To clean up tests without actually adding factory girl yet.
  def Factory(name, options={})
    FakeFactoryGirl.count += 1
    
    if name == :article
      create_article(options)
    else
      create_content_type(options)
    end
  end
  
  def create_content_type(options)
    Cms::ContentType.create!(:name=>'BcmsNews::NewsArticle', :group_name=>"Not Blank")
  end
  
  def create_article(options)
    defaults = 
    {
      name: "News Item #{FakeFactoryGirl.count}",
      release_date: 1.week.ago,
      publish_on_save: true,
    }
    defaults.merge!(options)
    BcmsNews::NewsArticle.create!(defaults)
  end
end

class ActiveSupport::TestCase
  include FakeFactoryGirl
  FakeFactoryGirl.count = 0
  
end
