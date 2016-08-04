#
# Cookbook Name:: KneadData
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################

include_recipe 'apt'
include_recipe 'java'
include_recipe 'poise-python'
include_recipe 'Bowtie'

##########################################################
kneaddata_file_base = "kneaddata_#{node['KneadData']['version']}"
kneaddata_file_name = "#{kneaddata_file_base}.tar.gz"
kneaddata_download_url = "https://bitbucket.org/biobakery/kneaddata/downloads/#{kneaddata_file_name}"

# download KneadData
remote_file "#{Chef::Config[:file_cache_path]}/#{kneaddata_file_name}" do
  source kneaddata_download_url
  action :create_if_missing
end

# extract the KneadData tar ball
tarball_x "#{Chef::Config[:file_cache_path]}/#{kneaddata_file_name}" do
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
  cwd "#{node['KneadData']['install_dir']}/#{kneaddata_file_base}"
  command 'setup.py install --bypass-dependencies-install'
  python '2'
end
