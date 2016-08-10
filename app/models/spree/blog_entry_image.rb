class Spree::BlogEntryImage < Spree::Image
  has_attached_file :attachment,
  :styles => {:mini => '48x48#', :normal => '150x150#', :large => '1024x600>'},
  :path => "/assets/blog_entry_images/:id/:style/:basename.:extension",
  :url => "/assets/blog_entry_images/:id/:style/:basename.:extension"
end