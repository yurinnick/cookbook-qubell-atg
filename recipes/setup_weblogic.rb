#
# Copyright 2014, Grid Dynamics International, Inc.
#

include_recipe "atg::default"

template "#{node[:atg][:wlst_dir]}/atg_configure_instances.py" do
	source "weblogic/atg_configure_instances.py.erb"
	owner "root"
	group "root"
	mode 00644
end

template "#{node[:atg][:wlst_dir]}/weblogic_disable_auth.py" do
	source "weblogic/weblogic_disable_auth.py.erb"
	owner "root"
	group "root"
	mode 00644
end

template "#{node[:atg][:wlst_dir]}/atg_start_instances.py" do
	source "weblogic/atg_start_instances.py.erb"
	owner "root"
	group "root"
	mode 00644
end

[ "atg_configure_instances", "weblogic_disable_auth", "atg_start_instances" ].each do |script|
	wlst_script "#{script}" do
		script "#{node[:atg][:wlst_dir]}/#{script}.py"
		log "#{node[:atg][:log_dir]}/#{script}.log"
	end
end
