#
# Cookbook:: KneadData
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'KneadData::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '18.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    # make sure the java recipe is included, as this will
    # install the needed Java libraries for the tool
    it 'includes the `java` recipe' do
      expect(chef_run).to include_recipe('java')
    end

    # make sure the python recipe is included, as this will
    # install the needed python libraries for the tool
    it 'includes the `poise-python` recipe' do
      expect(chef_run).to include_recipe('poise-python')
    end

    # make sure that the KneadData version env variable is set
    it 'adds KneadData version env variable' do
      expect(chef_run).to add_magic_shell_environment('KNEADDATA_VERSION')
    end
  end
end
