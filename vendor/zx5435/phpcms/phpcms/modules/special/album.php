<?php

namespace phpcms\modules\special;

use pc_base;
use phpcms\model\special_model;
use phpcms\modules\admin\classes\admin;
use phpcms\modules\video\classes\ku6api;

pc_base::load_app_func('global', 'video');

/**
 * 主要负责通过vms将酷6的专辑列表呈现给用户。用户可以选择专辑导入到cms专题，并将专辑里面的内容一并导入过来
 */
class album extends admin
{

    private $db;

    /**
     * Function __construct
     * 初始化数据模型
     */
    public function __construct()
    {
        parent::__construct();
        $this->special_api = pc_base::load_app_class('special_api', 'special');
        $this->db = new special_model();
        pc_base::load_app_func('global', 'video');
        //读取视频库的配置信息
        $this->setting = getcache('video', 'video');
        if (!module_exists('video')) {
            showmessage(L('please_setting_video_info'), 'index.php?m=admin&c=module&a=init');
        }
        if (!$this->setting) {
            showmessage(L('please_not_setting_info'), 'index.php?m=video&c=video&a=setting');
        }
        $this->ku6api = new ku6api($this->setting['sn'], $this->setting['skey']);
    }

    /**
     * 专辑列表
     */
    public function import()
    {
        $id = $_POST['id'] ? $_POST['id'] : ($_GET['id'] ? intval($_GET['id']) : 0);
        if ($id) {
            $postdata = [];
            if (is_array($id)) {
                foreach ($id as $albumid) {
                    $info = $this->ku6api->get_album_info($albumid);
                    $specialid = $this->special_api->importfalbum($info);
                    if ($specialid) {
                        $postdata[] = ['specialid' => $specialid, 'id' => $albumid];
                    }
                }
            } else {
                $info = $this->ku6api->get_album_info($id);
                $specialid = $this->special_api->importfalbum($info);
                if ($specialid) {
                    $postdata[] = ['specialid' => $specialid, 'id' => $id];
                }
            }
            $result = $this->ku6api->add_album_subscribe($postdata);
            if ($result) {
                showmessage(L('album_add_success'), 'index.php?m=special&c=special');
            } else {
                showmessage(L('operation_failure'));
            }
        } else {
            $page = max(intval($_GET['page']), 1);
            $pagesize = 6;
            //列出已载入的专辑
            $res = $this->db->select("`aid`!=0", '`aid`');
            $imported = [];
            if (is_array($res) && !empty($res)) {
                foreach ($res as $r) {
                    $imported[] = $r['aid'];
                }
            }
            $ku6channels = $this->ku6api->get_ku6_channels();
            $albums = $this->ku6api->get_albums($page, $pagesize);
            $number = $albums['count'];
            $infos = $albums['data'];
            $pages = pages($number, $page, $pagesize);
            include $this->admin_tpl('album_list');
        }
    }

    /**
     * 某专辑下的视频列表
     */
    public function content_list()
    {
        $id = intval($_GET['id']);
        if (!$id) {
            showmessage(L('illegal_parameters'));
        }
        $page = max(intval($_GET['page']), 1);
        $pagesize = 15;
        $video_list = $this->ku6api->get_album_videoes($id, $page, $pagesize);
        $number = $video_list['count'];
        $infos = $video_list['list'];
        $pages = pages($number, $page, $pagesize);

        include $this->admin_tpl('album_video_list');
    }
}
