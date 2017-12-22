<?php
use phpcms\modules\admin\classes\admin;

?>
<!DOCTYPE html>
<html lang="en"<?php if (isset($addbg)) { ?> class="addbg"<?php } ?>>
<head>
    <meta charset="<?= CHARSET ?>">
    <title><?php echo L('website_manage'); ?></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="<?php echo CSS_PATH ?>reset.css">
    <link rel="stylesheet" href="<?php echo CSS_PATH . SYS_STYLE; ?>-system.css">
    <link rel="stylesheet" href="<?php echo CSS_PATH ?>table_form.css">
    <?php
    if (!$this->get_siteid()) {
        showmessage(L('admin_login'), '?m=admin&c=index&a=login');
    }
    if (isset($show_dialog)) { ?>
        <link rel="stylesheet" href="<?php echo CSS_PATH ?>dialog.css">
        <script src="<?php echo JS_PATH ?>dialog.js"></script>
    <?php } ?>
    <link rel="stylesheet" href="<?php echo CSS_PATH ?>style/<?php echo SYS_STYLE; ?>-styles1.css" title="styles1">
    <link rel="alternate stylesheet" href="<?php echo CSS_PATH ?>style/<?php echo SYS_STYLE; ?>-styles2.css" title="styles2">
    <link rel="alternate stylesheet" href="<?php echo CSS_PATH ?>style/<?php echo SYS_STYLE; ?>-styles3.css" title="styles3">
    <link rel="alternate stylesheet" href="<?php echo CSS_PATH ?>style/<?php echo SYS_STYLE; ?>-styles4.css" title="styles4">
    <script src="<?php echo JS_PATH ?>jquery.min.js"></script>
    <script src="<?php echo JS_PATH ?>admin_common.js"></script>
    <?php if (isset($show_validator)) { ?>
        <script src="<?php echo JS_PATH ?>formvalidator.js"></script>
        <script src="<?php echo JS_PATH ?>formvalidatorregex.js"></script>
    <?php } ?>
    <script type="text/javascript">
        window.focus();
        var pc_hash = '<?php echo $_SESSION['pc_hash'];?>';
        <?php if(!isset($show_pc_hash)) { ?>
        window.onload = function () {
            var html_a = document.getElementsByTagName('a');
            var num = html_a.length;
            for (var i = 0; i < num; i++) {
                var href = html_a[i].href;
                if (href && href.indexOf('javascript:') == -1) {
                    if (href.indexOf('?') != -1) {
                        html_a[i].href = href + '&pc_hash=' + pc_hash;
                    } else {
                        html_a[i].href = href + '?pc_hash=' + pc_hash;
                    }
                }
            }

            var html_form = document.forms;
            var num = html_form.length;
            for (var i = 0; i < num; i++) {
                var newNode = document.createElement("input");
                newNode.name = 'pc_hash';
                newNode.type = 'hidden';
                newNode.value = pc_hash;
                html_form[i].appendChild(newNode);
            }
        }
        <?php } ?>
    </script>
</head>
<body>
<?php if (!isset($show_header)) { ?>
    <div class="subnav">
        <div class="content-menu ib-a blue line-x">
            <?php if (isset($big_menu)) {
                echo '<a class="add fb" href="' . $big_menu[0] . '"><em>' . $big_menu[1] . '</em></a>　';
            } else {
                $big_menu = '';
            } ?>
            <?php echo admin::submenu($_GET['menuid'], $big_menu); ?>
        </div>
    </div>
<?php } ?>
<style>
    html {
        _overflow-y: scroll
    }
</style>