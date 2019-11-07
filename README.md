# PROJECT BRAINSTORM

Web application using Ruby on Rails and ActiveRecord.

## Table of Contents
- Description
- Technologies
- Setup
- Resources
- License

### Description

Simple web application for Inventors to create and post ideas for Investors to view and/or decide to fund. Inventors can also comment/ collaborate on ideas.

### Possible Future Changes or Upgrades
- Investor funding amount available
- Idea funding goal met and how much remaining
- Picture for accountable on show page with default place holder

### Technologies

This application utilizes the Ruby Programming language and several gems (listed) ruby '2.6.1'

- gem 'rails', '~> 6.0.0'
- gem 'sqlite3', '~> 1.4'
- gem 'puma', '~> 3.11'
- gem 'sass-rails', '~> 5'
- gem 'webpacker', '~> 4.0'
- gem 'turbolinks', '~> 5'
- gem 'jbuilder', '~> 2.7'
- gem 'bcrypt', '~> 3.1.7'
- gem 'omniauth'
- gem 'omniauth-facebook'
- gem 'dotenv-rails'
- gem 'bootsnap', '>= 1.4.2'
- gem 'byebug'

### Setup

- To run this web application you must clone it from git@github.com: https://github.com/kelleymichelle/brainstorm copy and clone into your terminal.
- On command line type: git clone git@github.com:kelleymichelle/brainstorm.git
- cd brinstorm
- Run bundle install
- Run rails db:migrate
- Run rails s from the command line
- Goto localhost:3000 in your browser
- Signup for app by creating an account using valid email address and password.
- Create an inventor or investor accountable and start creating ideas or favoriting ideas from inventors.

### Resources

- https://semaphoreci.com/blog/2017/08/16/polymorphic-associations-in-rails.html
- https://stackoverflow.com/questions/4151650/rails-radio-buttons-for-collection-sets
- https://en.m.wikipedia.org/wiki/Invention
- https://www.theodinproject.com/courses/ruby-on-rails/lessons/active-record-associations
- https://apidock.com/rails/ActionView/Helpers/AssetTagHelper/image_tag
- http://stevenleiva.com/flash-messages-in-rails
- https://codediode.io/lessons/1788-hearting-liking-or-starring-with-rails
- https://medium.com/@tjoye20/ruby-access-control-basics-public-vs-private-vs-protected-methods-7788b26e04a7
- https://www.sitepoint.com/dry-off-your-rails-code-with-activesupportconcerns/
- https://api.rubyonrails.org/classes/ActionView/PartialRenderer.html

### License

MIT License

### Possible Future Changes of Upgrades

