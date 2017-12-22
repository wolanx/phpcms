<?php

namespace install;

include PATH_INSTALL . 'step/header.tpl.php';
?>
<div class="body_box">
    <div class="main_box">
        <div class="hd">
            <div class="bz a1">
                <div class="jj_bg"></div>
            </div>
        </div>
        <div class="ct">
            <div class="bg_t"></div>
            <div class="clr">
                <div class="l"></div>
                <div class="ct_box">
                    <div class="nr">
                        <?php echo format_textarea($license) ?>
                    </div>
                </div>
            </div>
            <div class="bg_b"></div>
        </div>
        <div class="btn_box"><a href="javascript:void(0);" class="is_btn" onclick="$('#install').submit();return false;">开始安装</a></div>
        <form id="install" action="index.php?" method="get">
            <input type="hidden" name="step" value="2">
        </form>
    </div>
</div>
</body>
</html>
