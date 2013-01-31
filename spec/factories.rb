require 'factory_girl'

FactoryGirl.define do
  factory :blog_entry, :class => Spree::BlogEntry do
    title 'A Blog Entry Title'
    body 'A Blog Entry Body'
    permalink {|entry| entry.title.to_url }
    created_at Date.new(2010)
  end
end
