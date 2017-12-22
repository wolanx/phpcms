<?php

namespace phpcms\modules\comment;

use pc_base;
use phpcms\libs\classes\param;
use phpcms\model\comment_data_model;
use phpcms\model\comment_model;
use phpcms\model\comment_setting_model;
use phpcms\modules\admin\classes\admin;
use phpcms\modules\pay\classes\spend;

class comment_admin extends admin
{
    private $comment_setting_db, $comment_data_db, $comment_db, $siteid;

    function __construct()
    {
        parent::__construct();
        $this->comment_setting_db = new comment_setting_model();
        $this->comment_data_db = new comment_data_model();
        $this->comment_db = new comment_model();
        $this->siteid = $this->get_siteid();
    }

    public function init()
    {
        $data = $this->comment_setting_db->get_one(['siteid' => $this->siteid]);
        if (isset($_POST['dosubmit'])) {
            $guest = isset($_POST['guest']) && intval($_POST['guest']) ? intval($_POST['guest']) : 0;
            $check = isset($_POST['check']) && intval($_POST['check']) ? intval($_POST['check']) : 0;
            $code = isset($_POST['code']) && intval($_POST['code']) ? intval($_POST['code']) : 0;
            $add_point = isset($_POST['add_point']) && abs(intval($_POST['add_point'])) ? intval($_POST['add_point']) : 0;
            $del_point = isset($_POST['del_point']) && abs(intval($_POST['del_point'])) ? intval($_POST['del_point']) : 0;
            $sql = ['guest' => $guest, 'check' => $check, 'code' => $code, 'add_point' => $add_point, 'del_point' => $del_point];
            if ($data) {
                $this->comment_setting_db->update($sql, ['siteid' => $this->siteid]);
            } else {
                $sql['siteid'] = $this->siteid;
                $this->comment_setting_db->insert($sql);
            }
            showmessage(L('operation_success'), HTTP_REFERER);
        } else {
            $show_header = true;
            include $this->admin_tpl('comment_setting');
        }
    }

    public function lists()
    {
        $show_header = true;
        $commentid = isset($_GET['commentid']) && trim($_GET['commentid']) ? trim($_GET['commentid']) : showmessage(L('illegal_parameters'), HTTP_REFERER);
        $hot = isset($_GET['hot']) && intval($_GET['hot']) ? intval($_GET['hot']) : 0;
        $comment = $this->comment_db->get_one(['commentid' => $commentid, 'siteid' => $this->siteid]);
        if (empty($comment)) {
            $forward = isset($_GET['show_center_id']) ? 'blank' : HTTP_REFERER;
            showmessage(L('no_comment'), $forward);
        }
        pc_base::load_app_func('global');
        $page = isset($_GET['page']) && intval($_GET['page']) ? intval($_GET['page']) : 1;
        $pagesize = 20;
        $offset = ($page - 1) * $pagesize;
        $this->comment_data_db->table_name($comment['tableid']);
        $desc = 'id desc';
        if (!empty($hot)) {
            $desc = 'support desc, id desc';
        }
        $list = $this->comment_data_db->select(['commentid' => $commentid, 'siteid' => $this->siteid, 'status' => 1], '*', $offset . ',' . $pagesize, $desc);
        $pages = pages($comment['total'], $page, $pagesize);
        include $this->admin_tpl('comment_data_list');
    }

    public function listinfo()
    {

        $r = $max_table = '';
        $max_table = isset($_GET['max_table']) ? intval($_GET['max_table']) : 0;
        if (!$max_table) {
            $r = $this->comment_db->get_one([], 'MAX(tableid) AS tableid');
            if (!$r['tableid']) {
                showmessage(L('no_comment'));
            }
            $max_table = $r['tableid'];
        }
        $page = max(intval($_GET['page']), 1);
        $tableid = isset($_GET['tableid']) ? intval($_GET['tableid']) : $max_table;
        if ($tableid > $max_table) {
            $tableid = $max_table;
        }
        if (isset($_GET['search'])) {
            $where = $sql = $t = $comment_id = $order = '';
            $keywords = safe_replace($_GET['keyword']);
            $searchtype = intval($_GET['searchtype']);
            switch ($searchtype) {
                case '0':
                    $sql = "SELECT `commentid` FROM `phpcms_comment` WHERE `siteid` = '$this->siteid' AND `title` LIKE '%$keywords%' AND `tableid` = '$tableid' ";

                    $this->comment_db->query($sql);
                    $data = $this->comment_db->fetch_array();
                    if (!empty($data)) {
                        foreach ($data as $d) {
                            $comment_id .= $t . '\'' . $d['commentid'] . '\'';
                            $t = ',';
                        }
                        $where = "`commentid` IN ($comment_id)";
                    }
                    break;

                case '1':
                    $keywords = intval($keywords);
                    $sql = "SELECT `commentid` FROM `phpcms_comment` WHERE `commentid` LIKE 'content_%-$keywords-%' ";
                    $this->comment_db->query($sql);
                    $data = $this->comment_db->fetch_array();
                    if (!empty($data)) {
                        foreach ($data as $d) {
                            $comment_id .= $t . '\'' . $d['commentid'] . '\'';
                            $t = ',';
                        }
                        $where = "`commentid` IN ($comment_id)";
                    }
                    break;

                case '2':
                    $where = "`username` = '$keywords'";
                    break;
            }
        }
        $data = [];


        if (isset($_GET['search'])) {
            if (!empty($where)) {
                $where .= ' AND siteid=' . $this->siteid;
            } else {
                $data = '';
                include $this->admin_tpl('comment_listinfo');
                exit;
            }
        } else {
            $where = 'siteid=' . $this->siteid;
        }

        $order = '`id` DESC';
        $this->comment_data_db->table_name($tableid);
        $data = $this->comment_data_db->listinfo($where, $order, $page, 10);
        $pages = $this->comment_data_db->pages;
        include $this->admin_tpl('comment_listinfo');
    }

    public function del()
    {
        if (isset($_GET['dosubmit']) && $_GET['dosubmit']) {
            $ids = $_GET['ids'];
            $tableid = isset($_GET['tableid']) ? intval($_GET['tableid']) : 0;
            $r = $this->comment_db->get_one([], 'MAX(tableid) AS tableid');
            $max_table = $r['tableid'];
            if (!$tableid || $max_table < $tableid) {
                showmessage(L('illegal_operation'));
            }
            $this->comment_data_db->table_name($tableid);
            $site = $this->comment_setting_db->site($this->siteid);
            if (is_array($ids)) {
                foreach ($ids as $id) {
                    $comment_info = $this->comment_data_db->get_one(['id' => $id], 'commentid, userid, username');
                    //判断总数是否为0
                    $comment_allinfo = $this->comment_db->get_one(['commentid' => $comment_info['commentid']], '*');
                    if ($comment_allinfo['total'] <= 0) {
                        showmessage('评论统计不正常，请返回检查！', HTTP_REFERER);
                    }
                    $this->comment_db->update(['total' => '-=1'], ['commentid' => $comment_info['commentid']]);
                    $this->comment_data_db->delete(['id' => $id]);

                    //当评论ID不为空，站点配置了删除的点数，支付模块存在的时候，删除用户的点数。
                    if (!empty($comment_info['userid']) && !empty($site['del_point']) && module_exists('pay')) {
                        $op_userid = param::get_cookie('userid');
                        $op_username = param::get_cookie('admin_username');
                        spend::point($site['del_point'], L('comment_point_del', '', 'comment'), $comment_info['userid'], $comment_info['username'], $op_userid, $op_username);
                    }
                }
                $ids = implode(',', $ids);
            } elseif (is_numeric($ids)) {
                $id = intval($ids);
                $comment_info = $this->comment_data_db->get_one(['id' => $id], 'commentid, userid, username');
                //判断总数是否为0
                $comment_allinfo = $this->comment_db->get_one(['commentid' => $comment_info['commentid']], '*');
                if ($comment_allinfo['total'] <= 0) {
                    showmessage('评论统计不正常，请返回检查！', HTTP_REFERER);
                }
                $this->comment_db->update(['total' => '-=1'], ['commentid' => $comment_info['commentid']]);
                $this->comment_data_db->delete(['id' => $id]);

                //当评论ID不为空，站点配置了删除的点数，支付模块存在的时候，删除用户的点数。
                if (!empty($comment_info['userid']) && !empty($site['del_point']) && module_exists('pay')) {
                    $op_userid = param::get_cookie('userid');
                    $op_username = param::get_cookie('admin_username');
                    spend::point($site['del_point'], L('comment_point_del', '', 'comment'), $comment_info['userid'], $comment_info['username'], $op_userid, $op_username);
                }
            } else {
                showmessage(L('illegal_operation'));
            }
            showmessage(L('operation_success'), HTTP_REFERER);
        }
    }
}
