module BlogEntriesHelper     
  def post_link_list
       link = Struct.new(:name,:url)
       BlogEntry.recent.collect { |post| link.new( post.title, blog_entry_permalink(post)) }
  end
  def blog_entry_permalink(e)
     blog_entry_permalink_path :year => e.published_at.strftime("%Y"), :month => e.published_at.strftime("%m"), :day => e.published_at.strftime("%d"), :slug => e.permalink
  end
  def blog_entry_url_permalink(e)
     blog_entry_permalink_url :year => e.published_at.strftime("%Y"), :month => e.published_at.strftime("%m"), :day => e.published_at.strftime("%d"), :slug => e.permalink
  end
end
