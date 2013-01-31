require 'spec_helper'

describe "BlogEntries" do
  before(:each) do
    @blog_entry = create(:blog_entry, 
      :title => "First blog entry", 
      :body => "Body of the blog entry.", 
      :created_at => Date.new(2020, 3, 11))
    @blog_entry.tag_list = "baz, bob"
    @blog_entry.save!
    @blog_entry2 = create(:blog_entry, 
      :title => "Another blog entry", 
      :body => "Another body.", 
      :created_at => Date.new(2020, 2, 4))
    @blog_entry2.tag_list = "bob, ben"
    @blog_entry2.save!
  end

  context "index page" do
    it "should display the blog entry titles" do
      visit "/blog"
      find('#content').should have_content("First blog entry")
      find('#content').should have_content("Another blog entry")
    end
    it "should display the blog entry body summary" do
      visit "/blog"
      find('#content').should have_content("Body of the blog entry.")
      find('#content').should have_content("Another body.")
    end
    it "should display the blog entry tags" do
      visit "/blog"
      find('#content').should have_content("baz")
      find('#content').should have_content("bob")
      find('#content').should have_content("ben")
    end
  end

  context "blog entry page" do
    it "should display the blog entry title and body" do
      visit "/blog/2020/03/11/first-blog-entry"
      find('#content').should have_content("First blog entry")
      find('#content').should have_content("Body of the blog entry.")
    end
    it "should not display a different blog entry" do
      visit "/blog/2020/03/11/first-blog-entry"
      find('#content').should_not have_content("Another blog entry")
      find('#content').should_not have_content("Another body")
    end
    it "should display the blog entry tags" do
      visit "/blog/2020/03/11/first-blog-entry"
      find('#content').should have_content("baz")
      find('#content').should have_content("bob")
      find('#content').should_not have_content("ben")
    end
  end

  context "tag page" do
    it "should display the blog entries" do
      visit "/blog/tag/bob"
      find('#content').should have_content("First blog entry")
      find('#content').should have_content("Body of the blog entry.")
      find('#content').should have_content("Another blog entry")
      find('#content').should have_content("Another body")
    end
    it "should only diplay the tagged blog entries" do
      visit "/blog/tag/baz"
      find('#content').should have_content("First blog entry")
      find('#content').should have_content("Body of the blog entry.")
      find('#content').should_not have_content("Another blog entry")
      find('#content').should_not have_content("Another body")
    end
  end

  context "archive page" do
    it "should display the blog entries" do
      visit "/blog/2020"
      find('#content').should have_content("First blog entry")
      find('#content').should have_content("Body of the blog entry.")
      find('#content').should have_content("Another blog entry")
      find('#content').should have_content("Another body")
    end
    it "should not diplay blog entries for the wrong period" do
      visit "/blog/2020/02"
      find('#content').should_not have_content("First blog entry")
      find('#content').should_not have_content("Body of the blog entry.")
      find('#content').should have_content("Another blog entry")
      find('#content').should have_content("Another body")
    end
  end
end

