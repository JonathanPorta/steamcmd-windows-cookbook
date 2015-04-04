require 'serverspec'

set :backend, :cmd

require 'rbconfig'
case RbConfig::CONFIG['host_os']
when /mswin|msys|mingw|cygwin|bccwin|wince|emc/ # Borrowed from the windows cookbook spec_helper. :)
  set :os, family: 'windows'
end
