#
# Copyright 2014, Grid Dynamics International, Inc.
#

nexus_configuration_object = Chef::Artifact::NexusConfiguration.new(
  node[:atg][:nexus][:endpoint], 
  node[:atg][:nexus][:repository],
  node[:atg][:nexus][:username], 
  node[:atg][:nexus][:password], 
  false)


[:production, :publishing].each do |instance_name|
  artifact_file node[:atg][instance_name][:ear_path] do
    location            node[:atg][instance_name][:ear_nexus_location]
    nexus_configuration nexus_configuration_object
    owner               "root"
    group               "root"
    action              :create
  end
end
