<?php

use phpcms\libs\classes\http;

// 获取关键字接口
defined('IN_PHPCMS') or exit('No permission resources.');

define('API_URL_GET_KEYWORDS', 'http://tool.phpcms.cn/api/get_keywords.php');

$number = (int)$_GET['number'];
$data = $_POST['data'];
echo get_keywords($data, $number);

function get_keywords($data, $number = 3)
{
    $data = trim(strip_tags($data));
    if (empty($data)) {
        return '';
    }
    $http = new http();
    $data = iconv('utf-8', 'gbk', $data);

    $res = $http->curl(
        API_URL_GET_KEYWORDS
        , ['siteurl' => SITE_URL, 'charset' => CHARSET, 'data' => $data, 'number' => $number]
        , 'POST'
    );
    if ($res) {
        return iconv('gbk', 'utf-8', $res);
    } else {
        return '';
    }
}
