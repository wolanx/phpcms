<?php

namespace phpcms\modules\link\classes;

use pc_base;

class link_tag
{
    private $link_db, $type_db;

    public function __construct()
    {
        $this->link_db = pc_base::load_model('link_model');
        $this->type_db = pc_base::load_model('type_model');
    }

    /**
     * 取出该分类的详细 信息
     */
    public function get_type($data)
    {
        $typeid = intval($data['typeid']);
        if ($typeid == '0') {
            $arr = [];
            $arr['name'] = '默认分类';

            return $arr;
        } else {
            $r = $this->type_db->get_one(['typeid' => $typeid]);

            return new_html_special_chars($r);
        }


    }

    /**
     * 友情链接
     */
    public function lists($data)
    {
        $typeid = intval($data['typeid']);//分类ID
        $linktype = $data['linktype'] ? $data['linktype'] : 0;
        $siteid = $data['siteid'];
        if (empty($siteid)) {
            $siteid = get_siteid();
        }
        if ($typeid != '' || $typeid == '0') {
            $sql = ['typeid' => $typeid, 'linktype' => $linktype, 'siteid' => $siteid, 'passed' => '1'];
        } else {
            $sql = ['linktype' => $linktype, 'siteid' => $siteid, 'passed' => '1'];
        }
        $r = $this->link_db->select($sql, '*', $data['limit'], 'listorder ' . $data['order']);

        return new_html_special_chars($r);
    }

    /**
     * 返回该分类下的友情链接 ...
     */
    public function type_list($data)
    {
        $siteid = $data['siteid'];
        $linktype = $data['linktype'] ? $data['linktype'] : 0;
        $typeid = $data['typeid'];
        if (empty($siteid)) {
            $siteid = get_siteid();
        }
        if ($typeid) {
            if (is_int($typeid)) {
                return false;
            }
            $sql = ['typeid' => $typeid, 'linktype' => $linktype, 'siteid' => $siteid, 'passed' => '1'];
        } else {
            $sql = ['linktype' => $linktype, 'siteid' => $siteid, 'passed' => '1'];
        }
        $r = $this->link_db->select($sql, '*', $data['limit'], $data['order']);

        return new_html_special_chars($r);
    }

    /**
     * 首页  友情链接分类 循环 .
     */
    public function type_lists($data)
    {
        if (!in_array($data['listorder'], ['desc', 'asc'])) {
            $data ['listorder'] = 'desc';
        }
        $sql = ['module' => ROUTE_M, 'siteid' => $data['siteid']];
        $r = $this->type_db->select($sql, '*', $data['limit'], 'listorder ' . $data['listorder']);

        return new_html_special_chars($r);
    }

    /**
     * 传入的站点ID,读取站点下的友情链接分类 ...
     */
    public function get_typelist($siteid = '1', $value = '', $id = '')
    {
        $data = $arr = [];
        $data = $this->type_db->select(['module' => 'link', 'siteid' => $siteid]);
        pc_base::load_sys_class('form', '', 0);
        foreach ($data as $r) {
            $arr[$r['typeid']] = $r['name'];
        }
        $html = $id ? ' id="typeid" onchange="$(\'#' . $id . '\').val(this.value);"' : 'name="typeid", id="typeid"';

        return form::select($arr, $value, $html, L('please_select'));
    }

    public function count($data)
    {
        if ($data['action'] == 'lists') {
            $typeid = intval($data['typeid']);//分类ID
            $linktype = $data['linktype'] ? $data['linktype'] : 0;
            $siteid = $data['siteid'];
            if (empty($siteid)) {
                $siteid = get_siteid();
            }
            if ($typeid != '' || $typeid == '0') {
                $sql = ['typeid' => $typeid, 'linktype' => $linktype, 'siteid' => $siteid, 'passed' => '1'];
            } else {
                $sql = ['linktype' => $linktype, 'siteid' => $siteid, 'passed' => '1'];
            }

            return $this->link_db->count($sql);
        }
    }

    /**
     * pc 标签调用
     */
    public function pc_tag()
    {
        $sites = pc_base::load_app_class('sites', 'admin');
        $sitelist = $sites->pc_tag_list();

        return [
            'action'    => ['type_list' => L('link_list', '', 'link')],
            'type_list' => [
                'siteid'   => [
                    'name'     => L('site_id', '', 'comment'),
                    'htmltype' => 'input_select',
                    'data'     => $sitelist,
                    'ajax'     => ['name' => L('for_type', '', 'special'), 'action' => 'get_typelist', 'id' => 'typeid'],
                ],
                'linktype' => ['name' => L('link_type', '', 'link'), 'htmltype' => 'select', 'data' => ['0' => L('word_link', '', 'link'), '1' => L('logo_link', '', 'link')]],
                'order'    => [
                    'name'     => L('sort', '', 'comment'),
                    'htmltype' => 'select',
                    'data'     => ['listorder DESC' => L('listorder_desc', '', 'content'), 'listorder ASC' => L('listorder_asc', '', 'content')],
                ],
            ],

        ];
    }

}