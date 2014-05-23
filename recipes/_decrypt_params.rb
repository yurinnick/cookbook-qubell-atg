#
# Cookbook Name:: atg
# Recipe:: _decrypt_params
#
# Copyright 2013, Grid Dynamics
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

##### Passwords of WebLogic and database #####

[:weblogic, :db].each do |component|
  unless node[:atg][component][:password].nil?
    node.set[:atg][component][:password] = Chef::SecureManager.decrypt(node[:atg][component][:password])
  end
end

##### Passwords of data sources #####

data_sources = [:production, :publishing]
data_sources << :switch_a << :switch_b unless node[:atg][:non_switching]

data_sources.each do |data_source|
  unless node[:atg][data_source][:db][:password].nil?
    node.set[:atg][data_source][:db][:password] = Chef::SecureManager.decrypt(node[:atg][data_source][:db][:password])
  end
end

##### Passwords of admin and merch users #####

[:admin_password, :merch_password].each do |pass|
  unless node[:atg][pass].nil?
    node.set[:atg][pass] = Chef::SecureManager.decrypt(node[:atg][pass])
  end
end

##### Git repo URL #####

unless node[:atg][:crs][:git_url].nil?
  node.set[:atg][:crs][:git_url] = Chef::SecureManager.decrypt(node[:atg][:crs][:git_url])
end
