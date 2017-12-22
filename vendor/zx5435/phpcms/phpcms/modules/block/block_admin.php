<?php

namespace phpcms\modules\block;

use pc_base;
use phpcms\libs\classes\param;
use phpcms\model\attachment_model;
use phpcms\model\block_history_model;
use phpcms\model\block_model;
use phpcms\model\block_priv_model;
use phpcms\model\content_model;
use phpcms\modules\admin\classes\admin;

class block_admin extends admin
{
    private $db, $siteid, $priv_db, $history_db, $roleid;

    public function __construct()
    {
        $this->db = new block_model();
        $this->priv_db = new block_priv_model();
        $this->history_db = new block_history_model();
        $this->roleid = $_SESSION['roleid'];
        $this->siteid = $this->get_siteid();
        parent::__construct();
    }

    public function init()
    {
        $page = isset($_GET['page']) && intval($_GET['page']) ? intval($_GET['page']) : 1;
        if ($_SESSION['roleid'] != 1) {
            $offset = ($page - 1) * 20;
            $r = $this->priv_db->select(['roleid' => $this->roleid, 'siteid' => $this->siteid], 'blockid', $offset . ',20');
            $blockid_list = [];
            foreach ($r as $key => $v) {
                $blockid_list[$key] = $v['blockid'];
            }
            $sql = implode('\',\'', $blockid_list);
            $list = $this->db->listinfo("id in ('$sql')", '', $page, 20);
        } else {
            $list = $this->db->listinfo(['siteid' => $this->siteid], '', $page, 20);
        }
        $pages = $this->db->pages;
        include $this->admin_tpl('block_list');
    }

    public function add()
    {
        $pos = isset($_GET['pos']) && trim($_GET['pos']) ? trim($_GET['pos']) : showmessage(L('illegal_operation'));
        if (isset($_POST['dosubmit'])) {
            $name = isset($_POST['name']) && trim($_POST['name']) ? trim($_POST['name']) : showmessage(L('illegal_operation'), HTTP_REFERER);
            $type = isset($_POST['type']) && intval($_POST['type']) ? intval($_POST['type']) : 1;
            //判断名称是否已经存在
            if ($this->db->get_one(['name' => $name])) {
                showmessage(L('name') . L('exists'), HTTP_REFERER);
            }
            if ($id = $this->db->insert(['name' => $name, 'pos' => $pos, 'type' => $type, 'siteid' => $this->siteid], true)) {
                //设置权限
                $priv = isset($_POST['priv']) ? $_POST['priv'] : '';
                if (!empty($priv)) {
                    if (is_array($priv)) {
                        foreach ($priv as $v) {
                            if (empty($v)) {
                                continue;
                            }
                            $this->priv_db->insert(['roleid' => $v, 'blockid' => $id, 'siteid' => $this->siteid]);
                        }
                    }
                }
                showmessage(L('operation_success'), '?m=block&c=block_admin&a=block_update&id=' . $id);
            } else {
                showmessage(L('operation_failure'), HTTP_REFERER);
            }
        } else {
            $show_header = $show_validator = true;
            $administrator = getcache('role', 'commons');
            unset($administrator[1]);
            include $this->admin_tpl('block_add_edit');
        }
    }

    public function edit()
    {
        $id = isset($_GET['id']) && intval($_GET['id']) ? intval($_GET['id']) : showmessage(L('illegal_operation'));
        if (!$data = $this->db->get_one(['id' => $id])) {
            showmessage(L('nofound'));
        }
        if (isset($_POST['dosubmit'])) {
            $name = isset($_POST['name']) && trim($_POST['name']) ? trim($_POST['name']) : showmessage(L('illegal_operation'), HTTP_REFERER);
            if ($data['name'] != $name) {
                if ($this->db->get_one(['name' => $name])) {
                    showmessage(L('name') . L('exists'), HTTP_REFERER);
                }
            }
            if ($this->db->update(['name' => $name, 'siteid' => $this->siteid], ['id' => $id])) {
                //设置权限
                $priv = isset($_POST['priv']) ? $_POST['priv'] : '';
                $this->priv_db->delete(['blockid' => $id, 'siteid' => $this->siteid]);
                if (!empty($priv)) {
                    if (is_array($priv)) {
                        foreach ($priv as $v) {
                            if (empty($v)) {
                                continue;
                            }
                            $this->priv_db->insert(['roleid' => $v, 'blockid' => $id, 'siteid' => $this->siteid]);
                        }
                    }
                }
                showmessage(L('operation_success'), '', '', 'edit');
            } else {
                showmessage(L('operation_failure'), HTTP_REFERER);
            }
        }
        $show_header = $show_validator = true;
        $administrator = getcache('role', 'commons');
        unset($administrator[1]);
        $r = $this->priv_db->select(['blockid' => $id, 'siteid' => $this->siteid], 'roleid');
        $priv_list = [];
        foreach ($r as $v) {
            if ($v['roleid']) {
                $priv_list[] = $v['roleid'];
            }
        }
        include $this->admin_tpl('block_add_edit');
    }

    public function del()
    {
        $id = isset($_GET['id']) && intval($_GET['id']) ? intval($_GET['id']) : showmessage(L('illegal_operation'));
        if (!$data = $this->db->get_one(['id' => $id])) {
            showmessage(L('nofound'));
        }
        if ($this->db->delete(['id' => $id]) && $this->history_db->delete(['blockid' => $id]) && $this->priv_db->delete(['blockid' => $id])) {
            if (pc_base::load_config('system', 'attachment_stat')) {
                $this->attachment_db = new attachment_model();
                $keyid = 'block-' . $id;
                $this->attachment_db->api_delete($keyid);
            }
            showmessage(L('operation_success'), HTTP_REFERER);
        } else {
            showmessage(L('operation_failure'), HTTP_REFERER);
        }
    }

    public function block_update()
    {
        $id = isset($_GET['id']) && intval($_GET['id']) ? intval($_GET['id']) : showmessage(L('illegal_operation'), HTTP_REFERER);
        //进行权限判断
        if ($this->roleid != 1) {
            if (!$this->priv_db->get_one(['blockid' => $id, 'roleid' => $this->roleid, 'siteid' => $this->siteid])) {
                showmessage(L('not_have_permissions'));
            }
        }
        if (!$data = $this->db->get_one(['id' => $id])) {
            showmessage(L('nofound'));
        }
        if (isset($_POST['dosubmit'])) {
            $sql = [];
            if ($data['type'] == 2) {
                $title = isset($_POST['title']) ? $_POST['title'] : '';
                $url = isset($_POST['url']) ? $_POST['url'] : '';
                $thumb = isset($_POST['thumb']) ? $_POST['thumb'] : '';
                $desc = isset($_POST['desc']) ? $_POST['desc'] : '';
                $template = isset($_POST['template']) && trim($_POST['template']) ? trim($_POST['template']) : '';
                $datas = [];
                foreach ($title as $key => $v) {
                    if (empty($v) || !isset($url[$key]) || empty($url[$key])) {
                        continue;
                    }
                    $datas[$key] = ['title' => $v, 'url' => $url[$key], 'thumb' => $thumb[$key], 'desc' => str_replace([chr(13), chr(43)], ['<br />', '&nbsp;'], $desc[$key])];
                }
                if ($template) {
                    $block = pc_base::load_app_class('block_tag');
                    $block->template_url($id, $template);
                }
                if (is_array($thumb) && !empty($thumb)) {
                    if (pc_base::load_config('system', 'attachment_stat')) {
                        $this->attachment_db = pc_base::load_model('attachment_model');
                        $this->attachment_db->api_update($thumb, 'block-' . $id, 1);
                    }
                }
                $sql = ['data' => array2string($datas), 'template' => $template];
            } elseif ($data['type'] == 1) {
                $datas = isset($_POST['data']) && trim($_POST['data']) ? trim($_POST['data']) : '';
                $sql = ['data' => $datas];
            }
            if ($this->db->update($sql, ['id' => $id])) {
                //添加历史记录
                $this->history_db->insert([
                    'blockid'  => $data['id'],
                    'data'     => array2string($data),
                    'creat_at' => SYS_TIME,
                    'userid'   => param::get_cookie('userid'),
                    'username' => param::get_cookie('admin_username'),
                ]);
                showmessage(L('operation_success') . '<script style="text/javascript">if(!parent.right){parent.location.reload();}art.dialog({id:"edit"}).close();</script>', '',
                    '', 'edit');
            } else {
                showmessage(L('operation_failure'), HTTP_REFERER);
            }
        } else {
            if (!empty($data['data'])) {
                if ($data['type'] == 2) {
                    $data['data'] = string2array($data['data']);
                }
                $total = count($data['data']);
            }
            $page = isset($_GET['page']) && intval($_GET['page']) ? intval($_GET['page']) : 1;
            $history_list = $this->history_db->listinfo(['blockid' => $id], '', $page, 10);
            $pages = $this->history_db->pages;
            $show_header = $show_validator = $show_dialog = true;
            include $this->admin_tpl('block_update');
        }
    }

    public function public_visualization()
    {
        echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">';
        $catid = isset($_GET['catid']) && intval($_GET['catid']) ? intval($_GET['catid']) : 0;
        $type = isset($_GET['type']) && trim($_GET['type']) ? trim($_GET['type']) : 'list';
        $siteid = $GLOBALS['siteid'] = $this->get_siteid();
        if (!empty($catid)) {
            $CATEGORY = getcache('category_content_' . $siteid, 'commons');
            if (!isset($CATEGORY[$catid])) {
                showmessage(L('notfound'));
            }
            $cat = $CATEGORY[$catid];
            $cat['setting'] = string2array($cat['setting']);
        }
        if ($cat['type'] == 2) {
            showmessage(L('link_visualization_not_exists'));
        }
        $file = '';
        $style = $cat['setting']['template_list'];
        switch ($type) {
            case 'category':
                if ($cat['type'] == 1) {
                    $file = $cat['setting']['page_template'];
                } else {
                    $file = $cat['setting']['category_template'];
                }
                break;

            case 'list':
                if ($cat['type'] == 1) {
                    $file = $cat['setting']['page_template'];
                } else {
                    $file = $cat['setting']['list_template'];
                }
                break;

            case 'show':
                $file = $cat['setting']['show_template'];
                break;

            case 'index':
                $sites = pc_base::load_app_class('sites', 'admin');
                $sites_info = $sites->get_by_id($this->siteid);
                $file = 'index';
                $style = $sites_info['default_style'];
                break;

            case 'page':
                $file = $cat['setting']['page_template'];
                break;
        }

        pc_base::load_app_func('global', 'template');
        ob_start();
        include template('content', $file, $style);
        $html = ob_get_contents();
        ob_clean();
        echo visualization($html, $style, 'content', $file . '.html');
    }

    public function public_view()
    {
        $id = isset($_GET['id']) && intval($_GET['id']) ? intval($_GET['id']) : exit('0');
        if (!$data = $this->db->get_one(['id' => $id])) {
            showmessage(L('nofound'));
        }
        if ($data['type'] == 1) {
            exit('<script type="text/javascript">parent.showblock(' . $id . ', \'' . str_replace("\r\n", '', $_POST['data']) . '\')</script>');
        } elseif ($data['type'] == 2) {
            extract($data);
            unset($data);
            $title = isset($_POST['title']) ? $_POST['title'] : '';
            $url = isset($_POST['url']) ? $_POST['url'] : '';
            $thumb = isset($_POST['thumb']) ? $_POST['thumb'] : '';
            $desc = isset($_POST['desc']) ? $_POST['desc'] : '';
            $template = isset($_POST['template']) && trim($_POST['template']) ? trim($_POST['template']) : '';
            $data = [];
            foreach ($title as $key => $v) {
                if (empty($v) || !isset($url[$key]) || empty($url[$key])) {
                    continue;
                }
                $data[$key] = ['title' => $v, 'url' => $url[$key], 'thumb' => $thumb[$key], 'desc' => str_replace([chr(13), chr(43)], ['<br />', '&nbsp;'], $desc[$key])];
            }
            $tpl = pc_base::load_sys_class('template_cache');
            $str = $tpl->template_parse(new_stripslashes($template));
            $filepath = CACHE_PATH . 'caches_template' . DS . 'block' . DS . 'tmp_' . $id . '.php';
            $dir = dirname($filepath);
            if (!is_dir($dir)) {
                @mkdir($dir, 0777, true);
            }
            if (@file_put_contents($filepath, $str)) {
                ob_start();
                include $filepath;
                $html = ob_get_contents();
                ob_clean();
                @unlink($filepath);
            }

            exit('<script type="text/javascript">parent.showblock(' . $id . ', \'' . str_replace("\r\n", '', $html) . '\')</script>');
        }
    }

    public function public_name()
    {
        $name = isset($_GET['name']) && trim($_GET['name']) ? (pc_base::load_config('system', 'charset') == 'gbk' ? iconv('utf-8', 'gbk',
            trim($_GET['name'])) : trim($_GET['name'])) : exit('0');
        $id = isset($_GET['id']) && intval($_GET['id']) ? intval($_GET['id']) : '';
        $name = safe_replace($name);
        $data = [];
        if ($id) {
            $data = $this->db->get_one(['id' => $id], 'name');
            if (!empty($data) && $data['name'] == $name) {
                exit('1');
            }
        }
        if ($this->db->get_one(['name' => $name], 'id')) {
            exit('0');
        } else {
            exit('1');
        }
    }

    public function history_restore()
    {
        $id = isset($_GET['id']) && intval($_GET['id']) ? intval($_GET['id']) : showmessage(L('illegal_operation'), HTTP_REFERER);
        if (!$data = $this->history_db->get_one(['id' => $id])) {
            showmessage(L('nofound'), HTTP_REFERER);
        }
        $data['data'] = string2array($data['data']);
        $this->db->update(['data' => new_addslashes($data['data']['data']), 'template' => new_addslashes($data['data']['template'])], ['id' => $data['blockid']]);
        if ($data['data']['type'] == 2) {
            $block = pc_base::load_app_class('block_tag');
            $block->template_url($data['blockid'], $data['data']['template']);
        }
        showmessage(L('operation_success'), HTTP_REFERER);
    }

    public function history_del()
    {
        $id = isset($_GET['id']) && intval($_GET['id']) ? intval($_GET['id']) : showmessage(L('illegal_operation'), HTTP_REFERER);
        if (!$data = $this->history_db->get_one(['id' => $id])) {
            showmessage(L('nofound'), HTTP_REFERER);
        }
        $this->history_db->delete(['id' => $id]);
        showmessage(L('operation_success'), HTTP_REFERER);
    }

    public function public_search_content()
    {
        $catid = isset($_GET['catid']) && intval($_GET['catid']) ? intval($_GET['catid']) : '';
        $posids = isset($_GET['posids']) && intval($_GET['posids']) ? intval($_GET['posids']) : 0;
        $page = isset($_GET['page']) && intval($_GET['page']) ? intval($_GET['page']) : 1;
        $searchtype = isset($_GET['searchtype']) && intval($_GET['searchtype']) ? intval($_GET['searchtype']) : 0;
        $end_time = isset($_GET['end_time']) && trim($_GET['end_time']) ? strtotime(trim($_GET['end_time'])) : '';
        $start_time = isset($_GET['start_time']) && trim($_GET['start_time']) ? strtotime(trim($_GET['start_time'])) : '';
        $keyword = isset($_GET['keyword']) && trim($_GET['keyword']) ? trim($_GET['keyword']) : '';
        if (isset($_GET['dosubmit']) && !empty($catid)) {
            if (!empty($start_time) && empty($end_time)) {
                $end_time = SYS_TIME;
            }
            if ($end_time < $start_time) {
                showmessage(L('end_of_time_to_time_to_less_than'));
            }
            if (!empty($end_time) && empty($start_time)) {
                showmessage(L('please_set_the_starting_time'));
            }
            $sql = "`catid` = '$catid' AND `posids` = '$posids'";
            if (!empty($start_time) && !empty($end_time)) {
                $sql .= " AND `inputtime` BETWEEN '$start_time' AND '$end_time' ";
            }
            if (!empty($searchtype) && !empty($keyword)) {
                switch ($searchtype) {
                    case '1'://标题搜索
                        $sql .= " AND `title` LIKE '%$keyword%' ";
                        break;
                    case '2'://简介搜索
                        $sql .= " AND `description` LIKE '%$keyword%' ";
                        break;
                    case '3'://用户名
                        $sql .= " AND `username` = '$keyword' ";
                        break;
                    case '4'://ID搜索
                        $sql .= " AND `id` = '$keyword' ";
                        break;
                }
            }
            $content_db = new content_model();
            $content_db->set_catid($catid);
            $data = $content_db->listinfo($sql, 'id desc', $page);
            $pages = $content_db->pages;
        }
        $show_header = $show_validator = $show_dialog = true;
        include $this->admin_tpl('search_content');
    }
}
