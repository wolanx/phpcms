<?php

namespace install;

include PATH_INSTALL . 'step/header.tpl.php';
?>
<div class="body_box">
    <div class="main_box">
        <div class="hd">
            <div class="bz a4">
                <div class="jj_bg"></div>
            </div>
        </div>
        <div class="ct">
            <div class="bg_t"></div>
            <div class="clr">
                <div class="l"></div>
                <div class="ct_box nobrd i6v">
                    <div class="nr">
                        <?php if ($reg_sso_status == '') { ?>
                            <table cellpadding="0" cellspacing="0" class="table_list">
                                <tr>
                                    <th class="col1">目录文件</th>
                                    <th class="col2">所需状态</th>
                                    <th class="col3">当前状态</th>
                                </tr>
                                <?php foreach ($filesmod as $filemod) { ?>
                                    <tr>
                                        <td><?php echo $filemod['file'] ?></td>
                                        <td><span><img src="images/correct.gif"/>&nbsp;可写</span></td>
                                        <td><?php echo $filemod['is_writable'] ? '<span><img src="images/correct.gif" />&nbsp;可写</span>' : '<font class="red"><img src="images/error.gif" />&nbsp;不可写</font>' ?></td>
                                    </tr>
                                <?php } ?>
                            </table>
                        <?php } else { ?>
                        <div class="err_info">
                            <?php echo $reg_sso_status ?><br/>
                            <span>请点击“上一步”按钮，重新填写。</span>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bg_b"></div>
        </div>
        <div class="btn_box"><a href="javascript:history.go(-1);" class="s_btn">上一步</a>
            <?php if ($no_writablefile == 0) { ?>
                <a href="javascript:void(0);" onClick="$('#install').submit();return false;" class="x_btn">下一步</a>
            <?php } else { ?>
                <a onClick="alert('存在不可写目录或者文件');" class="x_btn pre">检测不通过</a>
            <?php } ?>
        </div>
        <form id="install" action="index.php?" method="post">
            <input type="hidden" name="step" value="5">
            <input type="hidden" id="selectmod" name="selectmod" value="<?php echo $selectmod ?>"/>
            <input type="hidden" name="testdata" value="<?php echo $testdata ?>"/>
            <input type="hidden" id="install_phpsso" name="install_phpsso" value="<?php echo $install_phpsso ?>"/>

        </form>
    </div>
</div>
</body>
</html>
