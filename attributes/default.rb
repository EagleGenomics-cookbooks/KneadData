# attributes to control Java installation
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'
default['java']['oracle']['accept_oracle_download_terms'] = true

default['poise-python']['install_python2']

# KneadData attributes
default['KneadData']['file_base'] = 'kneaddata_v0.5.1'
default['KneadData']['file_ext'] = '.tar.gz'
default['KneadData']['file_name'] = node['KneadData']['file_base'] + node['KneadData']['file_ext'] # kneaddata_v0.5.1.tar.gz
default['KneadData']['download_url'] = 'https://bitbucket.org/biobakery/kneaddata/downloads/' + node['KneadData']['file_name']
default['KneadData']['install_dir'] = '/usr/local/'
