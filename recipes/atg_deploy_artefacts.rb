#
# Copyright 2014, Grid Dynamics International, Inc.
#

include_recipe "atg::default"

execute "Prepending protocol.jar" do
  command "cp #{node[:atg][:home]}/../DAS/lib/protocol.jar #{node[:atg][:weblogic][:domain_path]}/lib/protocol.jar"
  creates "#{node[:atg][:weblogic][:domain_path]}/lib/protocol.jar"
  action :run
end

template "#{node[:atg][:wlst_dir]}/atg_create_servers.py" do
  source "weblogic/atg_create_servers.py.erb"
  owner "root"
  group "root"
  mode 00644
end

template "#{node[:atg][:wlst_dir]}/atg_create_datasources.py" do
  source "weblogic/atg_create_datasources.py.erb"
  owner "root"
  group "root"
  mode 00644
end

template "#{node[:atg][:wlst_dir]}/atg_deploy_ears.py" do
  source "weblogic/atg_deploy_ears.py.erb"
  owner "root"
  group "root"
  mode 00644
end

[ "atg_create_servers", "atg_create_datasources", "atg_deploy_ears"].each do |script|
  wlst_script "#{script}" do
    script "#{node[:atg][:wlst_dir]}/#{script}.py"
    log "#{node[:atg][:log_dir]}/#{script}.log"
  end
end
