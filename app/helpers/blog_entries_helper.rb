module BlogEntriesHelper     
  def post_link_list
       link = Struct.new(:name,:url)
       BlogEntry.recent.collect { |post| link.new( post.title, blog_entry_permalink(post)) }
  end           
  def blog_entry_permalink(e)
     blog_entry_permalink_path :year => e.created_at.strftime("%Y"), :month => e.created_at.strftime("%m"), :day => e.created_at.strftime("%d"), :slug => e.permalink
   end
end
