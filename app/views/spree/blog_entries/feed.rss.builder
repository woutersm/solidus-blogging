xml.instruct! :xml, :version => "1.0" 
#xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/" xmlns:slash="http://purl.org/rss/1.0/modules/slash/" version="2.0"
# xmlns:atom="http://www.w3.org/2005/Atom"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{Spree::Config[:site_name]} Blog"
    #<atom:link href="http://www.antarcticglaciers.org/feed/" rel="self" type="application/rss+xml"/>
    xml.description ""
    xml.link blog_url

    @blog_entries.each do |blog_entry|
      xml.item do
        xml.title blog_entry.title
        # xml.description blog_entry.entry_summary
        xml.content blog_entry.body, :type => :html
        xml.pubDate blog_entry.published_at.to_s(:rfc822)
        xml.link blog_entry_url_permalink(blog_entry)
        xml.guid blog_entry_url_permalink(blog_entry)
        # <dc:creator></dc:creator>
        # xml.tag!("SOAP:Envelope") { ... }
        blog_entry.tag_list.each do |tag|
          xml.category tag
        end
      end
    end
  end
end



