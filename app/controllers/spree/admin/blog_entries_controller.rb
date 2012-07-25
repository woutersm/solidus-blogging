class Spree::Admin::BlogEntriesController < Spree::Admin::ResourceController
  #resource_controller

  # index.before do 
  #   @blog_entries = BlogEntry.find(:all, :order => "created_at DESC")
  # end  
  
  def edit
    @blog_entry = @object
  end
  
  def new 
    @blog_entry = @object
  end

  # new_action.before do
  #   @blog_entry.build_blog_entry_image
  # end 

  # create.wants.html { redirect_to admin_blog_entries_path }
  # update.wants.html { redirect_to admin_blog_entries_path } 
end
