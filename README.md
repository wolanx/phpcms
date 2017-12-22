基于 PHPCMS v9.6.3 进行升级改造
======

# PHPCMS 升级版

项目基于 `PHPCMS` `v9.6.3` 进行升级改造，主要目标

- [x] 代码规范 `psr-1` `psr-2`
- [x] `include`加载 => `namespace`加载 `70%`
- [x] 基于`phpstorm doc` 修补掉 各种 ide warnning `70%`
- [x] 界面html美化 `10%`

基于以上目标改造后，代码将
* 更加现代化，可运行在高版本php，如php7
* 更统一美观的界面
* 更好的开发体验，代码doc的完善

# 部署
```text
git clone https://github.com/zx5435/phpcms.git
make build
// 修改 docker-compose.yml 端口 1414
make start
```

# 结构介绍
```text
.
├── __cicd__
│   ├── nginx
│   └── php
├── caches
│   ├── caches_*
│   ├── configs                 // 配置
│   ├── error_log.php           // 错误日志
│   └── install.lock
├── composer.json               // composer安装适合 升级更新
├── docker-compose.yml
├── vendor
│   ├── autoload.php
│   └── zx5435                  // 核心库
│       └── phpcms
└── web                         // nginx入口,解决非正常访问.php
    ├── api.php
    ├── favicon.ico
    ├── index.php
    ├── install                 // 安装目录
    ├── statics                 // 静态文件
    └── uploadfile              // 上传目录
```

```text
location ~ .*\.html$
{
	rewrite ^/content-([0-9]+)-([0-9]+)-([0-9]+).html /index.php?m=content&c=index&a=show&catid=$1&id=$2&page=$3 last;
	rewrite ^/show-([0-9]+)-([0-9]+)-([0-9]+).html /index.php?m=content&c=index&a=show&catid=$1&id=$2&page=$3 last;
	rewrite ^/list-([0-9]+)-([0-9]+).html /index.php?m=content&c=index&a=lists&catid=$1&page=$2 last;
}
```
