#
# Cookbook Name:: steamcmd
# Recipe:: install
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'windows'

# Install steamcmd
windows_zipfile node['steamcmd']['install']['install_directory'] do
  source node['steamcmd']['install']['package_url']
  action :unzip
  not_if { ::File.exist?(node['steamcmd']['install']['install_directory'] + 'steamcmd.exe') }
end

windows_path node['steamcmd']['install']['install_directory'] do
  action :add
end
