Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :blog_entries
  end
  resources :blog_entries

  match 'blog/tag/:tag', :to => 'blog_entries#tag', :as => :tag
  match 'blog/:year/:month/:day/:slug', :to => 'blog_entries#show', :as => :entry_permalink
  match 'blog/:year(/:month)(/:day)', :to => 'blog_entries#archive', :as => :news_archive,
    :constraints => {:year => /(19|20)\d{2}/, :month => /[01]?\d/, :day => /[0-3]?\d/}
end