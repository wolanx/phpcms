phpcms
======

# PHPCMS 升级版

项目基于 `PHPCMS` `v9.6.3` 进行升级改造，主要目标

- [x] 代码规范 `psr-1` `psr-2`
- [ ] `include`加载 => `namespace`加载 `30%`
- [ ] 基于`phpstorm doc` 修补掉 各种 ide warnning `30%`
- [ ] 后台界面的升级 采用 `google material design` `1%`

基于以上目标改造后，代码将
* 更加现代化，可运行在高版本php，如php7
* 更统一美观的界面
* 更好的开发体验，代码doc的完善


location ~ .*\.html$
{
	rewrite ^/content-([0-9]+)-([0-9]+)-([0-9]+).html /index.php?m=content&c=index&a=show&catid=$1&id=$2&page=$3 last;
	rewrite ^/show-([0-9]+)-([0-9]+)-([0-9]+).html /index.php?m=content&c=index&a=show&catid=$1&id=$2&page=$3 last;
	rewrite ^/list-([0-9]+)-([0-9]+).html /index.php?m=content&c=index&a=lists&catid=$1&page=$2 last;
}