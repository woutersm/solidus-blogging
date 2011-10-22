class BlogEntriesController < Spree::BaseController
  #resource_controller
  #actions :show, :index

  before_filter :load_news_archive_data   
  
  def index
     @blog_entries = SpreeBlogging::BlogEntry.order("created_at DESC")
  end  
  
  def show
     @blog_entry = SpreeBlogging::BlogEntry.find_by_permalink(params[:slug])
  end

  def tag
    @blog_entries = SpreeBlogging::BlogEntry.by_tag(params[:tag])   
    render :action => :index
  end

  def archive
    @blog_entries = SpreeBlogging::BlogEntry.by_date(params)
    render :action => :index
  end

  private

  def load_news_archive_data
    @news_archive = SpreeBlogging::BlogEntry.organize_blog_entries
  end
end
