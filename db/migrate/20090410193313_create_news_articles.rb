class CreateNewsArticles < ActiveRecord::Migration
  def self.up
    create_versioned_table :news_articles do |t|
      t.string :name 
      t.string :slug
      t.datetime :release_date 
      t.belongs_to :category 
      t.belongs_to :attachment
      t.integer :attachment_version 
      t.text :summary 
      t.text :body, :size => (64.kilobytes + 1) 
    end
  end

  def self.down
    ContentType.delete_all(['name = ?', 'NewsArticle'])
    CategoryType.all(:conditions => ['name = ?', 'News Article']).each(&:destroy)
    drop_table :news_release_versions
    drop_table :news_releases
  end
end
