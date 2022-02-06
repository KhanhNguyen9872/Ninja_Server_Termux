# Virtual Hosts
#
# Required modules: mod_log_config

# If you want to maintain multiple domains/hostnames on your
# machine you can setup VirtualHost containers for them. Most configurations
# use only name-based virtual hosts so the server doesn't need to worry about
# IP addresses. This is indicated by the asterisks in the directives below.
#
# Please see the documentation at 
# <URL:http://httpd.apache.org/docs/2.4/vhosts/>
# for further details before you try to setup virtual hosts.
#
# You may use the command line option '-S' to verify your virtual host
# configuration.

#
# VirtualHost example:
# Almost any Apache directive may go into a VirtualHost container.
# The first VirtualHost section is used for all requests that do not
# match a ServerName or ServerAlias in any <VirtualHost> block.
#
<VirtualHost *:8080>
    ServerAdmin webmaster@dummy-host.example.com
    DocumentRoot "dc_path_manual"
    ServerName localhost
    ServerAlias www.dummy-host.example.com
    ErrorLog "var/log/apache2/localhost_Error_log"
    CustomLog "var/log/apache2/localhost_Access_log" common
</VirtualHost>

<VirtualHost *:8080>
    ServerAdmin webmaster@dummy-host2.example.com
    DocumentRoot "/data/data/com.termux/files/usr/share/phpmyadmin"
    ServerName 0.0.0.0
    ErrorLog "var/log/apache2/phpmyadmin_Error_log"
    CustomLog "var/log/apache2/phpmyadmin_Access_log" common
</VirtualHost>



