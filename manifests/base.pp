#
node default {
	#include base
	#class {'puppet-redmine'}

	#include vhosts

	#include apache
	#class {'mysql':
		#rootpass => "root";
	#}
	#class {'redmine':
		#servername => "foo";
	#}

  include aptget
  include graphite
}

