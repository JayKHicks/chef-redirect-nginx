# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'chefspec/berkshelf'

describe 'chef-redirect-nginx::default' do
  let('chef_run') do
    ChefSpec::SoloRunner.new do |node|
    end.converge(described_recipe)
  end

  before do
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).and_call_original
    allow_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('nginx::default')
  end
  
  it 'assert package nginx was installed' do
    expect_any_instance_of(Chef::Recipe).to receive(:include_recipe).with('nginx::default')
    chef_run
  end

  it 'assert package redirects.conf was created' do
    expect(chef_run).to create_cookbook_file('/etc/nginx/redirects.conf')
  end
end
