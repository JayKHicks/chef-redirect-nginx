#
# Cookbook Name:: chef-redirect-nginx
# Recipe:: default
#
# Copyright (C) 2015 Jay Hicks
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx::default'

# cookbook_file "#{node['nginx']['dir']}/redirects.conf" do

cookbook_file '/etc/nginx/redirects.conf' do
  source 'redirects.conf'
  mode '0644'
  action :create
end
