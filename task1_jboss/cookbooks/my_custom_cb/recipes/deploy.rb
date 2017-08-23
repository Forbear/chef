package ('unzip')

bash "Deploy warfile" do 
  code <<-DO
	  wget http://centerkey.com/jboss/HelloWorldWebApp.zip
	  unzip HelloWorldWebApp.zip
	  cp -r HellowWorld /opt/wildfly/standalone/deployments
  DO
end
