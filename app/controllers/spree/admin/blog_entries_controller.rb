class Spree::Admin::BlogEntriesController < Spree::Admin::ResourceController
  helper :blog_entries 
  
  def edit
    @blog_entry = @object
  end
  
  def new 
    @blog_entry = @object
  end

  private

    def collection
      page = params[:page].to_i > 0 ? params[:page].to_i : 1
      per_page = params[:per_page].to_i > 0 ? params[:per_page].to_i : 20
      model_class.scoped.page(page).per(per_page)
    end

end
