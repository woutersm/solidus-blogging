require 'spec_helper'

describe "Blog Entry" do
  stub_authorization!

  context "as admin user" do
    before(:each) do
      @blog_entry = create(:blog_entry, 
        :title => "First blog entry", 
        :body => "Body of the blog entry.", 
        :summary => "", 
        :visible => false, 
        :published_at => DateTime.new(2010, 3, 11))

      visit spree.admin_path
      click_link "Blog"
    end

    context "index page" do
      it "should display blog titles" do
        page.should have_content("First blog entry")
      end
      it "should display blog published_at" do
        page.should have_content("11 Mar 2010")
      end
      it "should display blog visible" do
        page.should have_css('img', :alt => "Cross")
      end
    end

    it "should edit an existing blog entry" do
      within('table.entry-list tbody tr:nth-child(1)') { click_link "Edit" }
      fill_in 'Title', with: 'New title'
      fill_in 'Body', with: 'New body'
      fill_in 'Tag List', with: 'tag1, tag2'
      fill_in 'Summary', with: 'New summary'
      check 'Visible'
      fill_in 'Published at', with: '2013/2/1'
      fill_in 'Permalink', with: 'some-permalink-path'
      click_on 'Update'

      page.should have_content("Blog entry has been successfully updated")
      page.should have_content("New title")

      within('table.entry-list tbody tr:nth-child(1)') { click_link "Edit" }
      page.should have_content("New body")
      page.should have_content("New summary")
      find_field('blog_entry_title').value.should == "New title"
      find_field('blog_entry_tag_list').value.should == "tag1, tag2"
      find_field('blog_entry_published_at').value.should == "2013/02/01"
      find_field('blog_entry_visible').value.should == "1"
      find_field('blog_entry_permalink').value.should == "some-permalink-path"
    end
  end
end