SpreeBloggingSpree
==================

[![Build Status](https://travis-ci.org/stefansenk/spree-blogging-spree.png?branch=1-3-stable)](https://travis-ci.org/stefansenk/spree-blogging-spree)

A basic blogging solution for use with the [Spree](http://github.com/spree/spree) E-Commerce platform.

Differing significantly from the original, this version started out as a newly generated extension for Spree 1.2 with the logic copied over and tests moved to RSpec.

Try [spree_editor](http://github.com/spree/spree_editor/) for a rich text editor when editing the body of your blog entries.


Example
-------

TODO


Installation
------------

Add to your Gemfile:

    gem 'spree_blogging_spree', :git => 'git://github.com/stefansenk/spree-blogging-spree.git'

Run:

    $ bundle install
    $ rake railties:install:migrations
    $ rake db:migrate


Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec


TODO
----

- Allow searching for blog entries in the admin and front end.
- Do something with BlogEntryImage - add tests or remove?
- Get default per page from preferences.


Copyright (c) 2013 [name of extension creator], released under the New BSD License
