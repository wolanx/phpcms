<?php

namespace phpcms\libs\classes;

use pc_base;

class format
{
    /**
     * 日期格式化
     * @param $timestamp
     * @param $showtime
     * @return string
     */
    public static function date($timestamp, $showtime = 0)
    {
        $times = intval($timestamp);
        if (!$times) {
            return true;
        }
        $lang = pc_base::load_config('system', 'lang');
        if ($lang == 'zh-cn') {
            $str = $showtime ? date('Y-m-d H:i:s', $times) : date('Y-m-d', $times);
        } else {
            $str = $showtime ? date('m/d/Y H:i:s', $times) : date('m/d/Y', $times);
        }

        return $str;
    }

    /**
     * 获取当前星期
     * @param $timestamp
     * @return array
     */
    public static function week($timestamp)
    {
        $times = intval($timestamp);
        if (!$times) {
            return true;
        }
        $weekarray = [
            L('Sunday'),
            L('Monday'),
            L('Tuesday'),
            L('Wednesday'),
            L('Thursday'),
            L('Friday'),
            L('Saturday'),
        ];

        return $weekarray[date("w", $timestamp)];
    }
}
