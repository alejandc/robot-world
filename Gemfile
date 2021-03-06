source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 6.0.3", ">= 6.0.3.4"
gem "pg"
# Use Puma as the app server
gem "puma", "~> 4.1"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 4.0"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.7"
# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"
gem "simple_enum"
# Background process
gem "sidekiq"
gem "httparty"
gem "rails-observers"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false
gem "faker"
group :development, :test do
  gem "pry"
  gem "pry-byebug"
  gem "shoulda-matchers", "~> 3.1"
  gem "database_cleaner-active_record"
  gem "annotate"
  gem "rspec-rails"
  gem "factory_bot_rails", "~> 4.0"
  gem "letter_opener"
  gem "rspec_junit_formatter"
end

group :development do
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "rspec-sidekiq"
  gem "simplecov", require: false

  # Performance test
  gem "rails-perftest"
  gem "ruby-prof"
  gem "minitest", "5.10.3"
end
