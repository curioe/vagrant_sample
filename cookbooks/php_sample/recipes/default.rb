require_recipe "apt"
require_recipe "apache2::mod_php5"
require_recipe "php"

execute "disable-default-site" do
  command "sudo a2dissite default"
  notifies :restart, resources(:service => "apache2")
end

web_app "application" do
  template "project.conf.erb"
end