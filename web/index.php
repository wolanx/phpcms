<?php

define('PHPCMS_PATH', realpath('..') . '/');
define('PATH_ROOT', realpath('..') . '/');
define('PATH_INDEX', realpath('.') . '/');
define('PC_DEBUG', true);

require_once "../vendor/autoload.php";
require_once "../vendor/zx5435/phpcms/pc_base.php";

error_reporting(E_ALL);

pc_base::creat_app();
