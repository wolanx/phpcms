<?php
include $this->admin_tpl('header');
?>
<form name="myform" action="?m=admin&c=category&a=listorder" method="post">
    <div class="pad_10">
        <div class="explain-col">
            <?= L('category_cache_tips') ?>，<a href="?m=admin&c=category&a=public_cache&menuid=43&module=admin"><?= L('update_cache') ?></a>
        </div>
        <div class="bk10"></div>
        <div class="table-list">
            <table width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th width="38"><?= L('listorder') ?></th>
                    <th width="30">catid</th>
                    <th><?= L('catname') ?></th>
                    <th align='left' width='50'><?= L('category_type') ?></th>
                    <th align='left' width="50"><?= L('modelname') ?></th>
                    <th align='center' width="40"><?= L('items') ?></th>
                    <th align='center' width="30"><?= L('vistor') ?></th>
                    <th align='center' width="80"><?= L('domain_help') ?></th>
                    <th><?= L('operations_manage') ?></th>
                </tr>
                </thead>
                <tbody>
                <?= $categorys ?>
                </tbody>
            </table>

            <div class="btn">
                <input type="hidden" name="pc_hash" value="<?= $_SESSION['pc_hash'] ?>">
                <input type="submit" class="button" name="dosubmit" value="<?= L('listorder') ?>">
            </div>
        </div>
    </div>
    </div>
</form>
<script>
    window.top.$('#display_center_id').css('display', 'none');
</script>
</body>
</html>
