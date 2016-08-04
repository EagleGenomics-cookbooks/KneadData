source 'https://supermarket.chef.io'

# cookbooks on github but not on the opscode supermarket.
def company_cookbook(name, version = '>= 0.0.0', options = {})
  cookbook(name, version, { git: "git@github.com:EagleGenomics-cookbooks/#{name}.git" }.merge(options))
end

company_cookbook 'Bowtie'

cookbook 'tarball', git: 'https://github.com/ooyala/tarball-chef-cookbook.git'

metadata
