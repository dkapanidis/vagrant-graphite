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

cd /opt/graphite/webapp/graphite/ && sudo python manage.py syncdb
sudo chown -R www-data:www-data /opt/graphite/storage/
sudo /etc/init.d/apache2 restart

cd /opt/graphite/ && sudo ./bin/carbon-cache.py start

cd ~/graphite/examples && sudo chmod +x example-client.py
sudo ./example-client.py
</pre>