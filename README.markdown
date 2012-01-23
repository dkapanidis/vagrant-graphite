Requirements
============

* Install Vagrant
* Install Puppet

Startup
=======

In order to launch the VM, download the code and do (inside the directory):

<pre>
vagrant up
</pre>

Vagrant + Puppet will materialize the VM.

Setup
=====

Once the VM is up and running you need to do the following:

<pre>
vagrant ssh
sudo su -

cd /opt/graphite/webapp/graphite/ && python manage.py syncdb
chown -R www-data:www-data /opt/graphite/storage/
/etc/init.d/apache2 restart

cd /opt/graphite/ && ./bin/carbon-cache.py start

cd ~/graphite-web/examples && chmod +x example-client.py
./example-client.py
</pre>