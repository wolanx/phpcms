<?php

namespace install;

include PATH_INSTALL . "step/header.tpl.php";
?>
<div class="body_box">
    <div class="main_box">
        <div class="hd">
            <div class="bz a6">
                <div class="jj_bg"></div>
            </div>
        </div>
        <div class="ct">
            <div class="bg_t"></div>
            <div class="clr">
                <div class="l"></div>
                <div class="ct_box">
                    <div class="nr">
                        <div id="installmessage">正在准备安装 ...<br/></div>
                    </div>
                </div>
            </div>
            <div class="bg_b"></div>
        </div>
        <div class="btn_box">
            <a href="javascript:history.go(-1);" class="s_btn pre">上一步</a>
            <a href="javascript:void(0);" onClick="$('#install').submit();return false;" class="x_btn pre" id="finish">安装中..</a>
        </div>
    </div>
</div>
<div id="hiddenop"></div>
<form id="install" action="index.php?" method="post">
    <input type="hidden" name="module" id="module" value="<?php echo $module ?>"/>
    <input type="hidden" name="testdata" id="testdata" value="<?php echo $testdata ?>"/>
    <input type="hidden" id="selectmod" name="selectmod" value="<?php echo $selectmod ?>"/>
    <input type="hidden" name="step" value="7">
</form>
</body>
<script language="JavaScript">
    <!--
    $().ready(function () {
        reloads();
    })
    var n = 0;
    var setting = new Array();
    setting['admin'] = '后台管理主模块安装成功......';
    setting['phpsso'] = 'PHPSSO单点登录系统安装成功......';
    setting['comment'] = '评论模块安装成功......';
    setting['announce'] = '公告模块安装成功......';
    setting['poster'] = '广告模块安装成功......';
    setting['link'] = '友情链接模块安装成功......';
    setting['vote'] = '投票模块安装成功......';
    setting['mood'] = '心情指数模块安装成功......';
    setting['message'] = '短消息模块安装成功......';
    setting['formguide'] = '表单向导模块安装成功......';
    setting['wap'] = '手机门户模块安装成功......';
    setting['upgrade'] = '自动升级模块安装成功......';
    setting['tag'] = '标签模块安装成功......';
    setting['sms'] = '短信模块安装成功......';
    setting['video'] = '视频模块安装成功......';

    var dbhost = '<?php echo $dbhost?>';
    var dbport = '<?php echo $dbport?>';
    var dbuser = '<?php echo $dbuser?>';
    var dbpw = '<?php echo $dbpw?>';
    var dbname = '<?php echo $dbname?>';
    var tablepre = '<?php echo $tablepre?>';
    var dbcharset = '<?php echo $dbcharset?>';
    var pconnect = '<?php echo $pconnect?>';
    var username = '<?php echo $username?>';
    var password = '<?php echo $password?>';
    var email = '<?php echo $email?>';
    var ftp_user = '<?php echo $dbuser?>';
    var password_key = '<?php echo $password_key?>';

    function reloads() {
        var module = $('#selectmod').val();
        m_d = module.split(',');
        $.ajax({
            type: "POST",
            url: 'index.php',
            data: "step=installmodule&module=" + m_d[n] + "&dbhost=" + dbhost + "&dbport=" + dbport + "&dbuser=" + dbuser + "&dbpw=" + dbpw + "&dbname=" + dbname + "&tablepre=" + tablepre + "&dbcharset=" + dbcharset + "&pconnect=" + pconnect + "&username=" + username + "&password=" + password + "&email=" + email + "&ftp_user=" + ftp_user + "&password_key=" + password_key + "&sid=" + Math.random() * 5,
            success: function (msg) {
                if (msg == 1) {
                    alert('指定的数据库不存在，系统也无法创建，请先通过其他方式建立好数据库！');
                } else if (msg == 2) {
                    $('#installmessage').append("<font color='#ff0000'>" + m_d[n] + "/install/mysql.sql 数据库文件不存在</font>");
                } else if (msg.length > 20) {
                    $('#installmessage').append("<font color='#ff0000'>错误信息：</font>" + msg);
                } else {
                    $('#installmessage').append(setting[m_d[n]] + msg + "<img src='images/correct.gif' /><br>");
                    n++;
                    if (n < m_d.length) {
                        reloads();
                    } else {
                        var testdata = $('#testdata').val();
                        if (testdata == 1) {
                            $('#hiddenop').load('?step=testdata&sid=' + Math.random() * 5);
                            $('#installmessage').append("<font color='yellow'>测试数据安装完成</font><br>");
                        }
                        $('#hiddenop').load('?step=cache_all&sid=' + Math.random() * 5);
                        $('#installmessage').append("<font color='yellow'>缓存更新成功</font><br>");
                        $('#installmessage').append("<font color='yellow'>安装完成</font>");
                        $('#finish').removeClass('pre');
                        $('#finish').html('安装完成');
                        setTimeout("$('#install').submit();", 1000);
                    }
                    document.getElementById('installmessage').scrollTop = document.getElementById('installmessage').scrollHeight;
                }
            }
        });
    }

    //-->
</script>
</html>
