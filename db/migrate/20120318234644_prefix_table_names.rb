class PrefixTableNames < ActiveRecord::Migration
  def change
    rename_table :blog_entries, :spree_blog_entries
  end
end
