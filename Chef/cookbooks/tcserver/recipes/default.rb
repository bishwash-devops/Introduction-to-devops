node.default['user'] = "tcadmin"
node.default['group'] = "tcgroup"
node.default['tomcat']['dir'] = "/opt/tcserver"
node.default['tomcat']['version'] = "apache-tomcat-8.5.24"
node.default['jdk'] = "java-1.8.0-openjdk.x86_64"

group "#{node.default['group']}" do
	action :create
end

user "#{node.default['user']}" do
	home "/home/#{node.default['user']}"
	group "#{node.default['group']}"
	action :create
end

directory "#{node.default['tomcat']['dir']}" do
	owner "#{node.default['user']}"
	group "#{node.default['group']}"
	action :create
end

remote_file "#{node.default['tomcat']['dir']}/tomcat.tar.gz" do
	source "http://supergsego.com/apache/tomcat/tomcat-8/v8.5.24/bin/#{node.default['tomcat']['version']}.tar.gz"
end

execute "extract tomcat.tar.gz" do
	command "tar xvzf tomcat.tar.gz"
	cwd "#{node.default['tomcat']['dir']}"
	user "#{node.default['user']}"
	not_if { File.exists?("#{node.default['tomcat']['dir']}/#{node.default['tomcat']['version']}")}
end

link "#{node.default['tomcat']['dir']}/tomcat" do
	to "#{node.default['tomcat']['dir']}/#{node.default['tomcat']['version']}"
end

execute "change ownership" do
	command "chown -R #{node.default['user']}:#{node.default['group']} #{node.default['tomcat']['dir']}/"
end

package "#{node.default['jdk']}" do
end

directory "/home/#{node.default['user']}" do
	owner "#{node.default['user']}"
end

template "/home/#{node.default['user']}/.bashrc" do
	source 'bashrc.erb'
	owner "#{node.default['user']}"
end