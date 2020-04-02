#
# Cookbook:: KneadData
# Recipe:: default
#
# Copyright:: 2019, Eagle Genomics Ltd, All Rights Reserved.
apt_update if node['platform_family'] == 'debian'
include_recipe 'java'
include_recipe 'python_setup'
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

# install the KneadData tool
# TODO: ideally we don't want to install all the default dependencies, but
# rather provide the ones we need separately
pyenv_script 'setup.py' do
  cwd "#{node['KneadData']['install_dir']}/#{kneaddata_file_base}"
  code 'python setup.py install --bypass-dependencies-install'
  pyenv_version node['python']['version']
end

magic_shell_environment 'KNEADDATA_VERSION' do
  value node['KneadData']['version']
end
