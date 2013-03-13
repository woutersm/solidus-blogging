class Spree::BlogEntriesController < Spree::BaseController

  before_filter :load_news_archive_data 
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  
  def index
     @blog_entries = Spree::BlogEntry.visible
  end
  
  def show
    if try_spree_current_user.try(:has_spree_role?, "admin")
      @blog_entry = Spree::BlogEntry.find_by_permalink!(params[:slug])
    else
      @blog_entry = Spree::BlogEntry.visible.find_by_permalink!(params[:slug])
    end
    @title = @blog_entry.title
  end

  def tag
    @blog_entries = Spree::BlogEntry.visible.by_tag(params[:tag])
    @tag_name = params[:tag] if @blog_entries.any?
    render :action => :index
  end

  def archive
    @blog_entries = Spree::BlogEntry.visible.by_date(params)
    render :action => :index
  end
  
  def feed
    @blog_entries = Spree::BlogEntry.visible.limit(20)
    render :layout => false
  end 

  def accurate_title
    @blog_entry ?  @blog_entry.title : "my title"
  end

  private

  def load_news_archive_data
    @news_archive = Spree::BlogEntry.organize_blog_entries
  end
end
