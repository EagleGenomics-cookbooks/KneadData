#
# Cookbook Name:: KneadData
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################

include_recipe 'java'
include_recipe 'poise-python'

##########################################################

# download KneadData
remote_file "#{Chef::Config[:file_cache_path]}/#{node['KneadData']['file_name']}" do
  source node['KneadData']['download_url']
  action :create_if_missing
end

# extract the KneadData tar ball
tarball_x "#{Chef::Config[:file_cache_path]}/#{node['KneadData']['file_name']}" do
  destination node['KneadData']['install_dir']
  owner 'root'
  group 'staff'
  action :extract
end

# install the Python runtime
python_runtime '2' do
  version '2.7'
end

# install the KneadData tool
# TODO: ideally we don't want to install all the default dependencies, but
# rather provide the ones we need separately
python_execute 'setup.py' do
  cwd "#{node['KneadData']['install_dir']}/#{node['KneadData']['file_base']}"
  command 'setup.py install'
  python '2'
end
