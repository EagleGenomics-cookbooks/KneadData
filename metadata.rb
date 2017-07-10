name 'KneadData'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache v2.0'
description 'Installs/Configures KneadData'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.3'

source_url 'https://github.com/EagleGenomics-cookbooks/KneadData'
issues_url 'https://github.com/EagleGenomics-cookbooks/KneadData/issues'

depends 'apt'
depends 'java', '~> 1.41'
depends 'tarball'
depends 'magic_shell', '~> 1.0'
depends 'poise-python'
depends 'Bowtie'
