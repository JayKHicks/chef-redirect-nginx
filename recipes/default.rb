#
# Cookbook Name:: chef-redirect-nginx
# Recipe:: default
#
# Copyright (C) 2015 Jay Hicks
#
# All rights reserved - Do Not Redistribute
#

node.override['nginx']['server_names_hash_bucket_size'] = '512'
node.override['nginx']['user'] = 'nobody'
node.override['nginx']['types_hash_max_size'] = '8192'
node.override['nginx']['types_hash_bucket_size'] = '256'
node.override['nginx']['status']['port'] = '8080'

include_recipe 'nginx::default'

# cookbook_file "#{node['nginx']['dir']}/redirects.conf" do

cookbook_file '/etc/nginx/redirects.conf' do
  source 'redirects.conf'
  mode '0644'
  action :create
end
