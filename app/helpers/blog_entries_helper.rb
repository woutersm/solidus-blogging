module BlogEntriesHelper
  # def entry_permalink(e)
  #     d = e.created_at
  #     entry_permalink_path :year => d.year, :month => d.month, :day => d.day, :slug => e.permalink
  #   end   
  def entry_permalink(e)
     #d = e.created_at.strftime("%m %d, %Y")
     entry_permalink_path :year => e.created_at.strftime("%Y"), :month => e.created_at.strftime("%m"), :day => e.created_at.strftime("%d"), :slug => e.permalink
   end

  def post_link_list(limit = 5)
       link = Struct.new(:name,:url)
       BlogEntry.find(:all, :limit => limit).collect { |post| link.new( post.title, entry_permalink(post)) }
  end
end
