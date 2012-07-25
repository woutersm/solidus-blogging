Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "add_blog_admin_menu",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:blog_entries, :label => 'Blog') %>",
                     :disabled => false)