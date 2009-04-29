class NewsArticle < ActiveRecord::Base

  acts_as_content_block :belongs_to_attachment => true, :taggable => true
  
  belongs_to :category

  validates_presence_of :name, :release_date
  
  before_validation :set_slug
  
  named_scope :released, :conditions => 
    ["news_articles.published = ? and news_articles.release_date <= ?", true, Time.now]

  named_scope :released_on, lambda {|date|
    d = if date.kind_of?(Hash)
      Date.new(date[:year].to_i, date[:month].to_i, date[:day].to_i)
    else
      date
    end
    
    {:conditions => [
      "news_articles.release_date >= ? AND news_articles.release_date < ?", 
      d.beginning_of_day, 
      (d.beginning_of_day + 1.day)
    ]}
  }
      
  named_scope :with_slug, lambda{|slug| {:conditions => ["news_articles.slug = ?",slug]}}
  
  def category_name
    category ? category.name : nil
  end
  
  def set_slug
    self.slug = name.to_slug unless name.blank?
  end
  
  def route_params
    {:year => release_date.strftime("%Y"), 
      :month => release_date.strftime("%m"), 
      :day => release_date.strftime("%d"), 
      :slug => slug}
  end
  
  def year
    release_date ? release_date.year : nil
  end

  def month
    release_date ? release_date.month : nil
  end
  
  def set_attachment_section
    if new_record? && !attachment_file.blank?
      attachment.section = Section.first(:conditions => {:name => 'News'})
    end
  end
  
  def set_attachment_file_path
    if new_record? && !attachment_file.blank?
      attachment.file_path = "/news/articles/attachment/#{Time.now.to_s(:year_month_day)}/#{name.to_slug}.#{attachment_file.original_filename.split('.').last.to_s.downcase}" 
    end
  end

end
