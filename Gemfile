source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'bcrypt', platforms: :ruby

gem 'aws-sdk-rails'
gem 'binding_of_caller'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'devise-i18n'
gem 'devise'
gem 'fcm'
gem 'font-awesome-rails'
gem 'inspinia-rails', git: "https://:x-oauth-basic@github.com/wondersistemas/inspinia-rails"
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'json'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rack-cors'
gem 'rails-i18n'
gem 'ransack'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate', '~> 3.1'
gem 'wonder_navigation'
gem 'wonder_rails_helpers', git: "https://:x-oauth-basic@github.com/wondersistemas/wonder_rails_helpers"

group :development, :test do
  gem 'better_errors'
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'foreman'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'rubocop'
  gem 'htmlbeautifier'
end

group :test do
  gem 'capybara-screenshot'
  gem 'capybara'
  gem 'codeclimate-test-reporter', require: nil
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'rspec-collection_matchers'
  gem 'rspec-html-matchers'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
