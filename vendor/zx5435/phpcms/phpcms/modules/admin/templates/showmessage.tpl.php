<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>提示信息</title>
    <style>
        .pc-dialog {
            box-shadow: 0 1px 3px rgba(0, 0, 0, .3);
            width: 450px;
            height: 175px;
            position: absolute;
            top: 44%;
            left: 50%;
            margin: -85px 0 0 -225px;
            border-radius: 8px;
            text-align: center;
        }

        .pc-dialog .title {
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            text-indent: 1em;
            height: 50px;
            line-height: 50px;
            background-color: #5f93e7;
            color: #fff;
            font-size: 18px;
            text-align: left;
        }

        .pc-dialog .content {
            padding: 40px 12px 10px 45px;
            text-align: left;
            height: 100px;
            font-size: 14px;
            box-sizing: border-box;
            display: inline-block;
        }

        .pc-dialog .bottom {
            line-height: 25px;
            background: #e4ecf7;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
            font-size: 13px;
            text-align: center;
        }

        .pc-dialog .bottom a {
            color: #5f93e7;
        }

        .pc-dialog .ok, .pc-dialog .guery {
            background: url(<?php echo IMG_PATH?>msg_img/msg_bg.png) no-repeat 0 -560px;
        }

        .pc-dialog .guery {
            background-position: left -467px;
        }
    </style>
    <script src="<?= JS_PATH ?>jquery.min.js"></script>
    <script src="<?= JS_PATH ?>admin_common.js"></script>
</head>
<body>
<div class="pc-dialog">
    <div class="title">提示信息</div>
    <div class="content guery"><?= $msg ?></div>
    <div class="bottom">
        <?php if ($url_forward == 'goback' || $url_forward == '') { ?>
            <a href="javascript:history.back();">[点这里返回上一页]</a>
        <?php } elseif ($url_forward == "close") { ?>
            <a href="javascript:window.close();"><?= L('close') ?></a>
        <?php } elseif ($url_forward == "blank") { ?>
            <!---->
        <?php } elseif ($url_forward) {
        if (strpos($url_forward, '&pc_hash') === false) {
            $url_forward .= '&pc_hash=' . $_SESSION['pc_hash'];
        } ?>
            <a href="<?= $url_forward ?>"><?= L('click_here') ?></a>
            <script>setTimeout("redirect('<?= $url_forward?>');",<?= $ms ?>);</script>
        <?php } ?>

        <?php if ($returnjs): ?>
            <script><?= $returnjs ?></script>
        <?php endif ?>

        <?php if ($dialog): ?>
            <script>
                window.top.right.location.reload();
                window.top.art.dialog({id: "<?php echo $dialog?>"}).close();
            </script>
        <?php endif ?>
    </div>
</div>
<script>
    function close_dialog() {
        window.top.right.location.reload();
        window.top.art.dialog({id: "<?php echo $dialog?>"}).close();
    }
</script>

</body>
</html>