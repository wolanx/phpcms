<?php

namespace install;

include PATH_INSTALL . 'step/header.tpl.php';
?>
<script>
    $(document).ready(function () {
        $.formValidator.initConfig({
            autotip: true, formid: "install", onerror: function (msg) {
            }
        });
        $("input:radio[name='install_phpsso']").formValidator({
            relativeid: "install_phpsso_2",
            tipid: "aiguoTip",
            tipcss: {"left": "60px"},
            onshow: "请选择一个安装类型",
            onfocus: "请选择一个安装类型",
            oncorrect: "选择完成"
        }).inputValidator({min: 1, max: 1, onerror: "请选择一个安装类型"});
        $("#sso_url").formValidator({
            onshow: "请输入phpsso地址，必须以'/'结束",
            onfocus: "请输入phpsso地址，必须以'/'结束",
            empty: false
        }).inputValidator({onerror: "地址必须以'/'结束"}).regexValidator({regexp: "http:\/\/(.+)\/$", onerror: "地址必须以'/'结束"});
    })
</script>
<div class="body_box">
    <div class="main_box">
        <div class="hd">
            <div class="bz a3">
                <div class="jj_bg"></div>
            </div>
        </div>
        <div class="ct">
            <div class="bg_t"></div>
            <div class="clr">
                <div class="l"></div>
                <div class="ct_box nobrd i6v">
                    <div class="nr">
                        <form id="install" action="index.php?" method="post">
                            <input type="hidden" name="step" value="4">
                            <fieldset>
                                <legend>PHPSSO配置</legend>
                                <div class="content">
                                    <input type="radio" name="install_phpsso" id="install_phpsso_1" value="1" onclick="set_sso_hidden()" checked>&nbsp;&nbsp;全新安装PHPCMS V9 (含 PHPSSO)<br>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>必选模块</legend>
                                <div class="content">
                                    <label><input type="checkbox" name="admin" value="admin" checked disabled>后台管理模块</label>
                                    <label><input type="checkbox" name="content" value="content" checked disabled>内容模块</label>
                                    <label><input type="checkbox" name="member" value="member" checked disabled>会员模型</label>
                                    <label><input type="checkbox" name="pay" value="pay" checked disabled>财务模块</label>
                                    <label><input type="checkbox" name="special" value="special" checked disabled>专题模块</label>
                                    <label><input type="checkbox" name="search" value="search" checked disabled>全文搜索</label>
                                    <label><input type="checkbox" name="phpsso" value="phpsso" checked disabled>PHPSSO</label>
                                    <label><input type="checkbox" name="video" value="video" checked disabled>视频模块</label>
                                </div>
                            </fieldset>

                            <fieldset>
                                <legend>可选模块</legend>
                                <div class="content">
                                    <?php
                                    $count = count($PHPCMS_MODULES['name']);
                                    $j = 0;
                                    foreach ($PHPCMS_MODULES['name'] as $i => $module) {
                                        if ($j % 5 == 0) {
                                            echo "<tr >";
                                        }
                                        ?>
                                        <label>
                                            <input type="checkbox" name="selectmod[]" value="<?php echo $module ?>" checked><?php echo $PHPCMS_MODULES['modulename'][$i] ?> 模块
                                        </label>
                                        <?php
                                        if ($j % 5 == 4) {
                                            echo "</tr>";
                                        }
                                        $j++;
                                    }
                                    ?>
                                </div>
                            </fieldset>
                            <fieldset>
                                <legend>可选数据</legend>
                                <div class="content">
                                    <label style="width:auto"><input type="checkbox" name="testdata" value="1" checked>默认测试数据 （用于新手和调试用户）</label>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
            <div class="bg_b"></div>
        </div>
        <div class="btn_box">
            <a href="javascript:history.go(-1);" class="s_btn pre">上一步</a>
            <a href="javascript:void(0);" onClick="$('#install').submit();return false;" class="x_btn">下一步</a>
        </div>
    </div>
</div>
<script>
    function set_sso() {
        $("#sso_cfg").show();
    }

    function set_sso_hidden() {
        $("#sso_cfg").hide();
    }
</script>
</body>
</html>