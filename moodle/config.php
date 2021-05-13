<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->mod_hvp_aggregate_assets = 0;

$CFG->dbtype    = 'mariadb';
$CFG->dblibrary = 'native';
$CFG->dbhost    = getenv('MOODLE_DB_URL');
$CFG->dbname    = getenv('MOODLE_DB_NAME');
$CFG->dbuser    = getenv('MOODLE_DB_USER');
$CFG->dbpass    = getenv('MOODLE_DB_PASS');
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => getenv('MOODLE_DB_PORT'),
  'dbsocket' => '',
);



// use with reverse proxy:
// $CFG->sslproxy = true;
// $CFG->wwwroot   = 'https://'.getenv('MOODLE_URL');
// use without reverse proxy or ssl:
if (isset($_SERVER['HTTP_HOST'])) {
    $CFG->wwwroot   = 'http://'.$_SERVER['HTTP_HOST'];
} else {
    $CFG->wwwroot   = 'http://'.getenv('MOODLE_URL');
}
$CFG->dataroot  = '/var/www/moodledata';
$CFG->admin     = 'admin';

$CFG->directorypermissions = 0777;

require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
