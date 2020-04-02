name 'KneadData'
maintainer 'Eagle Genomics Ltd'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache-2.0'
description 'Installs/Configures KneadData'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
chef_version '>= 14.10'
supports 'ubuntu', '= 18.04'
source_url 'https://github.com/EagleGenomics-cookbooks/KneadData'
issues_url 'https://github.com/EagleGenomics-cookbooks/KneadData/issues'
version '0.1.5'
depends 'java'
depends 'tar'
depends 'magic_shell', '~> 1.0'
depends 'poise-python'
depends 'Bowtie'
