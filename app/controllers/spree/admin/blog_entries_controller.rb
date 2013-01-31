class Spree::Admin::BlogEntriesController < Spree::Admin::ResourceController
  helper :blog_entries 
  
  def edit
    @blog_entry = @object
  end
  
  def new 
    @blog_entry = @object
  end

end
