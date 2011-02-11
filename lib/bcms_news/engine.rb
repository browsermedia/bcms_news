require 'browsercms'

module BcmsNews
  class Engine < Rails::Engine
    include Cms::Module
  end
end