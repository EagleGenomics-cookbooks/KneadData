# attributes to control Java installation
# default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '8'

# default['java']['oracle']['accept_oracle_download_terms'] = true

# The currely oracle link, but requires login 
# https://www.oracle.com/webapps/redirect/signon?nexturl=https://download.oracle.com/otn/java/jdk/8u202-b08/1961070e4c9b4e26a04e7f5a083f551e/jdk-8u202-linux-x64.tar.gz
# default['java']['jdk']['7']['x86_64']['url']

# poise-python configuration
default['poise-python']['install_python2']

# Bowtie configuration
default['Bowtie']['version'] = '2.2.9'

# KneadData attributes
default['KneadData']['version'] = 'v0.5.1'
default['KneadData']['install_dir'] = '/usr/local'
