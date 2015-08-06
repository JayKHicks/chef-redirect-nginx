# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'chefspec/berkshelf'

describe 'chef-redirect-nginx::default' do
  let('chef_run') do
    ChefSpec::SoloRunner.new do |node|
      stub_command('which nginx').and_return(nil)
    end.converge(described_recipe)
  end

  it 'enables the service nginx' do
    expect(chef_run).to enable_service('nginx')
  end

  it 'starts the service nginx' do
    expect(chef_run).to start_service('nginx')
  end

  it 'includes the recipe nginx' do
    expect(chef_run).to include_recipe('nginx')
  end

  it 'should have the server_names_hash_bucket_size set to 512' do
    expect(chef_run.node['nginx']['server_names_hash_bucket_size']).to eq('512')
  end

  it 'should have the user set to nobody' do
    expect(chef_run.node['nginx']['user']).to eq('nobody')
  end

  it 'should have the types_hash_max_size set to 8192' do
    expect(chef_run.node['nginx']['types_hash_max_size']).to eq('8192')
  end

  it 'should have the types_hash_bucket_size set to 256' do
    expect(chef_run.node['nginx']['types_hash_bucket_size']).to eq('256')
  end

  it 'should have the status::port set to 8080' do
    expect(chef_run.node['nginx']['status']['port']).to eq('8080')
  end
end
