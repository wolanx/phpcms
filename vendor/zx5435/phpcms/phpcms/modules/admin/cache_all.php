<?php

namespace phpcms\modules\admin;

use pc_base;
use phpcms\modules\admin\classes\admin;
use phpcms\modules\admin\classes\cache_api;

class cache_all extends admin
{
    private $cache_api;

    public function init()
    {
        if (isset($_POST['dosubmit']) || isset($_GET['dosubmit'])) {
            $page = $_GET['page'] ? intval($_GET['page']) : 0;
            $modules = [
                ['name' => L('module'), 'function' => 'module'],
                ['name' => L('sites'), 'mod' => 'admin', 'file' => 'sites', 'function' => 'set_cache'],
                ['name' => L('category'), 'function' => 'category'],
                ['name' => L('downservers'), 'function' => 'downservers'],
                ['name' => L('badword_name'), 'function' => 'badword'],
                ['name' => L('ipbanned'), 'function' => 'ipbanned'],
                ['name' => L('keylink'), 'function' => 'keylink'],
                ['name' => L('linkage'), 'function' => 'linkage'],
                ['name' => L('position'), 'function' => 'position'],
                ['name' => L('admin_role'), 'function' => 'admin_role'],
                ['name' => L('urlrule'), 'function' => 'urlrule'],
                ['name' => L('sitemodel'), 'function' => 'sitemodel'],
                ['name' => L('type'), 'function' => 'type', 'param' => 'content'],
                ['name' => L('workflow'), 'function' => 'workflow'],
                ['name' => L('dbsource'), 'function' => 'dbsource'],
                ['name' => L('member_setting'), 'function' => 'member_setting'],
                ['name' => L('member_group'), 'function' => 'member_group'],
                ['name' => L('membermodel'), 'function' => 'membermodel'],
                ['name' => L('member_model_field'), 'function' => 'member_model_field'],
                ['name' => L('search_type'), 'function' => 'type', 'param' => 'search'],
                ['name' => L('search_setting'), 'function' => 'search_setting'],
                ['name' => L('update_vote_setting'), 'function' => 'vote_setting'],
                ['name' => L('update_link_setting'), 'function' => 'link_setting'],
                ['name' => L('special'), 'function' => 'special'],
                ['name' => L('setting'), 'function' => 'setting'],
                ['name' => L('database'), 'function' => 'database'],
                ['name' => L('update_formguide_model'), 'mod' => 'formguide', 'file' => 'formguide', 'function' => 'public_cache'],
                ['name' => L('cache_file'), 'function' => 'cache2database'],
                ['name' => L('cache_copyfrom'), 'function' => 'copyfrom'],
                ['name' => L('clear_files'), 'function' => 'del_file'],
                ['name' => L('video_category_tb'), 'function' => 'video_category_tb'],
            ];
            $this->cache_api = new cache_api();
            $m = $modules[$page];
            if ($m['mod'] && $m['function']) {
                if ($m['file'] == '') {
                    $m['file'] = $m['function'];
                }
                $M = getcache('modules', 'commons');
                if (in_array($m['mod'], array_keys($M))) {
                    $cache = pc_base::load_app_class($m['file'], $m['mod']);
                    $cache->{$m['function']}();
                }
            } else {
                if ($m['target'] == 'iframe') {
                    echo '<script type="text/javascript">window.parent.frames["hidden"].location="index.php?' . $m['link'] . '";</script>';
                } else {
                    $this->cache_api->cache($m['function'], $m['param']);
                }
            }
            $page++;
            if (!empty($modules[$page])) {
                echo '<script type="text/javascript">window.parent.addtext("<li>' . L('update') . $m['name'] . L('cache_file_success') . '..........</li>");</script>';
                showmessage(L('update') . $m['name'] . L('cache_file_success'), '?m=admin&c=cache_all&page=' . $page . '&dosubmit=1&pc_hash=' . $_SESSION['pc_hash'], 0);
            } else {
                echo '<script type="text/javascript">window.parent.addtext("<li>' . L('update') . $m['name'] . L('site_cache_success') . '..........</li>")</script>';
                showmessage(L('update') . $m['name'] . L('site_cache_success'), 'blank');
            }
        } else {
            include $this->admin_tpl('cache_all');
        }
    }
}
