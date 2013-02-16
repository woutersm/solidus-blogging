class AddVisiblePublishedatAndSummaryToBlogEntries < ActiveRecord::Migration
  def change
    add_column :spree_blog_entries, :visible, :boolean
    add_column :spree_blog_entries, :published_at, :datetime
    add_column :spree_blog_entries, :summary, :text
  end
end
