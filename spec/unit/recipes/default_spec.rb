#
# Cookbook Name:: KneadData
# Spec:: default
#
# Copyright (c) 2016 Eagle Genomics Ltd, Apache License, Version 2.0.
##########################################################

require 'spec_helper'

describe 'KneadData::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  # default: make sure the converge works
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
end
