Atg Cookbook
==================


Requirements
------------



Attributes
----------

###Common
Required	| Name                             |Default                        | Description
---------	|-------------                     |-----                          |--------
			|`[:atg][:cim][:batch_file]`		|crs_with_endeca_search.erb   |
			|`[:atg][:tmp_dir]`					|/tmp"                         |
			|`[:atg][:installation_dir]`		|/u01/app/ATG"					|
			|`[:atg][:log_dir]`					|#{node[:atg][:tmp_dir]}/logs/atg
			|`[:atg][:home]`						|#{node[:atg][:installation_dir]}/home
			|`[:atg][:binary_url]`				|nil
			|`[:atg][:store_url]`					|nil
			|`[:atg][:crs][:git_url]`				|nil
			|`[:atg][:crs][:git_revision]`		|master
			|`[:atg][:non_switching]`				|true
			|`[:atg][:without_publising]`			|true
			|`[:atg][:admin_password]`			|nil
			|`[:atg][:merch_password]`			|nil
			|`[:atg][:webserver]`					|Weblogic
			|`[:atg][:bea_home]`					|/opt/middleware
			|`[:atg][:jrockit][:installation_dir]`|#{node[:atg][:bea_home]}/jrockit		

###Weblogic
				
Required	| Name                             |Default                        | Description
---------	|-------------                     |-----                          |--------
			|`[:atg][:weblogic][:host]`			|node[:cloud][:public_hostname]
			|`[:atg][:weblogic][:port]`			|7001
			|`[:atg][:weblogic][:username]`		|weblogic
			|`[:atg][:weblogic][:password]`		|nil
			|`[:atg][:weblogic][:installation_dir]`|#{node[:atg][:bea_home]}/weblogic
			|`[:atg][:weblogic][:domain_name]`	|node[:cloud][:public_hostname]
			|`[:atg][:weblogic][:domain_path]`	|#{node[:atg][:bea_home]}/user_domains/#{node[:atg][:weblogic][:domain_name]}
###Db
				
Required	| Name                             |Default                        | Description
---------	|-------------                     |-----                          |--------
			|`[:atg][:db][:username]`				|system
			|`[:atg][:db][:password]`				|nil
			|`[:atg][:db][:connector_url]`		|nil
			|`[:atg][:db][:host]`					|localhost
			|`[:atg][:db][:port]`					|1521
			|`[:atg][:db][:sid]`					|XE
###Production
				
Required	| Name                             |Default                        | Description
---------	|-------------                     |-----                          |--------
			|`[:atg][:production][:instance]`		|atg_production_lockserver
			|`[:atg][:production][:app_name]`		|CRS
			|`[:atg][:production][:lockserver][:host]`|localhost
			|`[:atg][:production][:lockserver][:port]`|9012
			|`[:atg][:production][:ports][:http]`|7003
			|`[:atg][:production][:ports][:https]`|7004
			|`[:atg][:production][:ports][:rmi]`	|8860
			|`[:atg][:production][:ports][:drp]`	|8850
			|`[:atg][:production][:ports][:deploy]`|8810
			|`[:atg][:production][:db][:username]`|atg_prod
			|`[:atg][:production][:db][:password]`|nil
			|`[:atg][:production][:db][:hostname]`|node[:atg][:db][:host]
			|`[:atg][:production][:db][:port]`	|node[:atg][:db][:port]
			|`[:atg][:production][:db][:type]`	|oraclethin
			|`[:atg][:production][:db][:jdni_name]`|ATGProductionDS
			|`[:atg][:production][:db][:db_name]`|XE
			|`[:atg][:production][:db][:driver_classpath]`|oracle.jdbc.xa.client.OracleXADataSource
###Publishing
Required	| Name                             |Default                        | Description
---------	|-------------                     |-----                          |--------
			|`[:atg][:publishing][:instance]`		|atg_publishing_lockserver
			|`[:atg][:publishing][:app_name]`		|CRS
			|`[:atg][:publishing][:lockserver][:host]`|localhost
			|`[:atg][:publishing][:lockserver][:port]`|9010
			|`[:atg][:publishing][:ports][:http]`|7103
			|`[:atg][:publishing][:ports][:https]`|7104
			|`[:atg][:publishing][:ports][:rmi]`	|8861
			|`[:atg][:publishing][:ports][:drp]`	|8851
			|`[:atg][:publishing][:ports][:deploy]`|8811
			|`[:atg][:publishing][:ports][:sync_deploy]`|8816
			|`[:atg][:publishing][:db][:username]`|atg_publ
			|`[:atg][:publishing][:db][:password]`|nil
			|`[:atg][:publishing][:db][:hostname]`|node[:atg][:db][:host]
			|`[:atg][:publishing][:db][:port]`	|node[:atg][:db][:port]
			|`[:atg][:publishing][:db][:type]`	|oraclethin
			|`[:atg][:publishing][:db][:jdni_name]`|ATGPublishingDS
			|`[:atg][:publishing][:db][:db_name]`|XE
			|`[:atg][:publishing][:db][:driver_classpath]`|oracle.jdbc.xa.client.OracleXADataSource
###Switch_a
				
Required	| Name                             |Default                        | Description
---------	|-------------                     |-----                          |--------
			|`[:atg][:switch_a][:instance]`		|atg_production_lockserver
			|`[:atg][:switch_a][:db][:username]`	|atg_switch_a
			|`[:atg][:switch_a][:db][:password]`	|nil
			|`[:atg][:switch_a][:db][:hostname]`	|node[:atg][:db][:host]
			|`[:atg][:switch_a][:db][:port]`		|node[:atg][:db][:port]
			|`[:atg][:switch_a][:db][:type]`		|oraclethin
			|`[:atg][:switch_a][:db][:jdni_name]`|ATGProductionDS
			|`[:atg][:switch_a][:db][:db_name]`	|XE
			|`[:atg][:switch_a][:db][:driver_classpath]`|oracle.jdbc.xa.client.OracleXADataSource
###Switch_b
				
			
Required	| Name                             |Default                        | Description
---------	|-------------                     |-----                          |--------
			|`[:atg][:switch_b][:instance]`		|atg_production_lockserver
			|`[:atg][:switch_b][:db][:username]`	|atg_switch_b
			|`[:atg][:switch_b][:db][:password]`|nil
			|`[:atg][:switch_b][:db][:hostname]`	|node[:atg][:db][:host]
			|`[:atg][:switch_b][:db][:port]`		|node[:atg][:db][:port]
			|`[:atg][:switch_b][:db][:type]`		|oraclethin
			|`[:atg][:switch_b][:db][:jdni_name]`|ATGProductionDS
			|`[:atg][:switch_b][:db][:db_name]`	|XE
			|`[:atg][:switch_b][:db][:driver_classpath]`|oracle.jdbc.xa.client.OracleXADataSource
###Endeca
				
Required	| Name                             |Default                        | Description
---------	|-------------                     |-----                          |--------
			|`[:atg][:endeca][:path]`				|/opt/endeca
			|`[:atg][:endeca][:application][:appname]`|CRS
			|`[:atg][:endeca][:application][:deploymentpath]`|#{node[:atg][:endeca][:path]}/apps
			|`[:atg][:endeca][:application][:rootpath]`|#{node[:atg][:endeca][:application][:deploymentpath]}/#{node[:atg][:endeca][:application][:appname]}
			|`[:atg][:endeca][:eac][:port]`		|8888
			|`[:atg][:endeca][:eac][:hostname]`	|localhost
			|`[:atg][:endeca][:dgraph][:port]`	|15000
			|`[:atg][:endeca][:authoring][:port]`|15002
			|`[:atg][:endeca][:logserver][:port]`|15010
			|`[:atg][:endeca][:cas][:hostname]`	|localhost
			|`[:atg][:endeca][:cas][:port]`		|8500
			|`[:atg][:endeca][:cas][:path]`		|#{node[:atg][:endeca][:path]}/CAS/3.1.2.1
			|`[:atg][:endeca][:cas][:jarversion]`|3.1.2
			|`[:atg][:endeca][:application][:host]`|localhost
			|`[:atg][:endeca][:workbench][:port]`|8006
			|`[:atg][:endeca][:workbench][:hostname]`|localhost
			|`[:atg][:endeca][:preview][:hostname]`|localhost
			|`[:atg][:endeca][:preview][:port]`	|7003
			|`[:atg][:endeca][:preview][:contectRoot]`|crs
			|`[:atg][:endeca][:mdex][:path]`		|#{node[:atg][:endeca][:path]}/MDEX/6.4.1.2
			|`[:atg][:endeca][:taf][:path]`		|#{node[:atg][:endeca][:path]}/ToolsAndFrameworks/3.1.2
			|`[:atg][:endeca][:ps][:path]`		|#{node[:atg][:endeca][:path]}/PlatformServices/6.1.4


Usage
-----



License and Authors
-------------------
* Author: Nickolay Yurin (<nyurin@griddynamics.com>)
* Author: Maksim Malchuk (<mmalchuck@griddynamics.com>)
* Author: Anton Haldin (<ahaldin@griddynamics.com>)

Copyright 2014, Grid Dynamics International, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.