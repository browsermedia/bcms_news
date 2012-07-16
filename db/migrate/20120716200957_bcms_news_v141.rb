require 'cms/upgrades/v3_5_0'

# If your project has a migration named 'bcms_news_130.rb', you should delete it. This migration is a 'miore complete' version of that.
class BcmsNewsV141 < ActiveRecord::Migration
  def change
    v3_5_0_apply_namespace_to_block("BcmsNews", "NewsArticle")
  end
end
