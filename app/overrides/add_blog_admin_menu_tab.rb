Deface::Override.new(:virtual_path => "layouts/admin",
                     :name => "add blog admin menu tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => %q{<%= tab(:blog_entries, :label => :blog ) %>})