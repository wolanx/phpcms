<?php

namespace phpcms\modules\pay\classes;

use phpcms\model\pay_account_model;
use phpcms\model\pay_payment_model;

class pay_deposit
{

    public function __construct()
    {
        $this->pay_db = new pay_payment_model();
        $this->account_db = new pay_account_model();
    }

    /**
     * 生成流水记录
     */
    public function set_record($data)
    {
        $require_items = [
            'userid',
            'username',
            'email',
            'contactname',
            'telephone',
            'trade_sn',
            'money',
            'quantity',
            'addtime',
            'paytime',
            'usernote',
            'usernote',
            'pay_type',
            'pay_id',
            'payment',
            'ip',
            'status',
        ];
        if (is_array($data)) {
            foreach ($data as $key => $item) {
                if (in_array($key, $require_items)) {
                    $info[$key] = $item;
                }
            }
        } else {
            return false;
        }
        $trade_exist = $this->account_db->get_one(['trade_sn' => $info['trade_sn']]);
        if ($trade_exist) {
            return $trade_exist['id'];
        }
        $this->account_db->insert($info);

        return $this->account_db->insert_id();
    }

    /**
     * 获取流水记录
     * @param int $id 流水帐号
     * @return bool|array
     */
    public function get_record($id)
    {
        $id = intval($id);
        $result = [];
        $result = $this->account_db->get_one(['id' => $id]);
        $status_arr = ['succ', 'failed', 'error', 'timeout', 'cancel'];

        return ($result && !in_array($result['status'], $status_arr)) ? $result : false;
    }

    /**
     * 获取充值方式信息
     * @param $pay_id
     * @return array
     */
    public function get_payment($pay_id)
    {
        $pay_id = intval($pay_id);
        $result = [];
        $result = $this->pay_db->get_one(['pay_id' => $pay_id]);

        return $result;
    }

    /**
     * 获取充值类型
     */
    public function get_paytype()
    {
        $result = $this->pay_db->select('', 'pay_id,name,pay_name,pay_code,pay_desc', '', 'pay_order DESC,pay_id DESC');
        $info = [];
        foreach ($result as $r) {
            $info[] = $r;
        }

        return $info;
    }
}
