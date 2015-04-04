# More info at https://github.com/guard/guard#readme

# Blocked until guard-foodcritic maintainer cuts a new release.
# https://github.com/cgriego/guard-foodcritic/pull/8
# guard 'foodcritic', cmd: 'foreman run bundle exec foodcritic', cookbook_paths: './', cli: '-t ~FC023 -t ~FC005', all_on_start: true do
#   watch(/attributes\/.+\.rb$/)
#   watch(/providers\/.+\.rb$/)
#   watch(/recipes\/.+\.rb$/)
#   watch(/resources\/.+\.rb$/)
#   watch(/libraries\/.+\.rb$/)
#   watch('metadata.rb')
# end

guard 'rubocop', cmd: 'foreman run bundle exec rubocop' do
  watch(/attributes\/.+\.rb$/)
  watch(/providers\/.+\.rb$/)
  watch(/recipes\/.+\.rb$/)
  watch(/resources\/.+\.rb$/)
  watch(/libraries\/.+\.rb$/)
  watch('metadata.rb')
end

guard :rspec, cmd: 'foreman run bundle exec rspec', all_on_start: false, notification: true do
  watch(/^libraries\/(.+)\.rb$/)
  watch(/^spec\/(.+)_spec\.rb$/)
  watch(/^(recipes)\/(.+)\.rb$/)   { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')     { 'spec' }
end
