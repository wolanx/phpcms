<?php

use phpcms\libs\classes\form;

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="<?= CHARSET ?>">
    <title><?= L('phpcms_logon') ?></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="<?= CDN_PATH ?>/admin/css/index_login.css">
    <script>
        if (top != self) {
            if (self != top) top.location = self.location;
        }
    </script>
</head>

<body onload="javascript:document.myform.username.focus();">
<div id="login_bg" class="login_box">
    <div class="login_iptbox">
        <form action="index.php?m=admin&c=index&a=login&dosubmit=1" method="post" name="myform">
            <input name="dosubmit" value="" type="submit" class="login_tj_btn"><label><?php echo L('username') ?>：</label>
            <input name="username" type="text" class="ipt" value=""><label><?php echo L('password') ?>：</label>
            <input name="password" type="password" class="ipt" value=""><label><?php echo L('security_code') ?>：</label>
            <input name="code" type="text" class="ipt ipt_reg" onfocus="document.getElementById('yzm').style.display='block'">
            <div id="yzm" class="yzm"><?php echo form::checkcode('code_img') ?><br>
                <a href="javascript:document.getElementById('code_img').src='<?php echo SITE_PROTOCOL . SITE_URL . WEB_PATH; ?>api.php?op=checkcode&m=admin&c=index&a=checkcode&time='+Math.random();void(0);"><?php echo L('click_change_validate') ?></a>
            </div>
        </form>
    </div>
    <div class="cr"><?php echo L("copyright") ?></div>
</div>
</body>
</html>