<?php

namespace install;

include PATH_INSTALL . 'step/header.tpl.php';
?>
<div class="body_box">
    <div class="main_box">
        <div class="hd">
            <div class="bz a2">
                <div class="jj_bg"></div>
            </div>
        </div>
        <div class="ct">
            <div class="bg_t"></div>
            <div class="clr">
                <div class="l"></div>
                <div class="ct_box nobrd i6v">
                    <div class="nr">
                        <table cellpadding="0" cellspacing="0" class="table_list">
                            <tr>
                                <th class="col1">检查项目</th>
                                <th class="col2">当前环境</th>
                                <th class="col3">PHPCMS 建议</th>
                                <th class="col4">功能影响</th>
                            </tr>
                            <tr>
                                <td>操作系统</td>
                                <td><?php echo php_uname(); ?></td>
                                <td>Windows_NT/Linux/Freebsd</td>
                                <td><span><img src="images/correct.gif"/></span></td>
                            </tr>
                            <tr>
                                <td>WEB 服务器</td>
                                <td><?php echo $_SERVER['SERVER_SOFTWARE']; ?></td>
                                <td>Apache/Nginx/IIS</td>
                                <td><span><img src="images/correct.gif"/></span></td>
                            </tr>
                            <tr>
                                <td>PHP 版本</td>
                                <td>PHP <?php echo phpversion(); ?></td>
                                <td>PHP 5.2.0 及以上</td>
                                <td><?php if (phpversion() >= '5.2.0'){ ?><span><img src="images/correct.gif"/></span><?php }else{ ?><font class="red"><img src="images/error.gif"/>&nbsp;无法安装</font><?php } ?></font>
                                </td>
                            </tr>
                            <tr>
                                <td>MYSQLI 扩展</td>
                                <td><?php if (extension_loaded('mysqli')) { ?>√<?php } else { ?>×<?php } ?></td>
                                <td>必须开启</td>
                                <td><?php if (extension_loaded('mysqli')) { ?><span><img src="images/correct.gif"/></span><?php } else { ?><font class="red"><img
                                                src="images/error.gif"/>&nbsp;无法安装</font><?php } ?></td>
                            </tr>
                            <tr>
                                <td>ICONV/MB_STRING 扩展</td>
                                <td><?php if (extension_loaded('iconv') || extension_loaded('mbstring')) { ?>√<?php } else { ?>×<?php } ?></td>
                                <td>必须开启</td>
                                <td><?php if (extension_loaded('iconv') || extension_loaded('mbstring')) { ?><span><img src="images/correct.gif"/></span><?php } else { ?><font
                                            class="red"><img src="images/error.gif"/>&nbsp;字符集转换效率低</font><?php } ?></td>
                            </tr>

                            <tr>
                                <td>JSON扩展</td>
                                <td><?php if ($PHP_JSON) { ?>√<?php } else { ?>×<?php } ?></td>
                                <td>必须开启</td>
                                <td><?php if ($PHP_JSON) { ?><span><img src="images/correct.gif"/></span><?php } else { ?><font class="red"><img src="images/error.gif"/>&nbsp;不只持json,<a
                                                href="http://pecl.php.net/package/json" target="_blank">安装 PECL扩展</a></font><?php } ?></td>
                            </tr>
                            <tr>
                                <td>GD 扩展</td>
                                <td><?php if ($PHP_GD) { ?>√ （支持 <?php echo $PHP_GD; ?>）<?php } else { ?>×<?php } ?></td>
                                <td>建议开启</td>
                                <td><?php if ($PHP_GD) { ?><span><img src="images/correct.gif"/></span><?php } else { ?><font class="red"><img src="images/error.gif"/>&nbsp;不支持缩略图和水印</font><?php } ?>
                                </td>
                            </tr>
                            <tr>
                                <td>ZLIB 扩展</td>
                                <td><?php if (extension_loaded('zlib')) { ?>√<?php } else { ?>×<?php } ?></td>
                                <td>建议开启</td>
                                <td><?php if (extension_loaded('zlib')) { ?><span><img src="images/correct.gif"/></span><?php } else { ?><font class="red"><img
                                                src="images/error.gif"/>&nbsp;不支持Gzip功能</font><?php } ?></td>
                            </tr>
                            <tr>
                                <td>FTP 扩展</td>
                                <td><?php if (extension_loaded('ftp')) { ?>√<?php } else { ?>×<?php } ?></td>
                                <td>建议开启</td>
                                <td><?php if (extension_loaded('ftp')) { ?><span><img src="images/correct.gif"/></span><?php } elseif (ISUNIX) { ?><font class="red"><img
                                                src="images/error.gif"/>&nbsp;不支持FTP形式文件传送</font><?php } ?></td>
                            </tr>

                            <tr>
                                <td>allow_url_fopen</td>
                                <td><?php if (ini_get('allow_url_fopen')) { ?>√<?php } else { ?>×<?php } ?></td>
                                <td>建议打开</td>
                                <td><?php if (ini_get('allow_url_fopen')) { ?><span><img src="images/correct.gif"/></span><?php } else { ?><font class="red"><img
                                                src="images/error.gif"/>&nbsp;不支持保存远程图片</font><?php } ?></td>
                            </tr>

                            <tr>
                                <td>fsockopen</td>
                                <td><?php if (function_exists('fsockopen')) { ?>√<?php } else { ?>×<?php } ?></td>
                                <td>建议打开</td>
                                <td><?php if ($PHP_FSOCKOPEN == '1') { ?><span><img src="images/correct.gif"/></span><?php } else { ?><font class="red"><img
                                                src="images/error.gif"/>&nbsp;不支持fsockopen函数</font><?php } ?></td>
                            </tr>

                            <tr>
                                <td>DNS解析</td>
                                <td><?php if ($PHP_DNS) { ?>√<?php } else { ?>×<?php } ?></td>
                                <td>建议设置正确</td>
                                <td><?php if ($PHP_DNS) { ?><span><img src="images/correct.gif"/></span><?php } else { ?><font class="red"><img src="images/error.gif"/>&nbsp;不支持采集和保存远程图片</font><?php } ?>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="bg_b"></div>
        </div>
        <div class="btn_box"><a href="javascript:history.go(-1);" class="s_btn pre">上一步</a>
            <?php if ($is_right) { ?>
            <a href="javascript:void(0);" onClick="$('#install').submit();return false;" class="x_btn">下一步</a></div>
        <?php } else { ?>
            <a onClick="alert('当前配置不满足Phpcms安装需求，无法继续安装！');" class="x_btn pre">检测不通过</a>
        <?php } ?>
        <form id="install" action="index.php?" method="get">
            <input type="hidden" name="step" value="3">
        </form>
    </div>
</div>
</body>
</html>
