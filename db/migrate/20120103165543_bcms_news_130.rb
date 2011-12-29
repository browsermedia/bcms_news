# Upgrade to BcmsNew v1.3.0
class BcmsNews130 < ActiveRecord::Migration
  def change
    # These need to be done since v1.2 had a different table name 
    rename_table :news_articles, :bcms_news_news_articles 
    rename_table :news_article_versions, :bcms_news_news_article_versions 
       
    # This is needed to match new BrowserCMS 3.4 naming convention for versioning column.
    if column_exists? :bcms_news_news_article_versions, :news_article_id
      rename_column :bcms_news_news_article_versions, :news_article_id, :original_record_id
    end
  end
end
