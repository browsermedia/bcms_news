require 'rails'
require 'browsercms'

module News
  class Engine < Rails::Engine
    include Cms::Module
    puts "I'm the News::Engine"
  end
  
end