#
# Cookbook Name:: KneadData
# Recipe:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################

apt_update if node['platform_family'] == 'debian'
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
tar_extract "#{Chef::Config[:file_cache_path]}/#{kneaddata_file_name}" do
  action :extract_local
  target_dir node['KneadData']['install_dir']
  creates "#{node['KneadData']['install_dir']}/#{kneaddata_file_base}"
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

magic_shell_environment 'KNEADDATA_VERSION' do
  value node['KneadData']['version']
end
