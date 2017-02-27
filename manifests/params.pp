# kafka params
class kafka::params {
  $version        = '0.9.0.1'
  $scala_version  = '2.11'
  $install_dir    = '/opt/kafka'
  $config_dir     = '/etc/kafka'
  $log_dir        = '/var/log/kafka'
  $install_java   = true
  $package_name   = 'kafka'
  $service_name   = 'kafka'
  $package_ensure = 'present'
  $group_id       = undef
  $user_id        = undef
  $group          = 'kafka'
  $user           = 'kafka'

  $service_requires_zookeeper = true
  $broker_service_install = true
  $broker_service_ensure = 'running'


  $broker_jmx_opts = '-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=9990'
  $broker_heap_opts = '-Xmx1G -Xms1G'
  $broker_log4j_opts = "-Dlog4j.configuration=file:${config_dir}/log4j.properties"
  $broker_opts = ''

  $mirror_jmx_opts   = '-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=9991'
  $mirror_log4j_opts = $broker_log4j_opts

  $producer_jmx_opts   = '-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=9992'
  $producer_log4j_opts = $broker_log4j_opts

  $consumer_jmx_opts   = '-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=9993'
  $consumer_log4j_opts = $broker_log4j_opts

  $service_restart = true
  $broker_config_defaults = {
    'zookeeper.connect'                             => 'localhost:2181',
    'advertised.host.name'                          => '',
    'advertised.listeners'                          => '',
    'advertised.port'                               => '',
    'auto.create.topics.enable'                     => true,
    'auto.leader.rebalance.enable'                  => true,
    'background.threads'                            => '10',
    'broker.id'                                     => '0',
    'compression.type'                              => 'producer',
    'delete.topic.enable'                           => false,
    'host.name'                                     => '',
    'leader.imbalance.check.interval.seconds'       => '300',
    'leader.imbalance.per.broker.percentage'        => '10',
    'listeners'                                     => '',
    'log.dir'                                       => "${log_dir}/data",
    'log.dirs'                                      => '',
    'log.flush.interval.messages'                   => '9223372036854775807',
    'log.flush.interval.ms'                         => '',
    'log.flush.offset.checkpoint.interval.ms'       => '60000',
    'log.flush.scheduler.interval.ms'               => '9223372036854775807',
    'log.retention.bytes'                           => '-1',
    'log.retention.hours'                           => '168',
    'log.retention.minutes'                         => '',
    'log.retention.ms'                              => '',
    'log.roll.hours'                                => '168',
    'log.roll.jitter.hours'                         => '0',
    'log.roll.jitter.ms'                            => '',
    'log.roll.ms'                                   => '',
    'log.segment.bytes'                             => '1073741824',
    'log.segment.delete.delay.ms'                   => '60000',
    'message.max.bytes'                             => '1000012',
    'min.insync.replicas'                           => '1',
    'num.io.threads'                                => '8',
    'num.network.threads'                           => '3',
    'num.recovery.threads.per.data.dir'             => '1',
    'num.replica.fetchers'                          => '1',
    'offset.metadata.max.bytes'                     => '4096',
    'offsets.commit.required.acks'                  => '-1',
    'offsets.commit.timeout.ms'                     => '5000',
    'offsets.load.buffer.size'                      => '5242880',
    'offsets.retention.check.interval.ms'           => '600000',
    'offsets.retention.minutes'                     => '1440',
    'offsets.topic.compression.codec'               => '0',
    'offsets.topic.num.partitions'                  => '50',
    'offsets.topic.replication.factor'              => '3',
    'offsets.topic.segment.bytes'                   => '104857600',
    'port'                                          => '9092',
    'queued.max.requests'                           => '500',
    'quota.consumer.default'                        => '9223372036854775807',
    'quota.producer.default'                        => '9223372036854775807',
    'replica.fetch.max.bytes'                       => '1048576',
    'replica.fetch.min.bytes'                       => '1',
    'replica.fetch.wait.max.ms'                     => '500',
    'replica.high.watermark.checkpoint.interval.ms' => '5000',
    'replica.lag.time.max.ms'                       => '10000',
    'replica.socket.receive.buffer.bytes'           => '65536',
    'replica.socket.timeout.ms'                     => '30000',
    'request.timeout.ms'                            => '30000',
    'socket.receive.buffer.bytes'                   => '102400',
    'socket.request.max.bytes'                      => '104857600',
    'socket.send.buffer.bytes'                      => '102400',
    'unclean.leader.election.enable'                => true,
    'zookeeper.connection.timeout.ms'               => '',
    'zookeeper.session.timeout.ms'                  => '6000',
    'zookeeper.set.acl'                             => false,
    'broker.id.generation.enable'                   => true,
    'connections.max.idle.ms'                       => '600000',
    'controlled.shutdown.enable'                    => true,
    'controlled.shutdown.max.retries'               => '3',
    'controlled.shutdown.retry.backoff.ms'          => '5000',
    'controller.socket.timeout.ms'                  => '30000',
    'default.replication.factor'                    => '1',
    'fetch.purgatory.purge.interval.requests'       => '1000',
    'group.max.session.timeout.ms'                  => '30000',
    'group.min.session.timeout.ms'                  => '6000',
    'inter.broker.protocol.version'                 => '0.8.2.2',
    'log.cleaner.backoff.ms'                        => '15000',
    'log.cleaner.dedupe.buffer.size'                => '134217728',
    'log.cleaner.delete.retention.ms'               => '86400000',
    'log.cleaner.enable'                            => true,
    'log.cleaner.io.buffer.load.factor'             => '0.9',
    'log.cleaner.io.buffer.size'                    => '524288',
    'log.cleaner.io.max.bytes.per.second'           => '1.7976931348623157E308',
    'log.cleaner.min.cleanable.ratio'               => '0.5',
    'log.cleaner.threads'                           => '1',
    'log.cleanup.policy'                            => 'delete',
    'log.index.interval.bytes'                      => '4096',
    'log.index.size.max.bytes'                      => '10485760',
    'log.preallocate'                               => false,
    'log.retention.check.interval.ms'               => '300000',
    'max.connections.per.ip'                        => '2147483647',
    'max.connections.per.ip.overrides'              => '',
    'num.partitions'                                => '1',
    'principal.builder.class'                       => 'org.apache.kafka.common.security.auth.DefaultPrincipalBuilder',
    'producer.purgatory.purge.interval.requests'    => '1000',
    'replica.fetch.backoff.ms'                      => '1000',
    'reserved.broker.max.id'                        => '1000',
    'sasl.kerberos.kinit.cmd'                       => '/usr/bin/kinit',
    'sasl.kerberos.min.time.before.relogin'         => '60000',
    'sasl.kerberos.principal.to.local.rules'        => ['DEFAULT'],
    'sasl.kerberos.service.name'                    => '',
    'sasl.kerberos.ticket.renew.jitter'             => '0.05',
    'sasl.kerberos.ticket.renew.window.factor'      => '0.8',
    'security.inter.broker.protocol'                => 'PLAINTEXT',
    'ssl.cipher.suites'                             => '',
    'ssl.client.auth'                               => 'none',
    'ssl.enabled.protocols'                         => ['TLSv1.2', 'TLSv1.1', 'TLSv1'],
    'ssl.key.password'                              => '',
    'ssl.keymanager.algorithm'                      => 'SunX509',
    'ssl.keystore.location'                         => '',
    'ssl.keystore.password'                         => '',
    'ssl.keystore.type'                             => 'JKS',
    'ssl.protocol'                                  => 'TLS',
    'ssl.provider'                                  => '',
    'ssl.trustmanager.algorithm'                    => 'PKIX',
    'ssl.truststore.location'                       => '',
    'ssl.truststore.password'                       => '',
    'ssl.truststore.type'                           => 'JKS',
    'authorizer.class.name'                         => '',
    'metric.reporters'                              => '',
    'metrics.num.samples'                           => '2',
    'metrics.sample.window.ms'                      => '30000',
    'quota.window.num'                              => '11',
    'quota.window.size.seconds'                     => '1',
    'ssl.endpoint.identification.algorithm'         => '',
    'zookeeper.sync.time.ms'                        => '2000',
  }

  $num_streams = 2
  $num_producers = 1
  $abort_on_send_failure = true
  $mirror_max_heap = '256M'
  $whitelist = '.*'
  $blacklist = ''
}
