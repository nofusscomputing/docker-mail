<?php
    $config['plugins'] = array(
	'fetchmail',
        'contextmenu'
);
    $config['log_driver'] = 'stdout';
    $config['zipdownload_selection'] = true;
    $config['des_key'] = '2A9UVzfF6nsNucrunVIQ+AL/';
    include(__DIR__ . '/config.docker.inc.php');
    $config['imap_conn_options'] = array(
           'ssl'         => array(
           'verify_peer'  => false,
           'allow_self_signed' => true,
           'peer_name'         => 'localhost',
           )
    );

     $config['smtp_conn_options'] = array(
            'ssl'         => array(
            'verify_peer'  => false,
           'allow_self_signed' => true,
           'peer_name'         => 'localhost',
     ),
   );

    $config['layout'] = 'list';

     $config['managesieve_host'] = 'tls://mail';

     $config['managesieve_conn_options'] = array(
     'ssl'         => array(
       'verify_peer'  => true,
       'allow_self_signed' => true,
       'peer_name'         => 'localhost',
     ),
   );
