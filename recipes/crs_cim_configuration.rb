#
# Copyright 2014, Grid Dynamics International, Inc.
#

include_recipe "atg::default"

cim_batch_file_name = "atg_endeca.cim"

template "#{node[:atg][:config_dir]}/#{cim_batch_file_name}" do
    source "cim/crs_with_endeca_search.erb"
    owner "root"
    group "root"
    mode 00644
end

execute "Run CRS configuration with CIM" do
    command "#{node[:atg][:home]}/bin/cim.sh -batch #{node[:atg][:config_dir]}/#{cim_batch_file_name} &>#{node[:atg][:log_dir]}/cim.log"
    action :run
end
