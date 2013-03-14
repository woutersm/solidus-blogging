class AddVisiblePublishedatAndSummaryToBlogEntries < ActiveRecord::Migration
  def change
    add_column :spree_blog_entries, :visible, :boolean, :default => 0
    add_column :spree_blog_entries, :published_at, :datetime
    add_column :spree_blog_entries, :summary, :text
  end
end
