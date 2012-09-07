class Spree::BlogEntriesController < Spree::BaseController

  before_filter :load_news_archive_data   
  
  def index
     @blog_entries = Spree::BlogEntry.order("created_at DESC")
  end  
  
  def show
     @blog_entry = Spree::BlogEntry.find_by_permalink(params[:slug])
  end

  def tag
    @blog_entries = Spree::BlogEntry.by_tag(params[:tag])   
    render :action => :index
  end

  def archive
    @blog_entries = Spree::BlogEntry.by_date(params)
    render :action => :index
  end

  def accurate_title
    @blog_entry ?  @blog_entry.title : nil
  end

  private

  def load_news_archive_data
    @news_archive = Spree::BlogEntry.organize_blog_entries
  end
end
