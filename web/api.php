<?php

define('PHPCMS_PATH', '../');
define('PATH_ROOT', '../');

require_once "../vendor/autoload.php";
require_once "../vendor/zx5435/phpcms/pc_base.php";

use phpcms\libs\classes\param;

$_userid = param::get_cookie('_userid');
if ($_userid) {
    $member_db = pc_base::load_model('member_model');
    $_userid = intval($_userid);
    $memberinfo = $member_db->get_one(['userid' => $_userid], 'islock');
    if ($memberinfo['islock']) {
        exit('Bad Request!');
    }
}
$op = isset($_GET['op']) && trim($_GET['op']) ? trim($_GET['op']) : exit('Operation can not be empty');
if (isset($_GET['callback']) && !preg_match('/^[a-zA-Z_][a-zA-Z0-9_]+$/', $_GET['callback'])) {
    unset($_GET['callback']);
}
if (!preg_match('/([^a-z_]+)/i', $op) && file_exists(PATH_API . $op . '.php')) {
    include PATH_API . $op . '.php';
} else {
    exit('API handler does not exist');
}

