#
# Copyright 2014, Grid Dynamics International, Inc.
#

execute "Building CRS" do
    command "ant all > #{node[:atg][:log_dir]}/ant_build_#{Time.now.strftime("%H:%M_%m-%d-%Y")}"
    environment({ 
        "DYNAMO_HOME" => "#{node[:atg][:installation_dir]}/home" 
    })
    cwd "#{node[:atg][:installation_dir]}/CommerceReferenceStore/Store"
    action :run
end

[:production, :publishing].each do |instance|
    execute "Assembling #{node[:atg][instance][:ear_path]}" do
        command "#{node[:atg][:installation_dir]}/home/bin/runAssembler \
        -pack -standalone \
        -server #{node[:atg][instance][:instance]} \
        #{node[:atg][instance][:ear_path]} \
        -layer EndecaPreview \
        -m #{node[:atg][instance][:module_list].join(' ')} > \
        #{node[:atg][:log_dir]}/#{node[:atg][:publishing][:instance]}-assemble-#{Time.now.strftime("%H:%M_%m-%d-%Y")}.log"
        environment({
            "DYNAMO_HOME" => "#{node[:atg][:installation_dir]}/home"
        })
        creates node[:atg][instance][:ear_file]
        action :run
    end
end
