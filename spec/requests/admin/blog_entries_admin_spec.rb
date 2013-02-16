require 'spec_helper'

describe "Blog Entry" do
  stub_authorization!

  context "as admin user" do
    before(:each) do
      @blog_entry = create(:blog_entry, 
        :title => "First blog entry", 
        :body => "Body of the blog entry.", 
        :created_at => Date.new(2020, 3, 11))

      visit spree.admin_path
      click_link "Blog"
    end

    it "should display blog entries" do
      page.should have_content("First blog entry")
    end

    it "should edit an existing blog entry" do
      within('table.entry-list tbody tr:nth-child(1)') { click_link "Edit" }
      fill_in 'Title', with: 'New title'
      fill_in 'Body', with: 'New body'
      fill_in 'Tag List', with: 'tag1, tag2'
      click_on 'Update'
      page.should have_content("Blog entry has been successfully updated")
      page.should have_content("New title")
    end
  end
end