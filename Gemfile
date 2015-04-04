source 'https://rubygems.org'

group :kitchen_common do
  gem 'test-kitchen', '~> 1.4.0.beta.2'
end

group :kitchen_vagrant do
  gem 'kitchen-vagrant', '~> 0.17.0.beta.2'
  gem 'winrm-transport'
end

group :lint do
  gem 'foodcritic'
  gem 'rubocop'
end

group :unit do
  gem 'berkshelf'
  gem 'chefspec'
end

group :development do
  gem 'guard', '~> 2.4'
  gem 'guard-kitchen'
  gem 'guard-foodcritic'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rake'
end
