require 'browsercms'

module BcmsNews
  class Engine < Rails::Engine
    isolate_namespace BcmsNews
    include Cms::Module
  end
end
