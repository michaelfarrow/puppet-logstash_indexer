class logstash_indexer {

	$broker_host = hiera('logstash_indexer::broker_host', 'localhost')
	$elasticsearch_host = hiera('elasticsearch::host', 'localhost')

	class { 'logstash':
		# version => '1.4.2',
		install_contrib => true,
		manage_repo => true,
	}

	logstash::configfile { 'logstash_input':
		content => template('logstash_indexer/input.erb'),
		order   => 10,
	}

	logstash::configfile { 'logstash_filters':
		content => template('logstash_indexer/filters.erb'),
		order   => 20,
	}

	logstash::configfile { 'logstash_output':
		content => template('logstash_indexer/output.erb'),
		order   => 30,
	}

}