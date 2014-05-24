#
# Copyright 2014, Grid Dynamics International, Inc.
#

[:tmp_dir, :log_dir, :binaries_dir, :config_dir, :wlst_dir ].each do |dir|
	directory "#{node[:atg][dir]}" do
		owner 'root'
		group 'root'
		mode 00755
		recursive true
		action :create
	end
end

["git", "ant"].each do |package|
	package "#{package}" do
		action :install
	end
end

