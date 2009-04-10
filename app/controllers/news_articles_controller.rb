class NewsArticlesController < ApplicationController
  
  def index
    @articles = NewsArticle.released.all(:limit => 15, :order => "release_date desc")
  end
  
end