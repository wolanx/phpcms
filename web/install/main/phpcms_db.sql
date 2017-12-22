SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `phpcms_admin`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin`;
CREATE TABLE `phpcms_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_admin_panel`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin_panel`;
CREATE TABLE `phpcms_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin_role`;
CREATE TABLE `phpcms_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_admin_role_priv`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_admin_role_priv`;
CREATE TABLE `phpcms_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_attachment`;
CREATE TABLE `phpcms_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_attachment_index`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_attachment_index`;
CREATE TABLE `phpcms_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB;
-- ----------------------------
-- Table structure for `phpcms_badword`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_badword`;
CREATE TABLE `phpcms_badword` (
  `badid` smallint(5) unsigned NOT NULL auto_increment,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL default '1',
  `replaceword` char(20) NOT NULL default '0',
  `lastusetime` int(10) unsigned NOT NULL default '0',
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=InnoDB ;

-- ----------------------------
-- Table structure for `phpcms_block`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_block`;
CREATE TABLE `phpcms_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_block_history`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_block_history`;
CREATE TABLE `phpcms_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_block_priv`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_block_priv`;
CREATE TABLE `phpcms_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_cache`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_cache`;
CREATE TABLE `phpcms_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY  (`filename`,`path`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_category`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_category`;
CREATE TABLE `phpcms_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=InnoDB ;

-- ----------------------------
-- Table structure for `phpcms_category_priv`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_category_priv`;
CREATE TABLE `phpcms_category_priv` (
 `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_collection_content`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_collection_content`;
CREATE TABLE `phpcms_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_collection_history`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_collection_history`;
CREATE TABLE `phpcms_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_collection_node`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_collection_node`;
CREATE TABLE `phpcms_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_collection_program`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_collection_program`;
CREATE TABLE `phpcms_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `phpcms_content_check`;
CREATE TABLE `phpcms_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_datacall`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_datacall`;
CREATE TABLE `phpcms_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_dbsource`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_dbsource`;
CREATE TABLE `phpcms_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL ,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_downservers`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_downservers`;
CREATE TABLE `phpcms_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_favorite`;
CREATE TABLE `phpcms_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_hits`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_hits`;
CREATE TABLE `phpcms_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_ipbanned`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_ipbanned`;
CREATE TABLE `phpcms_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL auto_increment,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ipbannedid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_keylink`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_keylink`;
CREATE TABLE `phpcms_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL auto_increment,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY  (`keylinkid`)
) ENGINE=InnoDB;


-- ----------------------------
-- Table structure for `phpcms_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_keyword`;
CREATE TABLE IF NOT EXISTS `phpcms_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=InnoDB;


-- ----------------------------
-- Table structure for `phpcms_keyword_data`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_keyword_data`;
CREATE TABLE IF NOT EXISTS `phpcms_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_linkage`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_linkage`;
CREATE TABLE `phpcms_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL default '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL default '0',
  `listorder` smallint(5) unsigned NOT NULL default '0',
  `description` varchar(255) default NULL,
  `setting` varchar(255) default NULL,
  `siteid` smallint(5) NOT NULL default '0',
  PRIMARY KEY  (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_log`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_log`;
CREATE TABLE `phpcms_log` (
  `logid` int(10) unsigned NOT NULL auto_increment,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL default '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_member`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member`;
CREATE TABLE `phpcms_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=InnoDB;



-- ----------------------------
-- Table structure for `phpcms_member_detail`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_detail`;
CREATE TABLE `phpcms_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_member_group`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_group`;
CREATE TABLE `phpcms_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL auto_increment,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL default '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL default '0',
  `allowvisit` tinyint(1) unsigned NOT NULL default '0',
  `allowpost` tinyint(1) unsigned NOT NULL default '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL default '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL default '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL default '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL default '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL default '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL default '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=InnoDB;


-- ----------------------------
-- Table structure for `phpcms_member_verify`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_verify`;
CREATE TABLE `phpcms_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL auto_increment,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL default '0',
  `point` smallint(5) unsigned NOT NULL default '0',
  `amount` decimal(8,2) unsigned NOT NULL default '0.00',
  `modelinfo` char(255) NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) default NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY  (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_member_menu`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_menu`;
CREATE TABLE `phpcms_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_member_vip`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_member_vip`;
CREATE TABLE `phpcms_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_menu`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_menu`;
CREATE TABLE `phpcms_menu` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` char(40) NOT NULL default '',
  `parentid` smallint(6) NOT NULL default '0',
  `m` char(20) NOT NULL default '',
  `c` char(20) NOT NULL default '',
  `a` char(20) NOT NULL default '',
  `data` char(100) NOT NULL default '',
  `listorder` smallint(6) unsigned NOT NULL default '0',
  `display` enum('1','0') NOT NULL default '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY  (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=InnoDB;

--
-- 表的结构 `phpcms_model`
--

DROP TABLE IF EXISTS `phpcms_model`;
CREATE TABLE IF NOT EXISTS `phpcms_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL ,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' ,
  `items` smallint(5) unsigned NOT NULL DEFAULT '0' ,
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL ,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL ,
  `member_list_template` varchar(30) NOT NULL ,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `phpcms_model_field`;
CREATE TABLE IF NOT EXISTS `phpcms_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_module`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_module`;
CREATE TABLE `phpcms_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL default '0',
  `version` varchar(50) NOT NULL default '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL default '0',
  `disabled` tinyint(1) unsigned NOT NULL default '0',
  `installdate` date NOT NULL default '0000-00-00',
  `updatedate` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`module`)
) ENGINE=InnoDB;



-- ----------------------------
-- Table structure for `phpcms_page`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_page`;
CREATE TABLE `phpcms_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_pay_account`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_pay_account`;
CREATE TABLE `phpcms_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_pay_payment`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_pay_payment`;
CREATE TABLE `phpcms_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL auto_increment,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) default NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL default '0',
  `is_online` tinyint(1) unsigned NOT NULL default '0',
  `pay_order` tinyint(3) unsigned NOT NULL default '0',
  `enabled` tinyint(1) unsigned NOT NULL default '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY  (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_pay_spend`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_pay_spend`;
CREATE TABLE `phpcms_pay_spend` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `creat_at` int(10) unsigned NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL default '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL default '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_position`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_position`;
CREATE TABLE `phpcms_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=InnoDB;


INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(1, 0, 0, '首页焦点图推荐', 20, 1, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(2, 0, 0, '首页头条推荐', 20, 4, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(13, 82, 0, '栏目页焦点图', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(5, 69, 0, '推荐下载', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(8, 30, 54, '图片频道首页焦点图', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(9, 0, 0, '网站顶部推荐', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(10, 0, 0, '栏目首页推荐', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `listorder`, `siteid`) VALUES(12, 0, 0, '首页图片推荐', 20, 0, 1);
INSERT INTO `phpcms_position` (`posid`, `modelid`, `catid`, `name`, `maxnum`, `extention`, `listorder`, `siteid`) VALUES
(14, 0, 0, '视频首页焦点图', 20, '', 0, 1),
(15, 0, 0, '视频首页头条推荐', 20, '', 0, 1),
(16, 0, 0, '视频首页每日热点', 20, '', 0, 1),
(17, 0, 0, '视频栏目精彩推荐', 20, '', 0, 1);


-- ----------------------------
-- Table structure for `phpcms_position_data`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_position_data`;
CREATE TABLE `phpcms_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=InnoDB;


-- ----------------------------
-- Table structure for `phpcms_queue`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_queue`;
CREATE TABLE `phpcms_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_release_point`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_release_point`;
CREATE TABLE `phpcms_release_point` (
  `id` mediumint(8) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `host` varchar(100) default NULL,
  `username` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  `port` varchar(10) default '21',
  `pasv` tinyint(1) default '0',
  `ssl` tinyint(1) default '0',
  `path` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_search`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_search`;
CREATE TABLE `phpcms_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_search_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_search_keyword`;
CREATE TABLE `phpcms_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_session`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_session`;
CREATE TABLE `phpcms_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL default '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL default '0',
  `roleid` tinyint(3) unsigned default '0',
  `groupid` tinyint(3) unsigned NOT NULL default '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY  (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) TYPE=MEMORY;

-- ----------------------------
-- Table structure for `phpcms_site`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_site`;
CREATE TABLE `phpcms_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_special`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_special`;
CREATE TABLE IF NOT EXISTS `phpcms_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=InnoDB ;

-- ----------------------------
-- Table structure for `phpcms_special_c_data`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_special_c_data`;
CREATE TABLE IF NOT EXISTS `phpcms_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_special_content`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_special_content`;
CREATE TABLE IF NOT EXISTS `phpcms_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=InnoDB ;

-- ----------------------------
-- Table structure for `phpcms_sphinx_counter`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_sphinx_counter`;
CREATE TABLE `phpcms_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`counter_id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_template_bak`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_template_bak`;
CREATE TABLE `phpcms_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=InnoDB;



-- ----------------------------
-- Table structure for `phpcms_times`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_times`;
CREATE TABLE `phpcms_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL default '0',
  `isadmin` tinyint(1) NOT NULL default '0',
  `times` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`username`,`isadmin`)
) TYPE=MEMORY;

-- ----------------------------
-- Table structure for `phpcms_type`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_type`;
CREATE TABLE `phpcms_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_urlrule`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_urlrule`;
CREATE TABLE `phpcms_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL auto_increment,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL default '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY  (`urlruleid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `phpcms_workflow`
-- ----------------------------
DROP TABLE IF EXISTS `phpcms_workflow`;
CREATE TABLE `phpcms_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=InnoDB;

INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(1, 1, 1, '一级审核', '审核一次', '');
INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(2, 1, 2, '二级审核', '审核两次', '');
INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(3, 1, 3, '三级审核', '审核三次', '');
INSERT INTO `phpcms_workflow` (`workflowid`, `siteid`, `steps`, `workname`, `description`, `setting`) VALUES(4, 1, 4, '四级审核', '四级审核', '');

DROP TABLE IF EXISTS `phpcms_copyfrom`;
CREATE TABLE IF NOT EXISTS `phpcms_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `phpcms_download`;
CREATE TABLE IF NOT EXISTS `phpcms_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB;

--
-- 转存表中的数据 `phpcms_download`
--


-- --------------------------------------------------------

--
-- 表的结构 `phpcms_download_data`
--

DROP TABLE IF EXISTS `phpcms_download_data`;
CREATE TABLE IF NOT EXISTS `phpcms_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB;

--
-- 转存表中的数据 `phpcms_download_data`
--


-- --------------------------------------------------------

--
-- 表的结构 `phpcms_news`
--

DROP TABLE IF EXISTS `phpcms_news`;
CREATE TABLE IF NOT EXISTS `phpcms_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB;

--
-- 转存表中的数据 `phpcms_news`
--


-- --------------------------------------------------------

--
-- 表的结构 `phpcms_news_data`
--

DROP TABLE IF EXISTS `phpcms_news_data`;
CREATE TABLE IF NOT EXISTS `phpcms_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB;

--
-- 转存表中的数据 `phpcms_news_data`
--


-- --------------------------------------------------------

--
-- 表的结构 `phpcms_picture`
--

DROP TABLE IF EXISTS `phpcms_picture`;
CREATE TABLE IF NOT EXISTS `phpcms_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB;

--
-- 转存表中的数据 `phpcms_picture`
--


-- --------------------------------------------------------

--
-- 表的结构 `phpcms_picture_data`
--

DROP TABLE IF EXISTS `phpcms_picture_data`;
CREATE TABLE IF NOT EXISTS `phpcms_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

--
-- 表的结构 `phpcms_video`
--

DROP TABLE IF EXISTS `phpcms_video`;
CREATE TABLE IF NOT EXISTS `phpcms_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=InnoDB;


-- --------------------------------------------------------

--
-- 表的结构 `phpcms_video_data`
--

DROP TABLE IF EXISTS `phpcms_video_data`;
CREATE TABLE IF NOT EXISTS `phpcms_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=InnoDB;

-- --------------------------------------------------------


--
-- 表的结构 `phpcms_extend_setting`
--

DROP TABLE IF EXISTS `phpcms_extend_setting`;
CREATE TABLE IF NOT EXISTS `phpcms_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=InnoDB;


-- ----------------------------
-- Records of phpcms_linkage
-- ----------------------------
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1, '中国', '1', 0, 0, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2, '北京市', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3, '上海市', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(4, '天津市', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(5, '重庆市', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(6, '河北省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(7, '山西省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(8, '内蒙古', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(9, '辽宁省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(10, '吉林省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(11, '黑龙江省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(12, '江苏省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(13, '浙江省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(14, '安徽省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(15, '福建省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(16, '江西省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(17, '山东省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(18, '河南省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(19, '湖北省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(20, '湖南省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(21, '广东省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(22, '广西', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(23, '海南省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(24, '四川省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(25, '贵州省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(26, '云南省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(27, '西藏', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(28, '陕西省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(29, '甘肃省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(30, '青海省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(31, '宁夏', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(32, '新疆', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(33, '台湾省', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(34, '香港', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(35, '澳门', '0', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(36, '东城区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(37, '西城区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(38, '崇文区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(39, '宣武区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(40, '朝阳区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(41, '石景山区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(42, '海淀区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(43, '门头沟区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(44, '房山区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(45, '通州区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(46, '顺义区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(47, '昌平区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(48, '大兴区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(49, '怀柔区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(50, '平谷区', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(51, '密云县', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(52, '延庆县', '0', 2, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(53, '黄浦区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(54, '卢湾区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(55, '徐汇区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(56, '长宁区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(57, '静安区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(58, '普陀区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(59, '闸北区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(60, '虹口区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(61, '杨浦区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(62, '闵行区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(63, '宝山区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(64, '嘉定区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(65, '浦东新区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(66, '金山区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(67, '松江区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(68, '青浦区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(69, '南汇区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(70, '奉贤区', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(71, '崇明县', '0', 3, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(72, '和平区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(73, '河东区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(74, '河西区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(75, '南开区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(76, '河北区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(77, '红桥区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(78, '塘沽区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(79, '汉沽区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(80, '大港区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(81, '东丽区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(82, '西青区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(83, '津南区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(84, '北辰区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(85, '武清区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(86, '宝坻区', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(87, '宁河县', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(88, '静海县', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(89, '蓟县', '0', 4, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(90, '万州区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(91, '涪陵区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(92, '渝中区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(93, '大渡口区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(94, '江北区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(95, '沙坪坝区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(96, '九龙坡区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(97, '南岸区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(98, '北碚区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(99, '万盛区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(100, '双桥区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(101, '渝北区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(102, '巴南区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(103, '黔江区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(104, '长寿区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(105, '綦江县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(106, '潼南县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(107, '铜梁县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(108, '大足县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(109, '荣昌县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(110, '璧山县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(111, '梁平县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(112, '城口县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(113, '丰都县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(114, '垫江县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(115, '武隆县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(116, '忠县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(117, '开县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(118, '云阳县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(119, '奉节县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(120, '巫山县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(121, '巫溪县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(122, '石柱县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(123, '秀山县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(124, '酉阳县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(125, '彭水县', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(126, '江津区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(127, '合川区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(128, '永川区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(129, '南川区', '0', 5, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(130, '石家庄市', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(131, '唐山市', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(132, '秦皇岛市', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(133, '邯郸市', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(134, '邢台市', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(135, '保定市', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(136, '张家口市', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(137, '承德市', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(138, '沧州市', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(139, '廊坊市', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(140, '衡水市', '0', 6, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(141, '太原市', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(142, '大同市', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(143, '阳泉市', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(144, '长治市', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(145, '晋城市', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(146, '朔州市', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(147, '晋中市', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(148, '运城市', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(149, '忻州市', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(150, '临汾市', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(151, '吕梁市', '0', 7, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(152, '呼和浩特市', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(153, '包头市', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(154, '乌海市', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(155, '赤峰市', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(156, '通辽市', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(157, '鄂尔多斯市', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(158, '呼伦贝尔市', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(159, '巴彦淖尔市', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(160, '乌兰察布市', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(161, '兴安盟', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(162, '锡林郭勒盟', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(163, '阿拉善盟', '0', 8, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(164, '沈阳市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(165, '大连市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(166, '鞍山市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(167, '抚顺市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(168, '本溪市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(169, '丹东市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(170, '锦州市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(171, '营口市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(172, '阜新市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(173, '辽阳市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(174, '盘锦市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(175, '铁岭市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(176, '朝阳市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(177, '葫芦岛市', '0', 9, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(178, '长春市', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(179, '吉林市', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(180, '四平市', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(181, '辽源市', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(182, '通化市', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(183, '白山市', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(184, '松原市', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(185, '白城市', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(186, '延边', '0', 10, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(187, '哈尔滨市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(188, '齐齐哈尔市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(189, '鸡西市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(190, '鹤岗市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(191, '双鸭山市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(192, '大庆市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(193, '伊春市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(194, '佳木斯市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(195, '七台河市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(196, '牡丹江市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(197, '黑河市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(198, '绥化市', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(199, '大兴安岭地区', '0', 11, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(200, '南京市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(201, '无锡市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(202, '徐州市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(203, '常州市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(204, '苏州市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(205, '南通市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(206, '连云港市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(207, '淮安市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(208, '盐城市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(209, '扬州市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(210, '镇江市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(211, '泰州市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(212, '宿迁市', '0', 12, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(213, '杭州市', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(214, '宁波市', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(215, '温州市', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(216, '嘉兴市', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(217, '湖州市', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(218, '绍兴市', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(219, '金华市', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(220, '衢州市', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(221, '舟山市', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(222, '台州市', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(223, '丽水市', '0', 13, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(224, '合肥市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(225, '芜湖市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(226, '蚌埠市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(227, '淮南市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(228, '马鞍山市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(229, '淮北市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(230, '铜陵市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(231, '安庆市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(232, '黄山市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(233, '滁州市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(234, '阜阳市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(235, '宿州市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(236, '巢湖市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(237, '六安市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(238, '亳州市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(239, '池州市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(240, '宣城市', '0', 14, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(241, '福州市', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(242, '厦门市', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(243, '莆田市', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(244, '三明市', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(245, '泉州市', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(246, '漳州市', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(247, '南平市', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(248, '龙岩市', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(249, '宁德市', '0', 15, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(250, '南昌市', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(251, '景德镇市', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(252, '萍乡市', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(253, '九江市', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(254, '新余市', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(255, '鹰潭市', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(256, '赣州市', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(257, '吉安市', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(258, '宜春市', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(259, '抚州市', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(260, '上饶市', '0', 16, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(261, '济南市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(262, '青岛市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(263, '淄博市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(264, '枣庄市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(265, '东营市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(266, '烟台市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(267, '潍坊市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(268, '济宁市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(269, '泰安市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(270, '威海市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(271, '日照市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(272, '莱芜市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(273, '临沂市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(274, '德州市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(275, '聊城市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(276, '滨州市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(277, '荷泽市', '0', 17, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(278, '郑州市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(279, '开封市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(280, '洛阳市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(281, '平顶山市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(282, '安阳市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(283, '鹤壁市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(284, '新乡市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(285, '焦作市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(286, '濮阳市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(287, '许昌市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(288, '漯河市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(289, '三门峡市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(290, '南阳市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(291, '商丘市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(292, '信阳市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(293, '周口市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(294, '驻马店市', '0', 18, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(295, '武汉市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(296, '黄石市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(297, '十堰市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(298, '宜昌市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(299, '襄樊市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(300, '鄂州市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(301, '荆门市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(302, '孝感市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(303, '荆州市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(304, '黄冈市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(305, '咸宁市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(306, '随州市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(307, '恩施土家族苗族自治州', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(308, '仙桃市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(309, '潜江市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(310, '天门市', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(311, '神农架林区', '0', 19, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(312, '长沙市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(313, '株洲市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(314, '湘潭市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(315, '衡阳市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(316, '邵阳市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(317, '岳阳市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(318, '常德市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(319, '张家界市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(320, '益阳市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(321, '郴州市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(322, '永州市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(323, '怀化市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(324, '娄底市', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(325, '湘西土家族苗族自治州', '0', 20, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(326, '广州市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(327, '韶关市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(328, '深圳市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(329, '珠海市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(330, '汕头市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(331, '佛山市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(332, '江门市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(333, '湛江市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(334, '茂名市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(335, '肇庆市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(336, '惠州市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(337, '梅州市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(338, '汕尾市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(339, '河源市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(340, '阳江市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(341, '清远市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(342, '东莞市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(343, '中山市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(344, '潮州市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(345, '揭阳市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(346, '云浮市', '0', 21, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(347, '南宁市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(348, '柳州市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(349, '桂林市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(350, '梧州市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(351, '北海市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(352, '防城港市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(353, '钦州市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(354, '贵港市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(355, '玉林市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(356, '百色市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(357, '贺州市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(358, '河池市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(359, '来宾市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(360, '崇左市', '0', 22, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(361, '海口市', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(362, '三亚市', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(363, '五指山市', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(364, '琼海市', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(365, '儋州市', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(366, '文昌市', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(367, '万宁市', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(368, '东方市', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(369, '定安县', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(370, '屯昌县', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(371, '澄迈县', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(372, '临高县', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(373, '白沙黎族自治县', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(374, '昌江黎族自治县', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(375, '乐东黎族自治县', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(376, '陵水黎族自治县', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(377, '保亭黎族苗族自治县', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(378, '琼中黎族苗族自治县', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(379, '西沙群岛', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(380, '南沙群岛', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(381, '中沙群岛的岛礁及其海域', '0', 23, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(382, '成都市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(383, '自贡市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(384, '攀枝花市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(385, '泸州市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(386, '德阳市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(387, '绵阳市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(388, '广元市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(389, '遂宁市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(390, '内江市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(391, '乐山市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(392, '南充市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(393, '眉山市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(394, '宜宾市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(395, '广安市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(396, '达州市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(397, '雅安市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(398, '巴中市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(399, '资阳市', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(400, '阿坝州', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(401, '甘孜州', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(402, '凉山州', '0', 24, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(403, '贵阳市', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(404, '六盘水市', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(405, '遵义市', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(406, '安顺市', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(407, '铜仁地区', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(408, '黔西南州', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(409, '毕节地区', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(410, '黔东南州', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(411, '黔南州', '0', 25, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(412, '昆明市', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(413, '曲靖市', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(414, '玉溪市', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(415, '保山市', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(416, '昭通市', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(417, '丽江市', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(418, '思茅市', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(419, '临沧市', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(420, '楚雄州', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(421, '红河州', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(422, '文山州', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(423, '西双版纳', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(424, '大理', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(425, '德宏', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(426, '怒江', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(427, '迪庆', '0', 26, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(428, '拉萨市', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(429, '昌都', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(430, '山南', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(431, '日喀则', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(432, '那曲', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(433, '阿里', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(434, '林芝', '0', 27, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(435, '西安市', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(436, '铜川市', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(437, '宝鸡市', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(438, '咸阳市', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(439, '渭南市', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(440, '延安市', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(441, '汉中市', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(442, '榆林市', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(443, '安康市', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(444, '商洛市', '0', 28, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(445, '兰州市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(446, '嘉峪关市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(447, '金昌市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(448, '白银市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(449, '天水市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(450, '武威市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(451, '张掖市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(452, '平凉市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(453, '酒泉市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(454, '庆阳市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(455, '定西市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(456, '陇南市', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(457, '临夏州', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(458, '甘州', '0', 29, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(459, '西宁市', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(460, '海东地区', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(461, '海州', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(462, '黄南州', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(463, '海南州', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(464, '果洛州', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(465, '玉树州', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(466, '海西州', '0', 30, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(467, '银川市', '0', 31, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(468, '石嘴山市', '0', 31, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(469, '吴忠市', '0', 31, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(470, '固原市', '0', 31, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(471, '中卫市', '0', 31, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(472, '乌鲁木齐市', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(473, '克拉玛依市', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(474, '吐鲁番地区', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(475, '哈密地区', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(476, '昌吉州', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(477, '博尔州', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(478, '巴音郭楞州', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(479, '阿克苏地区', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(480, '克孜勒苏柯尔克孜自治州', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(481, '喀什地区', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(482, '和田地区', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(483, '伊犁州', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(484, '塔城地区', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(485, '阿勒泰地区', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(486, '石河子市', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(487, '阿拉尔市', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(488, '图木舒克市', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(489, '五家渠市', '0', 32, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(490, '台北市', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(491, '高雄市', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(492, '基隆市', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(493, '新竹市', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(494, '台中市', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(495, '嘉义市', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(496, '台南市', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(497, '台北县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(498, '桃园县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(499, '新竹县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(500, '苗栗县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(501, '台中县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(502, '彰化县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(503, '南投县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(504, '云林县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(505, '嘉义县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(506, '台南县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(507, '高雄县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(508, '屏东县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(509, '宜兰县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(510, '花莲县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(511, '台东县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(512, '澎湖县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(513, '金门县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(514, '连江县', '0', 33, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(515, '中西区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(516, '东区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(517, '南区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(518, '湾仔区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(519, '九龙城区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(520, '观塘区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(521, '深水埗区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(522, '黄大仙区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(523, '油尖旺区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(524, '离岛区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(525, '葵青区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(526, '北区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(527, '西贡区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(528, '沙田区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(529, '大埔区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(530, '荃湾区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(531, '屯门区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(532, '元朗区', '0', 34, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(533, '花地玛堂区', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(534, '市圣安多尼堂区', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(535, '大堂区', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(536, '望德堂区', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(537, '风顺堂区', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(538, '嘉模堂区', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(539, '圣方济各堂区', '0', 35, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(540, '长安区', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(541, '桥东区', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(542, '桥西区', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(543, '新华区', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(544, '井陉矿区', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(545, '裕华区', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(546, '井陉县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(547, '正定县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(548, '栾城县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(549, '行唐县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(550, '灵寿县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(551, '高邑县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(552, '深泽县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(553, '赞皇县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(554, '无极县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(555, '平山县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(556, '元氏县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(557, '赵县', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(558, '辛集市', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(559, '藁城市', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(560, '晋州市', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(561, '新乐市', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(562, '鹿泉市', '0', 130, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(563, '路南区', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(564, '路北区', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(565, '古冶区', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(566, '开平区', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(567, '丰南区', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(568, '丰润区', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(569, '滦县', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(570, '滦南县', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(571, '乐亭县', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(572, '迁西县', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(573, '玉田县', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(574, '唐海县', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(575, '遵化市', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(576, '迁安市', '0', 131, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(577, '海港区', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(578, '山海关区', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(579, '北戴河区', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(580, '青龙县', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(581, '昌黎县', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(582, '抚宁县', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(583, '卢龙县', '0', 132, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(584, '邯山区', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(585, '丛台区', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(586, '复兴区', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(587, '峰峰矿区', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(588, '邯郸县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(589, '临漳县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(590, '成安县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(591, '大名县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(592, '涉县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(593, '磁县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(594, '肥乡县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(595, '永年县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(596, '邱县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(597, '鸡泽县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(598, '广平县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(599, '馆陶县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(600, '魏县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(601, '曲周县', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(602, '武安市', '0', 133, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(603, '桥东区', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(604, '桥西区', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(605, '邢台县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(606, '临城县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(607, '内丘县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(608, '柏乡县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(609, '隆尧县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(610, '任县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(611, '南和县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(612, '宁晋县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(613, '巨鹿县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(614, '新河县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(615, '广宗县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(616, '平乡县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(617, '威县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(618, '清河县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(619, '临西县', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(620, '南宫市', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(621, '沙河市', '0', 134, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(622, '新市区', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(623, '北市区', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(624, '南市区', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(625, '满城县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(626, '清苑县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(627, '涞水县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(628, '阜平县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(629, '徐水县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(630, '定兴县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(631, '唐县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(632, '高阳县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(633, '容城县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(634, '涞源县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(635, '望都县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(636, '安新县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(637, '易县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(638, '曲阳县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(639, '蠡县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(640, '顺平县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(641, '博野县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(642, '雄县', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(643, '涿州市', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(644, '定州市', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(645, '安国市', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(646, '高碑店市', '0', 135, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(647, '桥东区', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(648, '桥西区', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(649, '宣化区', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(650, '下花园区', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(651, '宣化县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(652, '张北县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(653, '康保县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(654, '沽源县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(655, '尚义县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(656, '蔚县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(657, '阳原县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(658, '怀安县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(659, '万全县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(660, '怀来县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(661, '涿鹿县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(662, '赤城县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(663, '崇礼县', '0', 136, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(664, '双桥区', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(665, '双滦区', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(666, '鹰手营子矿区', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(667, '承德县', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(668, '兴隆县', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(669, '平泉县', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(670, '滦平县', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(671, '隆化县', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(672, '丰宁县', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(673, '宽城县', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(674, '围场县', '0', 137, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(675, '新华区', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(676, '运河区', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(677, '沧县', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(678, '青县', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(679, '东光县', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(680, '海兴县', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(681, '盐山县', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(682, '肃宁县', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(683, '南皮县', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(684, '吴桥县', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(685, '献县', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(686, '孟村县', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(687, '泊头市', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(688, '任丘市', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(689, '黄骅市', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(690, '河间市', '0', 138, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(691, '安次区', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(692, '广阳区', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(693, '固安县', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(694, '永清县', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(695, '香河县', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(696, '大城县', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(697, '文安县', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(698, '大厂县', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(699, '霸州市', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(700, '三河市', '0', 139, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(701, '桃城区', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(702, '枣强县', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(703, '武邑县', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(704, '武强县', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(705, '饶阳县', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(706, '安平县', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(707, '故城县', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(708, '景县', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(709, '阜城县', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(710, '冀州市', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(711, '深州市', '0', 140, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(712, '小店区', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(713, '迎泽区', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(714, '杏花岭区', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(715, '尖草坪区', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(716, '万柏林区', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(717, '晋源区', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(718, '清徐县', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(719, '阳曲县', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(720, '娄烦县', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(721, '古交市', '0', 141, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(722, '城区', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(723, '矿区', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(724, '南郊区', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(725, '新荣区', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(726, '阳高县', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(727, '天镇县', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(728, '广灵县', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(729, '灵丘县', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(730, '浑源县', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(731, '左云县', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(732, '大同县', '0', 142, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(733, '城区', '0', 143, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(734, '矿区', '0', 143, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(735, '郊区', '0', 143, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(736, '平定县', '0', 143, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(737, '盂县', '0', 143, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(738, '城区', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(739, '郊区', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(740, '长治县', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(741, '襄垣县', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(742, '屯留县', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(743, '平顺县', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(744, '黎城县', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(745, '壶关县', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(746, '长子县', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(747, '武乡县', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(748, '沁县', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(749, '沁源县', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(750, '潞城市', '0', 144, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(751, '城区', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(752, '沁水县', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(753, '阳城县', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(754, '陵川县', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(755, '泽州县', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(756, '高平市', '0', 145, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(757, '朔城区', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(758, '平鲁区', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(759, '山阴县', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(760, '应县', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(761, '右玉县', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(762, '怀仁县', '0', 146, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(763, '榆次区', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(764, '榆社县', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(765, '左权县', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(766, '和顺县', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(767, '昔阳县', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(768, '寿阳县', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(769, '太谷县', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(770, '祁县', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(771, '平遥县', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(772, '灵石县', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(773, '介休市', '0', 147, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(774, '盐湖区', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(775, '临猗县', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(776, '万荣县', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(777, '闻喜县', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(778, '稷山县', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(779, '新绛县', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(780, '绛县', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(781, '垣曲县', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(782, '夏县', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(783, '平陆县', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(784, '芮城县', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(785, '永济市', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(786, '河津市', '0', 148, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(787, '忻府区', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(788, '定襄县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(789, '五台县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(790, '代县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(791, '繁峙县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(792, '宁武县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(793, '静乐县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(794, '神池县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(795, '五寨县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(796, '岢岚县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(797, '河曲县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(798, '保德县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(799, '偏关县', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(800, '原平市', '0', 149, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(801, '尧都区', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(802, '曲沃县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(803, '翼城县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(804, '襄汾县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(805, '洪洞县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(806, '古县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(807, '安泽县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(808, '浮山县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(809, '吉县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(810, '乡宁县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(811, '大宁县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(812, '隰县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(813, '永和县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(814, '蒲县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(815, '汾西县', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(816, '侯马市', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(817, '霍州市', '0', 150, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(818, '离石区', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(819, '文水县', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(820, '交城县', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(821, '兴县', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(822, '临县', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(823, '柳林县', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(824, '石楼县', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(825, '岚县', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(826, '方山县', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(827, '中阳县', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(828, '交口县', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(829, '孝义市', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(830, '汾阳市', '0', 151, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(831, '新城区', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(832, '回民区', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(833, '玉泉区', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(834, '赛罕区', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(835, '土默特左旗', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(836, '托克托县', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(837, '和林格尔县', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(838, '清水河县', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(839, '武川县', '0', 152, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(840, '东河区', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(841, '昆都仑区', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(842, '青山区', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(843, '石拐区', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(844, '白云矿区', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(845, '九原区', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(846, '土默特右旗', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(847, '固阳县', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(848, '达尔罕茂明安联合旗', '0', 153, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(849, '海勃湾区', '0', 154, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(850, '海南区', '0', 154, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(851, '乌达区', '0', 154, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(852, '红山区', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(853, '元宝山区', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(854, '松山区', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(855, '阿鲁科尔沁旗', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(856, '巴林左旗', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(857, '巴林右旗', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(858, '林西县', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(859, '克什克腾旗', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(860, '翁牛特旗', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(861, '喀喇沁旗', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(862, '宁城县', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(863, '敖汉旗', '0', 155, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(864, '科尔沁区', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(865, '科尔沁左翼中旗', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(866, '科尔沁左翼后旗', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(867, '开鲁县', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(868, '库伦旗', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(869, '奈曼旗', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(870, '扎鲁特旗', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(871, '霍林郭勒市', '0', 156, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(872, '东胜区', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(873, '达拉特旗', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(874, '准格尔旗', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(875, '鄂托克前旗', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(876, '鄂托克旗', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(877, '杭锦旗', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(878, '乌审旗', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(879, '伊金霍洛旗', '0', 157, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(880, '海拉尔区', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(881, '阿荣旗', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(882, '莫力达瓦达斡尔族自治旗', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(883, '鄂伦春自治旗', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(884, '鄂温克族自治旗', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(885, '陈巴尔虎旗', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(886, '新巴尔虎左旗', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(887, '新巴尔虎右旗', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(888, '满洲里市', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(889, '牙克石市', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(890, '扎兰屯市', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(891, '额尔古纳市', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(892, '根河市', '0', 158, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(893, '临河区', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(894, '五原县', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(895, '磴口县', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(896, '乌拉特前旗', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(897, '乌拉特中旗', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(898, '乌拉特后旗', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(899, '杭锦后旗', '0', 159, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(900, '集宁区', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(901, '卓资县', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(902, '化德县', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(903, '商都县', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(904, '兴和县', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(905, '凉城县', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(906, '察哈尔右翼前旗', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(907, '察哈尔右翼中旗', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(908, '察哈尔右翼后旗', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(909, '四子王旗', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(910, '丰镇市', '0', 160, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(911, '乌兰浩特市', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(912, '阿尔山市', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(913, '科尔沁右翼前旗', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(914, '科尔沁右翼中旗', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(915, '扎赉特旗', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(916, '突泉县', '0', 161, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(917, '二连浩特市', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(918, '锡林浩特市', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(919, '阿巴嘎旗', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(920, '苏尼特左旗', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(921, '苏尼特右旗', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(922, '东乌珠穆沁旗', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(923, '西乌珠穆沁旗', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(924, '太仆寺旗', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(925, '镶黄旗', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(926, '正镶白旗', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(927, '正蓝旗', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(928, '多伦县', '0', 162, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(929, '阿拉善左旗', '0', 163, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(930, '阿拉善右旗', '0', 163, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(931, '额济纳旗', '0', 163, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(932, '和平区', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(933, '沈河区', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(934, '大东区', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(935, '皇姑区', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(936, '铁西区', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(937, '苏家屯区', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(938, '东陵区', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(939, '新城子区', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(940, '于洪区', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(941, '辽中县', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(942, '康平县', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(943, '法库县', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(944, '新民市', '0', 164, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(945, '中山区', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(946, '西岗区', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(947, '沙河口区', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(948, '甘井子区', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(949, '旅顺口区', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(950, '金州区', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(951, '长海县', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(952, '瓦房店市', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(953, '普兰店市', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(954, '庄河市', '0', 165, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(955, '铁东区', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(956, '铁西区', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(957, '立山区', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(958, '千山区', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(959, '台安县', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(960, '岫岩满族自治县', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(961, '海城市', '0', 166, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(962, '新抚区', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(963, '东洲区', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(964, '望花区', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(965, '顺城区', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(966, '抚顺县', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(967, '新宾满族自治县', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(968, '清原满族自治县', '0', 167, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(969, '平山区', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(970, '溪湖区', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(971, '明山区', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(972, '南芬区', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(973, '本溪满族自治县', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(974, '桓仁满族自治县', '0', 168, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(975, '元宝区', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(976, '振兴区', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(977, '振安区', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(978, '宽甸满族自治县', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(979, '东港市', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(980, '凤城市', '0', 169, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(981, '古塔区', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(982, '凌河区', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(983, '太和区', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(984, '黑山县', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(985, '义县', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(986, '凌海市', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(987, '北镇市', '0', 170, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(988, '站前区', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(989, '西市区', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(990, '鲅鱼圈区', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(991, '老边区', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(992, '盖州市', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(993, '大石桥市', '0', 171, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(994, '海州区', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(995, '新邱区', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(996, '太平区', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(997, '清河门区', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(998, '细河区', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(999, '阜新蒙古族自治县', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1000, '彰武县', '0', 172, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1001, '白塔区', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1002, '文圣区', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1003, '宏伟区', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1004, '弓长岭区', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1005, '太子河区', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1006, '辽阳县', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1007, '灯塔市', '0', 173, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1008, '双台子区', '0', 174, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1009, '兴隆台区', '0', 174, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1010, '大洼县', '0', 174, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1011, '盘山县', '0', 174, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1012, '银州区', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1013, '清河区', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1014, '铁岭县', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1015, '西丰县', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1016, '昌图县', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1017, '调兵山市', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1018, '开原市', '0', 175, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1019, '双塔区', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1020, '龙城区', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1021, '朝阳县', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1022, '建平县', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1023, '喀喇沁左翼蒙古族自治县', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1024, '北票市', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1025, '凌源市', '0', 176, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1026, '连山区', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1027, '龙港区', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1028, '南票区', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1029, '绥中县', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1030, '建昌县', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1031, '兴城市', '0', 177, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1032, '南关区', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1033, '宽城区', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1034, '朝阳区', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1035, '二道区', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1036, '绿园区', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1037, '双阳区', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1038, '农安县', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1039, '九台市', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1040, '榆树市', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1041, '德惠市', '0', 178, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1042, '昌邑区', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1043, '龙潭区', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1044, '船营区', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1045, '丰满区', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1046, '永吉县', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1047, '蛟河市', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1048, '桦甸市', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1049, '舒兰市', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1050, '磐石市', '0', 179, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1051, '铁西区', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1052, '铁东区', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1053, '梨树县', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1054, '伊通满族自治县', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1055, '公主岭市', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1056, '双辽市', '0', 180, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1057, '龙山区', '0', 181, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1058, '西安区', '0', 181, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1059, '东丰县', '0', 181, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1060, '东辽县', '0', 181, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1061, '东昌区', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1062, '二道江区', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1063, '通化县', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1064, '辉南县', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1065, '柳河县', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1066, '梅河口市', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1067, '集安市', '0', 182, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1068, '八道江区', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1069, '抚松县', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1070, '靖宇县', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1071, '长白朝鲜族自治县', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1072, '江源县', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1073, '临江市', '0', 183, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1074, '宁江区', '0', 184, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1075, '前郭尔罗斯蒙古族自治县', '0', 184, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1076, '长岭县', '0', 184, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1077, '乾安县', '0', 184, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1078, '扶余县', '0', 184, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1079, '洮北区', '0', 185, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1080, '镇赉县', '0', 185, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1081, '通榆县', '0', 185, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1082, '洮南市', '0', 185, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1083, '大安市', '0', 185, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1084, '延吉市', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1085, '图们市', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1086, '敦化市', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1087, '珲春市', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1088, '龙井市', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1089, '和龙市', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1090, '汪清县', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1091, '安图县', '0', 186, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1092, '道里区', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1093, '南岗区', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1094, '道外区', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1095, '香坊区', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1096, '动力区', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1097, '平房区', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1098, '松北区', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1099, '呼兰区', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1100, '依兰县', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1101, '方正县', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1102, '宾县', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1103, '巴彦县', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1104, '木兰县', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1105, '通河县', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1106, '延寿县', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1107, '阿城市', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1108, '双城市', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1109, '尚志市', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1110, '五常市', '0', 187, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1111, '龙沙区', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1112, '建华区', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1113, '铁锋区', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1114, '昂昂溪区', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1115, '富拉尔基区', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1116, '碾子山区', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1117, '梅里斯达斡尔族区', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1118, '龙江县', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1119, '依安县', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1120, '泰来县', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1121, '甘南县', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1122, '富裕县', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1123, '克山县', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1124, '克东县', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1125, '拜泉县', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1126, '讷河市', '0', 188, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1127, '鸡冠区', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1128, '恒山区', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1129, '滴道区', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1130, '梨树区', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1131, '城子河区', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1132, '麻山区', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1133, '鸡东县', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1134, '虎林市', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1135, '密山市', '0', 189, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1136, '向阳区', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1137, '工农区', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1138, '南山区', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1139, '兴安区', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1140, '东山区', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1141, '兴山区', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1142, '萝北县', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1143, '绥滨县', '0', 190, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1144, '尖山区', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1145, '岭东区', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1146, '四方台区', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1147, '宝山区', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1148, '集贤县', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1149, '友谊县', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1150, '宝清县', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1151, '饶河县', '0', 191, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1152, '萨尔图区', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1153, '龙凤区', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1154, '让胡路区', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1155, '红岗区', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1156, '大同区', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1157, '肇州县', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1158, '肇源县', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1159, '林甸县', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1160, '杜尔伯特蒙古族自治县', '0', 192, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1161, '伊春区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1162, '南岔区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1163, '友好区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1164, '西林区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1165, '翠峦区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1166, '新青区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1167, '美溪区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1168, '金山屯区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1169, '五营区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1170, '乌马河区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1171, '汤旺河区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1172, '带岭区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1173, '乌伊岭区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1174, '红星区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1175, '上甘岭区', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1176, '嘉荫县', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1177, '铁力市', '0', 193, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1178, '永红区', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1179, '向阳区', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1180, '前进区', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1181, '东风区', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1182, '郊区', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1183, '桦南县', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1184, '桦川县', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1185, '汤原县', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1186, '抚远县', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1187, '同江市', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1188, '富锦市', '0', 194, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1189, '新兴区', '0', 195, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1190, '桃山区', '0', 195, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1191, '茄子河区', '0', 195, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1192, '勃利县', '0', 195, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1193, '东安区', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1194, '阳明区', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1195, '爱民区', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1196, '西安区', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1197, '东宁县', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1198, '林口县', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1199, '绥芬河市', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1200, '海林市', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1201, '宁安市', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1202, '穆棱市', '0', 196, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1203, '爱辉区', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1204, '嫩江县', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1205, '逊克县', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1206, '孙吴县', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1207, '北安市', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1208, '五大连池市', '0', 197, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1209, '北林区', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1210, '望奎县', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1211, '兰西县', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1212, '青冈县', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1213, '庆安县', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1214, '明水县', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1215, '绥棱县', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1216, '安达市', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1217, '肇东市', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1218, '海伦市', '0', 198, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1219, '呼玛县', '0', 199, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1220, '塔河县', '0', 199, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1221, '漠河县', '0', 199, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1222, '玄武区', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1223, '白下区', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1224, '秦淮区', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1225, '建邺区', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1226, '鼓楼区', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1227, '下关区', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1228, '浦口区', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1229, '栖霞区', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1230, '雨花台区', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1231, '江宁区', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1232, '六合区', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1233, '溧水县', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1234, '高淳县', '0', 200, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1235, '崇安区', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1236, '南长区', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1237, '北塘区', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1238, '锡山区', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1239, '惠山区', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1240, '滨湖区', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1241, '江阴市', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1242, '宜兴市', '0', 201, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1243, '鼓楼区', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1244, '云龙区', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1245, '九里区', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1246, '贾汪区', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1247, '泉山区', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1248, '丰县', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1249, '沛县', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1250, '铜山县', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1251, '睢宁县', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1252, '新沂市', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1253, '邳州市', '0', 202, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1254, '天宁区', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1255, '钟楼区', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1256, '戚墅堰区', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1257, '新北区', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1258, '武进区', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1259, '溧阳市', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1260, '金坛市', '0', 203, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1261, '沧浪区', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1262, '平江区', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1263, '金阊区', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1264, '虎丘区', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1265, '吴中区', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1266, '相城区', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1267, '常熟市', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1268, '张家港市', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1269, '昆山市', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1270, '吴江市', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1271, '太仓市', '0', 204, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1272, '崇川区', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1273, '港闸区', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1274, '海安县', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1275, '如东县', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1276, '启东市', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1277, '如皋市', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1278, '通州市', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1279, '海门市', '0', 205, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1280, '连云区', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1281, '新浦区', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1282, '海州区', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1283, '赣榆县', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1284, '东海县', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1285, '灌云县', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1286, '灌南县', '0', 206, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1287, '清河区', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1288, '楚州区', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1289, '淮阴区', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1290, '清浦区', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1291, '涟水县', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1292, '洪泽县', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1293, '盱眙县', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1294, '金湖县', '0', 207, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1295, '亭湖区', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1296, '盐都区', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1297, '响水县', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1298, '滨海县', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1299, '阜宁县', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1300, '射阳县', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1301, '建湖县', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1302, '东台市', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1303, '大丰市', '0', 208, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1304, '广陵区', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1305, '邗江区', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1306, '维扬区', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1307, '宝应县', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1308, '仪征市', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1309, '高邮市', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1310, '江都市', '0', 209, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1311, '京口区', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1312, '润州区', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1313, '丹徒区', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1314, '丹阳市', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1315, '扬中市', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1316, '句容市', '0', 210, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1317, '海陵区', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1318, '高港区', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1319, '兴化市', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1320, '靖江市', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1321, '泰兴市', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1322, '姜堰市', '0', 211, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1323, '宿城区', '0', 212, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1324, '宿豫区', '0', 212, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1325, '沭阳县', '0', 212, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1326, '泗阳县', '0', 212, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1327, '泗洪县', '0', 212, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1328, '上城区', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1329, '下城区', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1330, '江干区', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1331, '拱墅区', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1332, '西湖区', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1333, '滨江区', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1334, '萧山区', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1335, '余杭区', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1336, '桐庐县', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1337, '淳安县', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1338, '建德市', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1339, '富阳市', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1340, '临安市', '0', 213, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1341, '海曙区', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1342, '江东区', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1343, '江北区', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1344, '北仑区', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1345, '镇海区', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1346, '鄞州区', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1347, '象山县', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1348, '宁海县', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1349, '余姚市', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1350, '慈溪市', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1351, '奉化市', '0', 214, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1352, '鹿城区', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1353, '龙湾区', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1354, '瓯海区', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1355, '洞头县', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1356, '永嘉县', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1357, '平阳县', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1358, '苍南县', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1359, '文成县', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1360, '泰顺县', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1361, '瑞安市', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1362, '乐清市', '0', 215, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1363, '秀城区', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1364, '秀洲区', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1365, '嘉善县', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1366, '海盐县', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1367, '海宁市', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1368, '平湖市', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1369, '桐乡市', '0', 216, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1370, '吴兴区', '0', 217, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1371, '南浔区', '0', 217, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1372, '德清县', '0', 217, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1373, '长兴县', '0', 217, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1374, '安吉县', '0', 217, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1375, '越城区', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1376, '绍兴县', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1377, '新昌县', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1378, '诸暨市', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1379, '上虞市', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1380, '嵊州市', '0', 218, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1381, '婺城区', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1382, '金东区', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1383, '武义县', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1384, '浦江县', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1385, '磐安县', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1386, '兰溪市', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1387, '义乌市', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1388, '东阳市', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1389, '永康市', '0', 219, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1390, '柯城区', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1391, '衢江区', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1392, '常山县', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1393, '开化县', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1394, '龙游县', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1395, '江山市', '0', 220, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1396, '定海区', '0', 221, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1397, '普陀区', '0', 221, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1398, '岱山县', '0', 221, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1399, '嵊泗县', '0', 221, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1400, '椒江区', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1401, '黄岩区', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1402, '路桥区', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1403, '玉环县', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1404, '三门县', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1405, '天台县', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1406, '仙居县', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1407, '温岭市', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1408, '临海市', '0', 222, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1409, '莲都区', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1410, '青田县', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1411, '缙云县', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1412, '遂昌县', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1413, '松阳县', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1414, '云和县', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1415, '庆元县', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1416, '景宁畲族自治县', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1417, '龙泉市', '0', 223, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1418, '瑶海区', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1419, '庐阳区', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1420, '蜀山区', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1421, '包河区', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1422, '长丰县', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1423, '肥东县', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1424, '肥西县', '0', 224, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1425, '镜湖区', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1426, '弋江区', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1427, '鸠江区', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1428, '三山区', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1429, '芜湖县', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1430, '繁昌县', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1431, '南陵县', '0', 225, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1432, '龙子湖区', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1433, '蚌山区', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1434, '禹会区', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1435, '淮上区', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1436, '怀远县', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1437, '五河县', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1438, '固镇县', '0', 226, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1439, '大通区', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1440, '田家庵区', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1441, '谢家集区', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1442, '八公山区', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1443, '潘集区', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1444, '凤台县', '0', 227, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1445, '金家庄区', '0', 228, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1446, '花山区', '0', 228, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1447, '雨山区', '0', 228, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1448, '当涂县', '0', 228, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1449, '杜集区', '0', 229, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1450, '相山区', '0', 229, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1451, '烈山区', '0', 229, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1452, '濉溪县', '0', 229, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1453, '铜官山区', '0', 230, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1454, '狮子山区', '0', 230, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1455, '郊区', '0', 230, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1456, '铜陵县', '0', 230, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1457, '迎江区', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1458, '大观区', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1459, '宜秀区', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1460, '怀宁县', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1461, '枞阳县', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1462, '潜山县', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1463, '太湖县', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1464, '宿松县', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1465, '望江县', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1466, '岳西县', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1467, '桐城市', '0', 231, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1468, '屯溪区', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1469, '黄山区', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1470, '徽州区', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1471, '歙县', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1472, '休宁县', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1473, '黟县', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1474, '祁门县', '0', 232, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1475, '琅琊区', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1476, '南谯区', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1477, '来安县', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1478, '全椒县', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1479, '定远县', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1480, '凤阳县', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1481, '天长市', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1482, '明光市', '0', 233, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1483, '颍州区', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1484, '颍东区', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1485, '颍泉区', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1486, '临泉县', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1487, '太和县', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1488, '阜南县', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1489, '颍上县', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1490, '界首市', '0', 234, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1491, '埇桥区', '0', 235, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1492, '砀山县', '0', 235, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1493, '萧县', '0', 235, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1494, '灵璧县', '0', 235, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1495, '泗县', '0', 235, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1496, '居巢区', '0', 236, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1497, '庐江县', '0', 236, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1498, '无为县', '0', 236, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1499, '含山县', '0', 236, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1500, '和县', '0', 236, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1501, '金安区', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1502, '裕安区', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1503, '寿县', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1504, '霍邱县', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1505, '舒城县', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1506, '金寨县', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1507, '霍山县', '0', 237, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1508, '谯城区', '0', 238, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1509, '涡阳县', '0', 238, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1510, '蒙城县', '0', 238, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1511, '利辛县', '0', 238, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1512, '贵池区', '0', 239, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1513, '东至县', '0', 239, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1514, '石台县', '0', 239, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1515, '青阳县', '0', 239, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1516, '宣州区', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1517, '郎溪县', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1518, '广德县', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1519, '泾县', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1520, '绩溪县', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1521, '旌德县', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1522, '宁国市', '0', 240, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1523, '鼓楼区', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1524, '台江区', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1525, '仓山区', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1526, '马尾区', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1527, '晋安区', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1528, '闽侯县', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1529, '连江县', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1530, '罗源县', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1531, '闽清县', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1532, '永泰县', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1533, '平潭县', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1534, '福清市', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1535, '长乐市', '0', 241, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1536, '思明区', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1537, '海沧区', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1538, '湖里区', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1539, '集美区', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1540, '同安区', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1541, '翔安区', '0', 242, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1542, '城厢区', '0', 243, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1543, '涵江区', '0', 243, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1544, '荔城区', '0', 243, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1545, '秀屿区', '0', 243, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1546, '仙游县', '0', 243, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1547, '梅列区', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1548, '三元区', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1549, '明溪县', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1550, '清流县', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1551, '宁化县', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1552, '大田县', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1553, '尤溪县', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1554, '沙县', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1555, '将乐县', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1556, '泰宁县', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1557, '建宁县', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1558, '永安市', '0', 244, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1559, '鲤城区', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1560, '丰泽区', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1561, '洛江区', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1562, '泉港区', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1563, '惠安县', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1564, '安溪县', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1565, '永春县', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1566, '德化县', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1567, '金门县', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1568, '石狮市', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1569, '晋江市', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1570, '南安市', '0', 245, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1571, '芗城区', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1572, '龙文区', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1573, '云霄县', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1574, '漳浦县', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1575, '诏安县', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1576, '长泰县', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1577, '东山县', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1578, '南靖县', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1579, '平和县', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1580, '华安县', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1581, '龙海市', '0', 246, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1582, '延平区', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1583, '顺昌县', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1584, '浦城县', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1585, '光泽县', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1586, '松溪县', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1587, '政和县', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1588, '邵武市', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1589, '武夷山市', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1590, '建瓯市', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1591, '建阳市', '0', 247, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1592, '新罗区', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1593, '长汀县', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1594, '永定县', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1595, '上杭县', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1596, '武平县', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1597, '连城县', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1598, '漳平市', '0', 248, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1599, '蕉城区', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1600, '霞浦县', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1601, '古田县', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1602, '屏南县', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1603, '寿宁县', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1604, '周宁县', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1605, '柘荣县', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1606, '福安市', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1607, '福鼎市', '0', 249, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1608, '东湖区', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1609, '西湖区', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1610, '青云谱区', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1611, '湾里区', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1612, '青山湖区', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1613, '南昌县', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1614, '新建县', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1615, '安义县', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1616, '进贤县', '0', 250, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1617, '昌江区', '0', 251, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1618, '珠山区', '0', 251, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1619, '浮梁县', '0', 251, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1620, '乐平市', '0', 251, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1621, '安源区', '0', 252, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1622, '湘东区', '0', 252, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1623, '莲花县', '0', 252, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1624, '上栗县', '0', 252, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1625, '芦溪县', '0', 252, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1626, '庐山区', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1627, '浔阳区', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1628, '九江县', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1629, '武宁县', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1630, '修水县', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1631, '永修县', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1632, '德安县', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1633, '星子县', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1634, '都昌县', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1635, '湖口县', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1636, '彭泽县', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1637, '瑞昌市', '0', 253, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1638, '渝水区', '0', 254, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1639, '分宜县', '0', 254, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1640, '月湖区', '0', 255, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1641, '余江县', '0', 255, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1642, '贵溪市', '0', 255, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1643, '章贡区', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1644, '赣县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1645, '信丰县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1646, '大余县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1647, '上犹县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1648, '崇义县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1649, '安远县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1650, '龙南县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1651, '定南县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1652, '全南县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1653, '宁都县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1654, '于都县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1655, '兴国县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1656, '会昌县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1657, '寻乌县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1658, '石城县', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1659, '瑞金市', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1660, '南康市', '0', 256, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1661, '吉州区', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1662, '青原区', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1663, '吉安县', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1664, '吉水县', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1665, '峡江县', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1666, '新干县', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1667, '永丰县', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1668, '泰和县', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1669, '遂川县', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1670, '万安县', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1671, '安福县', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1672, '永新县', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1673, '井冈山市', '0', 257, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1674, '袁州区', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1675, '奉新县', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1676, '万载县', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1677, '上高县', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1678, '宜丰县', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1679, '靖安县', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1680, '铜鼓县', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1681, '丰城市', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1682, '樟树市', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1683, '高安市', '0', 258, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1684, '临川区', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1685, '南城县', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1686, '黎川县', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1687, '南丰县', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1688, '崇仁县', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1689, '乐安县', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1690, '宜黄县', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1691, '金溪县', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1692, '资溪县', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1693, '东乡县', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1694, '广昌县', '0', 259, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1695, '信州区', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1696, '上饶县', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1697, '广丰县', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1698, '玉山县', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1699, '铅山县', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1700, '横峰县', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1701, '弋阳县', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1702, '余干县', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1703, '鄱阳县', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1704, '万年县', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1705, '婺源县', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1706, '德兴市', '0', 260, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1707, '历下区', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1708, '市中区', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1709, '槐荫区', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1710, '天桥区', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1711, '历城区', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1712, '长清区', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1713, '平阴县', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1714, '济阳县', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1715, '商河县', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1716, '章丘市', '0', 261, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1717, '市南区', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1718, '市北区', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1719, '四方区', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1720, '黄岛区', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1721, '崂山区', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1722, '李沧区', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1723, '城阳区', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1724, '胶州市', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1725, '即墨市', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1726, '平度市', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1727, '胶南市', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1728, '莱西市', '0', 262, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1729, '淄川区', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1730, '张店区', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1731, '博山区', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1732, '临淄区', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1733, '周村区', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1734, '桓台县', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1735, '高青县', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1736, '沂源县', '0', 263, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1737, '市中区', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1738, '薛城区', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1739, '峄城区', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1740, '台儿庄区', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1741, '山亭区', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1742, '滕州市', '0', 264, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1743, '东营区', '0', 265, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1744, '河口区', '0', 265, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1745, '垦利县', '0', 265, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1746, '利津县', '0', 265, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1747, '广饶县', '0', 265, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1748, '芝罘区', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1749, '福山区', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1750, '牟平区', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1751, '莱山区', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1752, '长岛县', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1753, '龙口市', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1754, '莱阳市', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1755, '莱州市', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1756, '蓬莱市', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1757, '招远市', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1758, '栖霞市', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1759, '海阳市', '0', 266, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1760, '潍城区', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1761, '寒亭区', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1762, '坊子区', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1763, '奎文区', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1764, '临朐县', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1765, '昌乐县', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1766, '青州市', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1767, '诸城市', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1768, '寿光市', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1769, '安丘市', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1770, '高密市', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1771, '昌邑市', '0', 267, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1772, '市中区', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1773, '任城区', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1774, '微山县', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1775, '鱼台县', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1776, '金乡县', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1777, '嘉祥县', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1778, '汶上县', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1779, '泗水县', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1780, '梁山县', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1781, '曲阜市', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1782, '兖州市', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1783, '邹城市', '0', 268, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1784, '泰山区', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1785, '岱岳区', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1786, '宁阳县', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1787, '东平县', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1788, '新泰市', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1789, '肥城市', '0', 269, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1790, '环翠区', '0', 270, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1791, '文登市', '0', 270, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1792, '荣成市', '0', 270, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1793, '乳山市', '0', 270, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1794, '东港区', '0', 271, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1795, '岚山区', '0', 271, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1796, '五莲县', '0', 271, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1797, '莒县', '0', 271, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1798, '莱城区', '0', 272, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1799, '钢城区', '0', 272, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1800, '兰山区', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1801, '罗庄区', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1802, '河东区', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1803, '沂南县', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1804, '郯城县', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1805, '沂水县', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1806, '苍山县', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1807, '费县', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1808, '平邑县', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1809, '莒南县', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1810, '蒙阴县', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1811, '临沭县', '0', 273, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1812, '德城区', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1813, '陵县', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1814, '宁津县', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1815, '庆云县', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1816, '临邑县', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1817, '齐河县', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1818, '平原县', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1819, '夏津县', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1820, '武城县', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1821, '乐陵市', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1822, '禹城市', '0', 274, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1823, '东昌府区', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1824, '阳谷县', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1825, '莘县', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1826, '茌平县', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1827, '东阿县', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1828, '冠县', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1829, '高唐县', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1830, '临清市', '0', 275, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1831, '滨城区', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1832, '惠民县', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1833, '阳信县', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1834, '无棣县', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1835, '沾化县', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1836, '博兴县', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1837, '邹平县', '0', 276, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1838, '牡丹区', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1839, '曹县', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1840, '单县', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1841, '成武县', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1842, '巨野县', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1843, '郓城县', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1844, '鄄城县', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1845, '定陶县', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1846, '东明县', '0', 277, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1847, '中原区', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1848, '二七区', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1849, '管城回族区', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1850, '金水区', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1851, '上街区', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1852, '惠济区', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1853, '中牟县', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1854, '巩义市', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1855, '荥阳市', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1856, '新密市', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1857, '新郑市', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1858, '登封市', '0', 278, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1859, '龙亭区', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1860, '顺河回族区', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1861, '鼓楼区', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1862, '禹王台区', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1863, '金明区', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1864, '杞县', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1865, '通许县', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1866, '尉氏县', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1867, '开封县', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1868, '兰考县', '0', 279, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1869, '老城区', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1870, '西工区', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1871, '廛河回族区', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1872, '涧西区', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1873, '吉利区', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1874, '洛龙区', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1875, '孟津县', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1876, '新安县', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1877, '栾川县', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1878, '嵩县', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1879, '汝阳县', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1880, '宜阳县', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1881, '洛宁县', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1882, '伊川县', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1883, '偃师市', '0', 280, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1884, '新华区', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1885, '卫东区', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1886, '石龙区', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1887, '湛河区', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1888, '宝丰县', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1889, '叶县', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1890, '鲁山县', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1891, '郏县', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1892, '舞钢市', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1893, '汝州市', '0', 281, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1894, '文峰区', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1895, '北关区', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1896, '殷都区', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1897, '龙安区', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1898, '安阳县', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1899, '汤阴县', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1900, '滑县', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1901, '内黄县', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1902, '林州市', '0', 282, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1903, '鹤山区', '0', 283, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1904, '山城区', '0', 283, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1905, '淇滨区', '0', 283, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1906, '浚县', '0', 283, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1907, '淇县', '0', 283, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1908, '红旗区', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1909, '卫滨区', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1910, '凤泉区', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1911, '牧野区', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1912, '新乡县', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1913, '获嘉县', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1914, '原阳县', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1915, '延津县', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1916, '封丘县', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1917, '长垣县', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1918, '卫辉市', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1919, '辉县市', '0', 284, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1920, '解放区', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1921, '中站区', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1922, '马村区', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1923, '山阳区', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1924, '修武县', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1925, '博爱县', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1926, '武陟县', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1927, '温县', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1928, '济源市', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1929, '沁阳市', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1930, '孟州市', '0', 285, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1931, '华龙区', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1932, '清丰县', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1933, '南乐县', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1934, '范县', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1935, '台前县', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1936, '濮阳县', '0', 286, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1937, '魏都区', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1938, '许昌县', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1939, '鄢陵县', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1940, '襄城县', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1941, '禹州市', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1942, '长葛市', '0', 287, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1943, '源汇区', '0', 288, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1944, '郾城区', '0', 288, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1945, '召陵区', '0', 288, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1946, '舞阳县', '0', 288, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1947, '临颍县', '0', 288, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1948, '湖滨区', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1949, '渑池县', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1950, '陕县', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1951, '卢氏县', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1952, '义马市', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1953, '灵宝市', '0', 289, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1954, '宛城区', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1955, '卧龙区', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1956, '南召县', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1957, '方城县', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1958, '西峡县', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1959, '镇平县', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1960, '内乡县', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1961, '淅川县', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1962, '社旗县', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1963, '唐河县', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1964, '新野县', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1965, '桐柏县', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1966, '邓州市', '0', 290, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1967, '梁园区', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1968, '睢阳区', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1969, '民权县', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1970, '睢县', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1971, '宁陵县', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1972, '柘城县', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1973, '虞城县', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1974, '夏邑县', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1975, '永城市', '0', 291, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1976, '浉河区', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1977, '平桥区', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1978, '罗山县', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1979, '光山县', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1980, '新县', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1981, '商城县', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1982, '固始县', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1983, '潢川县', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1984, '淮滨县', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1985, '息县', '0', 292, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1986, '川汇区', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1987, '扶沟县', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1988, '西华县', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1989, '商水县', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1990, '沈丘县', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1991, '郸城县', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1992, '淮阳县', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1993, '太康县', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1994, '鹿邑县', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1995, '项城市', '0', 293, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1996, '驿城区', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1997, '西平县', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1998, '上蔡县', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(1999, '平舆县', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2000, '正阳县', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2001, '确山县', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2002, '泌阳县', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2003, '汝南县', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2004, '遂平县', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2005, '新蔡县', '0', 294, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2006, '江岸区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2007, '江汉区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2008, '硚口区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2009, '汉阳区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2010, '武昌区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2011, '青山区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2012, '洪山区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2013, '东西湖区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2014, '汉南区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2015, '蔡甸区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2016, '江夏区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2017, '黄陂区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2018, '新洲区', '0', 295, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2019, '黄石港区', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2020, '西塞山区', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2021, '下陆区', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2022, '铁山区', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2023, '阳新县', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2024, '大冶市', '0', 296, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2025, '茅箭区', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2026, '张湾区', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2027, '郧县', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2028, '郧西县', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2029, '竹山县', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2030, '竹溪县', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2031, '房县', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2032, '丹江口市', '0', 297, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2033, '西陵区', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2034, '伍家岗区', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2035, '点军区', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2036, '猇亭区', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2037, '夷陵区', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2038, '远安县', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2039, '兴山县', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2040, '秭归县', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2041, '长阳土家族自治县', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2042, '五峰土家族自治县', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2043, '宜都市', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2044, '当阳市', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2045, '枝江市', '0', 298, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2046, '襄城区', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2047, '樊城区', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2048, '襄阳区', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2049, '南漳县', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2050, '谷城县', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2051, '保康县', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2052, '老河口市', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2053, '枣阳市', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2054, '宜城市', '0', 299, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2055, '梁子湖区', '0', 300, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2056, '华容区', '0', 300, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2057, '鄂城区', '0', 300, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2058, '东宝区', '0', 301, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2059, '掇刀区', '0', 301, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2060, '京山县', '0', 301, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2061, '沙洋县', '0', 301, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2062, '钟祥市', '0', 301, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2063, '孝南区', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2064, '孝昌县', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2065, '大悟县', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2066, '云梦县', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2067, '应城市', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2068, '安陆市', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2069, '汉川市', '0', 302, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2070, '沙市区', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2071, '荆州区', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2072, '公安县', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2073, '监利县', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2074, '江陵县', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2075, '石首市', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2076, '洪湖市', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2077, '松滋市', '0', 303, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2078, '黄州区', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2079, '团风县', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2080, '红安县', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2081, '罗田县', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2082, '英山县', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2083, '浠水县', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2084, '蕲春县', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2085, '黄梅县', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2086, '麻城市', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2087, '武穴市', '0', 304, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2088, '咸安区', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2089, '嘉鱼县', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2090, '通城县', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2091, '崇阳县', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2092, '通山县', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2093, '赤壁市', '0', 305, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2094, '曾都区', '0', 306, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2095, '广水市', '0', 306, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2096, '恩施市', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2097, '利川市', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2098, '建始县', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2099, '巴东县', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2100, '宣恩县', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2101, '咸丰县', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2102, '来凤县', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2103, '鹤峰县', '0', 307, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2104, '芙蓉区', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2105, '天心区', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2106, '岳麓区', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2107, '开福区', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2108, '雨花区', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2109, '长沙县', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2110, '望城县', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2111, '宁乡县', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2112, '浏阳市', '0', 312, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2113, '荷塘区', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2114, '芦淞区', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2115, '石峰区', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2116, '天元区', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2117, '株洲县', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2118, '攸县', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2119, '茶陵县', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2120, '炎陵县', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2121, '醴陵市', '0', 313, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2122, '雨湖区', '0', 314, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2123, '岳塘区', '0', 314, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2124, '湘潭县', '0', 314, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2125, '湘乡市', '0', 314, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2126, '韶山市', '0', 314, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2127, '珠晖区', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2128, '雁峰区', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2129, '石鼓区', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2130, '蒸湘区', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2131, '南岳区', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2132, '衡阳县', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2133, '衡南县', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2134, '衡山县', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2135, '衡东县', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2136, '祁东县', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2137, '耒阳市', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2138, '常宁市', '0', 315, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2139, '双清区', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2140, '大祥区', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2141, '北塔区', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2142, '邵东县', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2143, '新邵县', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2144, '邵阳县', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2145, '隆回县', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2146, '洞口县', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2147, '绥宁县', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2148, '新宁县', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2149, '城步苗族自治县', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2150, '武冈市', '0', 316, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2151, '岳阳楼区', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2152, '云溪区', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2153, '君山区', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2154, '岳阳县', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2155, '华容县', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2156, '湘阴县', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2157, '平江县', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2158, '汨罗市', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2159, '临湘市', '0', 317, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2160, '武陵区', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2161, '鼎城区', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2162, '安乡县', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2163, '汉寿县', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2164, '澧县', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2165, '临澧县', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2166, '桃源县', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2167, '石门县', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2168, '津市市', '0', 318, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2169, '永定区', '0', 319, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2170, '武陵源区', '0', 319, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2171, '慈利县', '0', 319, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2172, '桑植县', '0', 319, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2173, '资阳区', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2174, '赫山区', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2175, '南县', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2176, '桃江县', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2177, '安化县', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2178, '沅江市', '0', 320, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2179, '北湖区', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2180, '苏仙区', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2181, '桂阳县', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2182, '宜章县', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2183, '永兴县', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2184, '嘉禾县', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2185, '临武县', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2186, '汝城县', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2187, '桂东县', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2188, '安仁县', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2189, '资兴市', '0', 321, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2190, '零陵区', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2191, '冷水滩区', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2192, '祁阳县', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2193, '东安县', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2194, '双牌县', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2195, '道县', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2196, '江永县', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2197, '宁远县', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2198, '蓝山县', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2199, '新田县', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2200, '江华瑶族自治县', '0', 322, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2201, '鹤城区', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2202, '中方县', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2203, '沅陵县', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2204, '辰溪县', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2205, '溆浦县', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2206, '会同县', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2207, '麻阳苗族自治县', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2208, '新晃侗族自治县', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2209, '芷江侗族自治县', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2210, '靖州苗族侗族自治县', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2211, '通道侗族自治县', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2212, '洪江市', '0', 323, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2213, '娄星区', '0', 324, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2214, '双峰县', '0', 324, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2215, '新化县', '0', 324, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2216, '冷水江市', '0', 324, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2217, '涟源市', '0', 324, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2218, '吉首市', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2219, '泸溪县', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2220, '凤凰县', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2221, '花垣县', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2222, '保靖县', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2223, '古丈县', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2224, '永顺县', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2225, '龙山县', '0', 325, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2226, '荔湾区', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2227, '越秀区', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2228, '海珠区', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2229, '天河区', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2230, '白云区', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2231, '黄埔区', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2232, '番禺区', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2233, '花都区', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2234, '南沙区', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2235, '萝岗区', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2236, '增城市', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2237, '从化市', '0', 326, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2238, '武江区', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2239, '浈江区', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2240, '曲江区', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2241, '始兴县', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2242, '仁化县', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2243, '翁源县', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2244, '乳源瑶族自治县', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2245, '新丰县', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2246, '乐昌市', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2247, '南雄市', '0', 327, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2248, '罗湖区', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2249, '福田区', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2250, '南山区', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2251, '宝安区', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2252, '龙岗区', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2253, '盐田区', '0', 328, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2254, '香洲区', '0', 329, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2255, '斗门区', '0', 329, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2256, '金湾区', '0', 329, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2257, '龙湖区', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2258, '金平区', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2259, '濠江区', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2260, '潮阳区', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2261, '潮南区', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2262, '澄海区', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2263, '南澳县', '0', 330, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2264, '禅城区', '0', 331, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2265, '南海区', '0', 331, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2266, '顺德区', '0', 331, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2267, '三水区', '0', 331, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2268, '高明区', '0', 331, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2269, '蓬江区', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2270, '江海区', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2271, '新会区', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2272, '台山市', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2273, '开平市', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2274, '鹤山市', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2275, '恩平市', '0', 332, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2276, '赤坎区', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2277, '霞山区', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2278, '坡头区', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2279, '麻章区', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2280, '遂溪县', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2281, '徐闻县', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2282, '廉江市', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2283, '雷州市', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2284, '吴川市', '0', 333, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2285, '茂南区', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2286, '茂港区', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2287, '电白县', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2288, '高州市', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2289, '化州市', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2290, '信宜市', '0', 334, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2291, '端州区', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2292, '鼎湖区', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2293, '广宁县', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2294, '怀集县', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2295, '封开县', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2296, '德庆县', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2297, '高要市', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2298, '四会市', '0', 335, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2299, '惠城区', '0', 336, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2300, '惠阳区', '0', 336, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2301, '博罗县', '0', 336, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2302, '惠东县', '0', 336, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2303, '龙门县', '0', 336, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2304, '梅江区', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2305, '梅县', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2306, '大埔县', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2307, '丰顺县', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2308, '五华县', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2309, '平远县', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2310, '蕉岭县', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2311, '兴宁市', '0', 337, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2312, '城区', '0', 338, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2313, '海丰县', '0', 338, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2314, '陆河县', '0', 338, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2315, '陆丰市', '0', 338, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2316, '源城区', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2317, '紫金县', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2318, '龙川县', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2319, '连平县', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2320, '和平县', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2321, '东源县', '0', 339, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2322, '江城区', '0', 340, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2323, '阳西县', '0', 340, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2324, '阳东县', '0', 340, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2325, '阳春市', '0', 340, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2326, '清城区', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2327, '佛冈县', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2328, '阳山县', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2329, '连山壮族瑶族自治县', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2330, '连南瑶族自治县', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2331, '清新县', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2332, '英德市', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2333, '连州市', '0', 341, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2334, '湘桥区', '0', 344, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2335, '潮安县', '0', 344, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2336, '饶平县', '0', 344, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2337, '榕城区', '0', 345, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2338, '揭东县', '0', 345, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2339, '揭西县', '0', 345, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2340, '惠来县', '0', 345, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2341, '普宁市', '0', 345, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2342, '云城区', '0', 346, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2343, '新兴县', '0', 346, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2344, '郁南县', '0', 346, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2345, '云安县', '0', 346, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2346, '罗定市', '0', 346, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2347, '兴宁区', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2348, '青秀区', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2349, '江南区', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2350, '西乡塘区', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2351, '良庆区', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2352, '邕宁区', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2353, '武鸣县', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2354, '隆安县', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2355, '马山县', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2356, '上林县', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2357, '宾阳县', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2358, '横县', '0', 347, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2359, '城中区', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2360, '鱼峰区', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2361, '柳南区', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2362, '柳北区', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2363, '柳江县', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2364, '柳城县', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2365, '鹿寨县', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2366, '融安县', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2367, '融水苗族自治县', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2368, '三江侗族自治县', '0', 348, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2369, '秀峰区', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2370, '叠彩区', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2371, '象山区', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2372, '七星区', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2373, '雁山区', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2374, '阳朔县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2375, '临桂县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2376, '灵川县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2377, '全州县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2378, '兴安县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2379, '永福县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2380, '灌阳县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2381, '龙胜各族自治县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2382, '资源县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2383, '平乐县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2384, '荔蒲县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2385, '恭城瑶族自治县', '0', 349, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2386, '万秀区', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2387, '蝶山区', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2388, '长洲区', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2389, '苍梧县', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2390, '藤县', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2391, '蒙山县', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2392, '岑溪市', '0', 350, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2393, '海城区', '0', 351, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2394, '银海区', '0', 351, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2395, '铁山港区', '0', 351, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2396, '合浦县', '0', 351, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2397, '港口区', '0', 352, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2398, '防城区', '0', 352, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2399, '上思县', '0', 352, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2400, '东兴市', '0', 352, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2401, '钦南区', '0', 353, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2402, '钦北区', '0', 353, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2403, '灵山县', '0', 353, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2404, '浦北县', '0', 353, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2405, '港北区', '0', 354, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2406, '港南区', '0', 354, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2407, '覃塘区', '0', 354, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2408, '平南县', '0', 354, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2409, '桂平市', '0', 354, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2410, '玉州区', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2411, '容县', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2412, '陆川县', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2413, '博白县', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2414, '兴业县', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2415, '北流市', '0', 355, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2416, '右江区', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2417, '田阳县', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2418, '田东县', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2419, '平果县', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2420, '德保县', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2421, '靖西县', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2422, '那坡县', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2423, '凌云县', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2424, '乐业县', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2425, '田林县', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2426, '西林县', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2427, '隆林各族自治县', '0', 356, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2428, '八步区', '0', 357, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2429, '昭平县', '0', 357, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2430, '钟山县', '0', 357, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2431, '富川瑶族自治县', '0', 357, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2432, '金城江区', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2433, '南丹县', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2434, '天峨县', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2435, '凤山县', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2436, '东兰县', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2437, '罗城仫佬族自治县', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2438, '环江毛南族自治县', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2439, '巴马瑶族自治县', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2440, '都安瑶族自治县', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2441, '大化瑶族自治县', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2442, '宜州市', '0', 358, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2443, '兴宾区', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2444, '忻城县', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2445, '象州县', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2446, '武宣县', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2447, '金秀瑶族自治县', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2448, '合山市', '0', 359, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2449, '江洲区', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2450, '扶绥县', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2451, '宁明县', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2452, '龙州县', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2453, '大新县', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2454, '天等县', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2455, '凭祥市', '0', 360, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2456, '秀英区', '0', 361, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2457, '龙华区', '0', 361, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2458, '琼山区', '0', 361, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2459, '美兰区', '0', 361, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2460, '锦江区', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2461, '青羊区', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2462, '金牛区', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2463, '武侯区', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2464, '成华区', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2465, '龙泉驿区', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2466, '青白江区', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2467, '新都区', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2468, '温江区', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2469, '金堂县', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2470, '双流县', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2471, '郫县', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2472, '大邑县', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2473, '蒲江县', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2474, '新津县', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2475, '都江堰市', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2476, '彭州市', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2477, '邛崃市', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2478, '崇州市', '0', 382, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2479, '自流井区', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2480, '贡井区', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2481, '大安区', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2482, '沿滩区', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2483, '荣县', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2484, '富顺县', '0', 383, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2485, '东区', '0', 384, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2486, '西区', '0', 384, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2487, '仁和区', '0', 384, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2488, '米易县', '0', 384, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2489, '盐边县', '0', 384, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2490, '江阳区', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2491, '纳溪区', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2492, '龙马潭区', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2493, '泸县', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2494, '合江县', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2495, '叙永县', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2496, '古蔺县', '0', 385, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2497, '旌阳区', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2498, '中江县', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2499, '罗江县', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2500, '广汉市', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2501, '什邡市', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2502, '绵竹市', '0', 386, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2503, '涪城区', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2504, '游仙区', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2505, '三台县', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2506, '盐亭县', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2507, '安县', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2508, '梓潼县', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2509, '北川羌族自治县', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2510, '平武县', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2511, '江油市', '0', 387, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2512, '市中区', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2513, '元坝区', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2514, '朝天区', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2515, '旺苍县', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2516, '青川县', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2517, '剑阁县', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2518, '苍溪县', '0', 388, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2519, '船山区', '0', 389, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2520, '安居区', '0', 389, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2521, '蓬溪县', '0', 389, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2522, '射洪县', '0', 389, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2523, '大英县', '0', 389, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2524, '市中区', '0', 390, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2525, '东兴区', '0', 390, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2526, '威远县', '0', 390, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2527, '资中县', '0', 390, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2528, '隆昌县', '0', 390, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2529, '市中区', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2530, '沙湾区', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2531, '五通桥区', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2532, '金口河区', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2533, '犍为县', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2534, '井研县', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2535, '夹江县', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2536, '沐川县', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2537, '峨边彝族自治县', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2538, '马边彝族自治县', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2539, '峨眉山市', '0', 391, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2540, '顺庆区', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2541, '高坪区', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2542, '嘉陵区', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2543, '南部县', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2544, '营山县', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2545, '蓬安县', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2546, '仪陇县', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2547, '西充县', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2548, '阆中市', '0', 392, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2549, '东坡区', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2550, '仁寿县', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2551, '彭山县', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2552, '洪雅县', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2553, '丹棱县', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2554, '青神县', '0', 393, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2555, '翠屏区', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2556, '宜宾县', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2557, '南溪县', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2558, '江安县', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2559, '长宁县', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2560, '高县', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2561, '珙县', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2562, '筠连县', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2563, '兴文县', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2564, '屏山县', '0', 394, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2565, '广安区', '0', 395, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2566, '岳池县', '0', 395, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2567, '武胜县', '0', 395, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2568, '邻水县', '0', 395, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2569, '华蓥市', '0', 395, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2570, '通川区', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2571, '达县', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2572, '宣汉县', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2573, '开江县', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2574, '大竹县', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2575, '渠县', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2576, '万源市', '0', 396, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2577, '雨城区', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2578, '名山县', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2579, '荥经县', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2580, '汉源县', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2581, '石棉县', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2582, '天全县', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2583, '芦山县', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2584, '宝兴县', '0', 397, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2585, '巴州区', '0', 398, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2586, '通江县', '0', 398, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2587, '南江县', '0', 398, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2588, '平昌县', '0', 398, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2589, '雁江区', '0', 399, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2590, '安岳县', '0', 399, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2591, '乐至县', '0', 399, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2592, '简阳市', '0', 399, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2593, '汶川县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2594, '理县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2595, '茂县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2596, '松潘县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2597, '九寨沟县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2598, '金川县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2599, '小金县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2600, '黑水县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2601, '马尔康县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2602, '壤塘县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2603, '阿坝县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2604, '若尔盖县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2605, '红原县', '0', 400, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2606, '康定县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2607, '泸定县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2608, '丹巴县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2609, '九龙县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2610, '雅江县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2611, '道孚县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2612, '炉霍县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2613, '甘孜县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2614, '新龙县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2615, '德格县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2616, '白玉县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2617, '石渠县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2618, '色达县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2619, '理塘县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2620, '巴塘县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2621, '乡城县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2622, '稻城县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2623, '得荣县', '0', 401, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2624, '西昌市', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2625, '木里藏族自治县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2626, '盐源县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2627, '德昌县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2628, '会理县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2629, '会东县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2630, '宁南县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2631, '普格县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2632, '布拖县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2633, '金阳县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2634, '昭觉县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2635, '喜德县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2636, '冕宁县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2637, '越西县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2638, '甘洛县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2639, '美姑县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2640, '雷波县', '0', 402, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2641, '南明区', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2642, '云岩区', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2643, '花溪区', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2644, '乌当区', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2645, '白云区', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2646, '小河区', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2647, '开阳县', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2648, '息烽县', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2649, '修文县', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2650, '清镇市', '0', 403, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2651, '钟山区', '0', 404, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2652, '六枝特区', '0', 404, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2653, '水城县', '0', 404, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2654, '盘县', '0', 404, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2655, '红花岗区', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2656, '汇川区', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2657, '遵义县', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2658, '桐梓县', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2659, '绥阳县', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2660, '正安县', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2661, '道真仡佬族苗族自治县', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2662, '务川仡佬族苗族自治县', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2663, '凤冈县', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2664, '湄潭县', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2665, '余庆县', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2666, '习水县', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2667, '赤水市', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2668, '仁怀市', '0', 405, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2669, '西秀区', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2670, '平坝县', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2671, '普定县', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2672, '镇宁布依族苗族自治县', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2673, '关岭布依族苗族自治县', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2674, '紫云苗族布依族自治县', '0', 406, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2675, '铜仁市', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2676, '江口县', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2677, '玉屏侗族自治县', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2678, '石阡县', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2679, '思南县', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2680, '印江土家族苗族自治县', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2681, '德江县', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2682, '沿河土家族自治县', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2683, '松桃苗族自治县', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2684, '万山特区', '0', 407, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2685, '兴义市', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2686, '兴仁县', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2687, '普安县', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2688, '晴隆县', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2689, '贞丰县', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2690, '望谟县', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2691, '册亨县', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2692, '安龙县', '0', 408, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2693, '毕节市', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2694, '大方县', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2695, '黔西县', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2696, '金沙县', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2697, '织金县', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2698, '纳雍县', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2699, '威宁彝族回族苗族自治县', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2700, '赫章县', '0', 409, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2701, '凯里市', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2702, '黄平县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2703, '施秉县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2704, '三穗县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2705, '镇远县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2706, '岑巩县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2707, '天柱县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2708, '锦屏县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2709, '剑河县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2710, '台江县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2711, '黎平县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2712, '榕江县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2713, '从江县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2714, '雷山县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2715, '麻江县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2716, '丹寨县', '0', 410, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2717, '都匀市', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2718, '福泉市', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2719, '荔波县', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2720, '贵定县', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2721, '瓮安县', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2722, '独山县', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2723, '平塘县', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2724, '罗甸县', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2725, '长顺县', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2726, '龙里县', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2727, '惠水县', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2728, '三都水族自治县', '0', 411, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2729, '五华区', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2730, '盘龙区', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2731, '官渡区', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2732, '西山区', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2733, '东川区', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2734, '呈贡县', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2735, '晋宁县', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2736, '富民县', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2737, '宜良县', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2738, '石林彝族自治县', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2739, '嵩明县', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2740, '禄劝彝族苗族自治县', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2741, '寻甸回族彝族自治县', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2742, '安宁市', '0', 412, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2743, '麒麟区', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2744, '马龙县', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2745, '陆良县', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2746, '师宗县', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2747, '罗平县', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2748, '富源县', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2749, '会泽县', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2750, '沾益县', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2751, '宣威市', '0', 413, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2752, '红塔区', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2753, '江川县', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2754, '澄江县', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2755, '通海县', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2756, '华宁县', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2757, '易门县', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2758, '峨山彝族自治县', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2759, '新平彝族傣族自治县', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2760, '元江哈尼族彝族傣族自治县', '0', 414, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2761, '隆阳区', '0', 415, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2762, '施甸县', '0', 415, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2763, '腾冲县', '0', 415, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2764, '龙陵县', '0', 415, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2765, '昌宁县', '0', 415, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2766, '昭阳区', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2767, '鲁甸县', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2768, '巧家县', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2769, '盐津县', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2770, '大关县', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2771, '永善县', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2772, '绥江县', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2773, '镇雄县', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2774, '彝良县', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2775, '威信县', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2776, '水富县', '0', 416, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2777, '古城区', '0', 417, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2778, '玉龙纳西族自治县', '0', 417, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2779, '永胜县', '0', 417, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2780, '华坪县', '0', 417, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2781, '宁蒗彝族自治县', '0', 417, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2782, '翠云区', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2783, '普洱哈尼族彝族自治县', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2784, '墨江哈尼族自治县', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2785, '景东彝族自治县', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2786, '景谷傣族彝族自治县', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2787, '镇沅彝族哈尼族拉祜族自治县', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2788, '江城哈尼族彝族自治县', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2789, '孟连傣族拉祜族佤族自治县', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2790, '澜沧拉祜族自治县', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2791, '西盟佤族自治县', '0', 418, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2792, '临翔区', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2793, '凤庆县', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2794, '云县', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2795, '永德县', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2796, '镇康县', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2797, '双江拉祜族佤族布朗族傣族自治县', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2798, '耿马傣族佤族自治县', '0', 419, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2799, '沧源佤族自治县', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2800, '楚雄市', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2801, '双柏县', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2802, '牟定县', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2803, '南华县', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2804, '姚安县', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2805, '大姚县', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2806, '永仁县', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2807, '元谋县', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2808, '武定县', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2809, '禄丰县', '0', 420, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2810, '个旧市', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2811, '开远市', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2812, '蒙自县', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2813, '屏边苗族自治县', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2814, '建水县', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2815, '石屏县', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2816, '弥勒县', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2817, '泸西县', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2818, '元阳县', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2819, '红河县', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2820, '金平苗族瑶族傣族自治县', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2821, '绿春县', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2822, '河口瑶族自治县', '0', 421, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2823, '文山县', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2824, '砚山县', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2825, '西畴县', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2826, '麻栗坡县', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2827, '马关县', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2828, '丘北县', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2829, '广南县', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2830, '富宁县', '0', 422, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2831, '景洪市', '0', 423, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2832, '勐海县', '0', 423, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2833, '勐腊县', '0', 423, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2834, '大理市', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2835, '漾濞彝族自治县', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2836, '祥云县', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2837, '宾川县', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2838, '弥渡县', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2839, '南涧彝族自治县', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2840, '巍山彝族回族自治县', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2841, '永平县', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2842, '云龙县', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2843, '洱源县', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2844, '剑川县', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2845, '鹤庆县', '0', 424, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2846, '瑞丽市', '0', 425, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2847, '潞西市', '0', 425, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2848, '梁河县', '0', 425, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2849, '盈江县', '0', 425, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2850, '陇川县', '0', 425, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2851, '泸水县', '0', 426, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2852, '福贡县', '0', 426, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2853, '贡山独龙族怒族自治县', '0', 426, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2854, '兰坪白族普米族自治县', '0', 426, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2855, '香格里拉县', '0', 427, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2856, '德钦县', '0', 427, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2857, '维西傈僳族自治县', '0', 427, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2858, '城关区', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2859, '林周县', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2860, '当雄县', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2861, '尼木县', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2862, '曲水县', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2863, '堆龙德庆县', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2864, '达孜县', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2865, '墨竹工卡县', '0', 428, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2866, '昌都县', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2867, '江达县', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2868, '贡觉县', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2869, '类乌齐县', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2870, '丁青县', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2871, '察雅县', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2872, '八宿县', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2873, '左贡县', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2874, '芒康县', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2875, '洛隆县', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2876, '边坝县', '0', 429, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2877, '乃东县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2878, '扎囊县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2879, '贡嘎县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2880, '桑日县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2881, '琼结县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2882, '曲松县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2883, '措美县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2884, '洛扎县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2885, '加查县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2886, '隆子县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2887, '错那县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2888, '浪卡子县', '0', 430, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2889, '日喀则市', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2890, '南木林县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2891, '江孜县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2892, '定日县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2893, '萨迦县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2894, '拉孜县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2895, '昂仁县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2896, '谢通门县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2897, '白朗县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2898, '仁布县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2899, '康马县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2900, '定结县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2901, '仲巴县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2902, '亚东县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2903, '吉隆县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2904, '聂拉木县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2905, '萨嘎县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2906, '岗巴县', '0', 431, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2907, '那曲县', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2908, '嘉黎县', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2909, '比如县', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2910, '聂荣县', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2911, '安多县', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2912, '申扎县', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2913, '索县', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2914, '班戈县', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2915, '巴青县', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2916, '尼玛县', '0', 432, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2917, '普兰县', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2918, '札达县', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2919, '噶尔县', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2920, '日土县', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2921, '革吉县', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2922, '改则县', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2923, '措勤县', '0', 433, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2924, '林芝县', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2925, '工布江达县', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2926, '米林县', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2927, '墨脱县', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2928, '波密县', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2929, '察隅县', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2930, '朗县', '0', 434, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2931, '新城区', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2932, '碑林区', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2933, '莲湖区', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2934, '灞桥区', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2935, '未央区', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2936, '雁塔区', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2937, '阎良区', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2938, '临潼区', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2939, '长安区', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2940, '蓝田县', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2941, '周至县', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2942, '户县', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2943, '高陵县', '0', 435, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2944, '王益区', '0', 436, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2945, '印台区', '0', 436, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2946, '耀州区', '0', 436, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2947, '宜君县', '0', 436, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2948, '渭滨区', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2949, '金台区', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2950, '陈仓区', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2951, '凤翔县', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2952, '岐山县', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2953, '扶风县', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2954, '眉县', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2955, '陇县', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2956, '千阳县', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2957, '麟游县', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2958, '凤县', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2959, '太白县', '0', 437, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2960, '秦都区', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2961, '杨凌区', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2962, '渭城区', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2963, '三原县', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2964, '泾阳县', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2965, '乾县', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2966, '礼泉县', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2967, '永寿县', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2968, '彬县', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2969, '长武县', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2970, '旬邑县', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2971, '淳化县', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2972, '武功县', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2973, '兴平市', '0', 438, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2974, '临渭区', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2975, '华县', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2976, '潼关县', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2977, '大荔县', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2978, '合阳县', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2979, '澄城县', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2980, '蒲城县', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2981, '白水县', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2982, '富平县', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2983, '韩城市', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2984, '华阴市', '0', 439, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2985, '宝塔区', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2986, '延长县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2987, '延川县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2988, '子长县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2989, '安塞县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2990, '志丹县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2991, '吴起县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2992, '甘泉县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2993, '富县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2994, '洛川县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2995, '宜川县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2996, '黄龙县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2997, '黄陵县', '0', 440, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2998, '汉台区', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(2999, '南郑县', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3000, '城固县', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3001, '洋县', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3002, '西乡县', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3003, '勉县', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3004, '宁强县', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3005, '略阳县', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3006, '镇巴县', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3007, '留坝县', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3008, '佛坪县', '0', 441, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3009, '榆阳区', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3010, '神木县', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3011, '府谷县', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3012, '横山县', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3013, '靖边县', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3014, '定边县', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3015, '绥德县', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3016, '米脂县', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3017, '佳县', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3018, '吴堡县', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3019, '清涧县', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3020, '子洲县', '0', 442, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3021, '汉滨区', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3022, '汉阴县', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3023, '石泉县', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3024, '宁陕县', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3025, '紫阳县', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3026, '岚皋县', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3027, '平利县', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3028, '镇坪县', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3029, '旬阳县', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3030, '白河县', '0', 443, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3031, '商州区', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3032, '洛南县', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3033, '丹凤县', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3034, '商南县', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3035, '山阳县', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3036, '镇安县', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3037, '柞水县', '0', 444, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3038, '城关区', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3039, '七里河区', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3040, '西固区', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3041, '安宁区', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3042, '红古区', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3043, '永登县', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3044, '皋兰县', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3045, '榆中县', '0', 445, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3046, '金川区', '0', 447, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3047, '永昌县', '0', 447, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3048, '白银区', '0', 448, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3049, '平川区', '0', 448, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3050, '靖远县', '0', 448, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3051, '会宁县', '0', 448, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3052, '景泰县', '0', 448, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3053, '秦城区', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3054, '北道区', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3055, '清水县', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3056, '秦安县', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3057, '甘谷县', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3058, '武山县', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3059, '张家川回族自治县', '0', 449, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3060, '凉州区', '0', 450, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3061, '民勤县', '0', 450, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3062, '古浪县', '0', 450, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3063, '天祝藏族自治县', '0', 450, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3064, '甘州区', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3065, '肃南裕固族自治县', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3066, '民乐县', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3067, '临泽县', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3068, '高台县', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3069, '山丹县', '0', 451, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3070, '崆峒区', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3071, '泾川县', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3072, '灵台县', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3073, '崇信县', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3074, '华亭县', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3075, '庄浪县', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3076, '静宁县', '0', 452, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3077, '肃州区', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3078, '金塔县', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3079, '瓜州县', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3080, '肃北蒙古族自治县', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3081, '阿克塞哈萨克族自治县', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3082, '玉门市', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3083, '敦煌市', '0', 453, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3084, '西峰区', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3085, '庆城县', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3086, '环县', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3087, '华池县', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3088, '合水县', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3089, '正宁县', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3090, '宁县', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3091, '镇原县', '0', 454, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3092, '安定区', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3093, '通渭县', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3094, '陇西县', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3095, '渭源县', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3096, '临洮县', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3097, '漳县', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3098, '岷县', '0', 455, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3099, '武都区', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3100, '成县', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3101, '文县', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3102, '宕昌县', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3103, '康县', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3104, '西和县', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3105, '礼县', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3106, '徽县', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3107, '两当县', '0', 456, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3108, '临夏市', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3109, '临夏县', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3110, '康乐县', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3111, '永靖县', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3112, '广河县', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3113, '和政县', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3114, '东乡族自治县', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3115, '积石山保安族东乡族撒拉族自治县', '0', 457, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3116, '合作市', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3117, '临潭县', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3118, '卓尼县', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3119, '舟曲县', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3120, '迭部县', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3121, '玛曲县', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3122, '碌曲县', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3123, '夏河县', '0', 458, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3124, '城东区', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3125, '城中区', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3126, '城西区', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3127, '城北区', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3128, '大通回族土族自治县', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3129, '湟中县', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3130, '湟源县', '0', 459, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3131, '平安县', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3132, '民和回族土族自治县', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3133, '乐都县', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3134, '互助土族自治县', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3135, '化隆回族自治县', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3136, '循化撒拉族自治县', '0', 460, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3137, '门源回族自治县', '0', 461, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3138, '祁连县', '0', 461, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3139, '海晏县', '0', 461, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3140, '刚察县', '0', 461, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3141, '同仁县', '0', 462, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3142, '尖扎县', '0', 462, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3143, '泽库县', '0', 462, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3144, '河南蒙古族自治县', '0', 462, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3145, '共和县', '0', 463, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3146, '同德县', '0', 463, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3147, '贵德县', '0', 463, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3148, '兴海县', '0', 463, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3149, '贵南县', '0', 463, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3150, '玛沁县', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3151, '班玛县', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3152, '甘德县', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3153, '达日县', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3154, '久治县', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3155, '玛多县', '0', 464, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3156, '玉树县', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3157, '杂多县', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3158, '称多县', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3159, '治多县', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3160, '囊谦县', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3161, '曲麻莱县', '0', 465, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3162, '格尔木市', '0', 466, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3163, '德令哈市', '0', 466, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3164, '乌兰县', '0', 466, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3165, '都兰县', '0', 466, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3166, '天峻县', '0', 466, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3167, '兴庆区', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3168, '西夏区', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3169, '金凤区', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3170, '永宁县', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3171, '贺兰县', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3172, '灵武市', '0', 467, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3173, '大武口区', '0', 468, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3174, '惠农区', '0', 468, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3175, '平罗县', '0', 468, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3176, '利通区', '0', 469, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3177, '盐池县', '0', 469, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3178, '同心县', '0', 469, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3179, '青铜峡市', '0', 469, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3180, '原州区', '0', 470, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3181, '西吉县', '0', 470, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3182, '隆德县', '0', 470, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3183, '泾源县', '0', 470, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3184, '彭阳县', '0', 470, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3185, '沙坡头区', '0', 471, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3186, '中宁县', '0', 471, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3187, '海原县', '0', 471, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3188, '天山区', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3189, '沙依巴克区', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3190, '新市区', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3191, '水磨沟区', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3192, '头屯河区', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3193, '达坂城区', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3194, '东山区', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3195, '乌鲁木齐县', '0', 472, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3196, '独山子区', '0', 473, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3197, '克拉玛依区', '0', 473, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3198, '白碱滩区', '0', 473, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3199, '乌尔禾区', '0', 473, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3200, '吐鲁番市', '0', 474, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3201, '鄯善县', '0', 474, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3202, '托克逊县', '0', 474, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3203, '哈密市', '0', 475, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3204, '巴里坤哈萨克自治县', '0', 475, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3205, '伊吾县', '0', 475, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3206, '昌吉市', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3207, '阜康市', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3208, '米泉市', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3209, '呼图壁县', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3210, '玛纳斯县', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3211, '奇台县', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3212, '吉木萨尔县', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3213, '木垒哈萨克自治县', '0', 476, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3214, '博乐市', '0', 477, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3215, '精河县', '0', 477, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3216, '温泉县', '0', 477, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3217, '库尔勒市', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3218, '轮台县', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3219, '尉犁县', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3220, '若羌县', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3221, '且末县', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3222, '焉耆回族自治县', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3223, '和静县', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3224, '和硕县', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3225, '博湖县', '0', 478, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3226, '阿克苏市', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3227, '温宿县', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3228, '库车县', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3229, '沙雅县', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3230, '新和县', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3231, '拜城县', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3232, '乌什县', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3233, '阿瓦提县', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3234, '柯坪县', '0', 479, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3235, '阿图什市', '0', 480, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3236, '阿克陶县', '0', 480, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3237, '阿合奇县', '0', 480, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3238, '乌恰县', '0', 480, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3239, '喀什市', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3240, '疏附县', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3241, '疏勒县', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3242, '英吉沙县', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3243, '泽普县', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3244, '莎车县', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3245, '叶城县', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3246, '麦盖提县', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3247, '岳普湖县', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3248, '伽师县', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3249, '巴楚县', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3250, '塔什库尔干塔吉克自治县', '0', 481, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3251, '和田市', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3252, '和田县', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3253, '墨玉县', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3254, '皮山县', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3255, '洛浦县', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3256, '策勒县', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3257, '于田县', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3258, '民丰县', '0', 482, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3259, '伊宁市', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3260, '奎屯市', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3261, '伊宁县', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3262, '察布查尔锡伯自治县', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3263, '霍城县', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3264, '巩留县', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3265, '新源县', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3266, '昭苏县', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3267, '特克斯县', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3268, '尼勒克县', '0', 483, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3269, '塔城市', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3270, '乌苏市', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3271, '额敏县', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3272, '沙湾县', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3273, '托里县', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3274, '裕民县', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3275, '和布克赛尔蒙古自治县', '0', 484, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3276, '阿勒泰市', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3277, '布尔津县', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3278, '富蕴县', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3279, '福海县', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3280, '哈巴河县', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3281, '青河县', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3282, '吉木乃县', '0', 485, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3358, '钓鱼岛', '', 0, 1, 0, '', 0);
INSERT INTO `phpcms_linkage` (`linkageid`, `name`, `style`, `parentid`, `keyid`, `listorder`, `description`, `siteid`) VALUES(3359, '钓鱼岛', '', 3358, 1, 0, '', 0);

-- ----------------------------
-- Records of phpcms_menu
-- ----------------------------
--
-- 转存表中的数据 `phpcms_menu`
--

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(1, 'sys_setting', 0, 'admin', 'setting', 'init', '', 1, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(2, 'module', 0, 'admin', 'module', 'init', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(872, 'sync_release_point', 873, 'release', 'index', 'init', '', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(4, 'content', 0, 'content', 'content', 'init', '', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(5, 'members', 0, 'member', 'member', 'init', '', 5, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(6, 'userinterface', 0, 'template', 'style', 'init', '', 6, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(30, 'correlative_setting', 1, 'admin', 'admin', 'admin', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(31, 'menu_manage', 977, 'admin', 'menu', 'init', '', 8, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(32, 'posid_manage', 975, 'admin', 'position', 'init', '', 7, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(29, 'module_list', 2, 'admin', 'module', '', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(82, 'module_manage', 2, 'admin', 'module', '', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(10, 'panel', 0, 'admin', 'index', 'public_main', '', 0, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(35, 'menu_add', 31, 'admin', 'menu', 'add', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(826, 'template_manager', 6, '', '', '', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(54, 'admin_manage', 49, 'admin', 'admin_manage', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(43, 'category_manage', 975, 'admin', 'category', 'init', 'module=admin', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(42, 'add_category', 43, 'admin', 'category', 'add', 's=0', 1, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(44, 'edit_category', 43, 'admin', 'category', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(45, 'badword_manage', 977, 'admin', 'badword', 'init', '', 10, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(46, 'posid_add', 32, 'admin', 'position', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(49, 'admin_setting', 1, 'admin', '', '', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(50, 'role_manage', 49, 'admin', 'role', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(51, 'role_add', 50, 'admin', 'role', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(52, 'category_cache', 43, 'admin', 'category', 'public_cache', 'module=admin', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(55, 'manage_member', 5, 'member', 'member', 'manage', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(58, 'admin_add', 54, 'admin', 'admin_manage', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(59, 'model_manage', 975, 'content', 'sitemodel', 'init', '', 5, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(64, 'site_management', 30, 'admin', 'site', 'init', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(81, 'member_add', 72, 'member', 'member', 'add', '', 2, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(62, 'add_model', 59, 'content', 'sitemodel', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(65, 'release_point_management', 30, 'admin', 'release_point', 'init', '', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(66, 'badword_export', 45, 'admin', 'badword', 'export', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(67, 'add_site', 64, 'admin', 'site', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(68, 'badword_import', 45, 'admin', 'badword', 'import', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(812, 'member_group_manage', 76, 'member', 'member_group', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(74, 'member_verify', 55, 'member', 'member_verify', 'manage', 's=0', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(76, 'manage_member_group', 5, 'member', 'member_group', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(77, 'manage_member_model', 5, 'member', 'member_model', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(78, 'member_group_add', 812, 'member', 'member_group', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(79, 'member_model_add', 813, 'member', 'member_model', 'add', '', 1, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(80, 'member_model_import', 77, 'member', 'member_model', 'import', '', 2, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(72, 'member_manage', 55, 'member', 'member', 'manage', '', 1, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(813, 'member_model_manage', 77, 'member', 'member_model', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(814, 'site_edit', 64, 'admin', 'site', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(815, 'site_del', 64, 'admin', 'site', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(816, 'release_point_add', 65, 'admin', 'release_point', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(817, 'release_point_del', 65, 'admin', 'release_point', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(818, 'release_point_edit', 65, 'admin', 'release_point', 'edit', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(821, 'content_publish', 4, 'content', 'content', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(822, 'content_manage', 821, 'content', 'content', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(867, 'linkage', 977, 'admin', 'linkage', 'init', '', 13, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(827, 'template_style', 826, 'template', 'style', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(828, 'import_style', 827, 'template', 'style', 'import', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(831, 'template_export', 827, 'template', 'style', 'export', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(830, 'template_file', 827, 'template', 'file', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(832, 'template_onoff', 827, 'template', 'style', 'disable', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(833, 'template_updatename', 827, 'template', 'style', 'updatename', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(834, 'member_lock', 72, 'member', 'member', 'lock', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(835, 'member_unlock', 72, 'member', 'member', 'unlock', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(836, 'member_move', 72, 'member', 'member', 'move', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(837, 'member_delete', 72, 'member', 'member', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(842, 'verify_ignore', 74, 'member', 'member_verify', 'manage', 's=2', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(839, 'member_setting', 55, 'member', 'member_setting', 'manage', '', 4, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(841, 'verify_pass', 74, 'member', 'member_verify', 'manage', 's=1', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(843, 'verify_delete', 74, 'member', 'member_verify', 'manage', 's=3', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(844, 'verify_deny', 74, 'member', 'member_verify', 'manage', 's=4', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(845, 'never_pass', 74, 'member', 'member_verify', 'manage', 's=5', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(846, 'template_file_list', 827, 'template', 'file', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(847, 'template_file_edit', 827, 'template', 'file', 'edit_file', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(848, 'file_add_file', 827, 'template', 'file', 'add_file', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(850, 'listorder', 76, 'member', 'member_group', 'sort', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(852, 'priv_setting', 50, 'admin', 'role', 'priv_setting', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(853, 'role_priv', 50, 'admin', 'role', 'role_priv', '', 0, '0');


INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(857, 'attachment_manage', 821, 'attachment', 'manage', 'init', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(868, 'special', 821, 'special', 'special', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(869, 'template_editor', 827, 'template', 'file', 'edit_file', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(870, 'template_visualization', 827, 'template', 'file', 'visualization', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(871, 'pc_tag_edit', 827, 'template', 'file', 'edit_pc_tag', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(873, 'release_manage', 4, 'release', 'html', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(874, 'type_manage', 975, 'content', 'type_manage', 'init', '', 6, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(875, 'add_type', 874, 'content', 'type_manage', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(876, 'linkageadd', 867, 'admin', 'linkage', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(877, 'failure_list', 872, 'release', 'index', 'failed', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(879, 'member_search', 72, 'member', 'member', 'search', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(880, 'queue_del', 872, 'release', 'index', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(881, 'member_model_delete', 813, 'member', 'member_model', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(882, 'member_model_edit', 813, 'member', 'member_model', 'edit', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(885, 'workflow', 977, 'content', 'workflow', 'init', '', 15, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(888, 'add_workflow', 885, 'content', 'workflow', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(889, 'member_modelfield_add', 813, 'member', 'member_modelfield', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(890, 'member_modelfield_edit', 813, 'member', 'member_modelfield', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(891, 'member_modelfield_delete', 813, 'member', 'member_modelfield', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(892, 'member_modelfield_manage', 813, 'member', 'member_modelfield', 'manage', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(895, 'sitemodel_import', 59, 'content', 'sitemodel', 'import', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(896, 'pay', 29, 'pay', 'payment', 'pay_list', 's=3', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(897, 'payments', 896, 'pay', 'payment', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(898, 'paylist', 896, 'pay', 'payment', 'pay_list', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(899, 'add_content', 822, 'content', 'content', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(900, 'modify_deposit', 896, 'pay', 'payment', 'modify_deposit', 's=1', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(901, 'check_content', 822, 'content', 'content', 'pass', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(902, 'dbsource', 29, 'dbsource', 'data', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(905, 'create_content_html', 873, 'content', 'create_html', 'show', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(904, 'external_data_sources', 902, 'dbsource', 'dbsource_admin', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(906, 'update_urls', 873, 'content', 'create_html', 'update_urls', '', 1, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(960, 'node_add', 957, 'collection', 'node', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(909, 'fulltext_search', 29, 'search', 'search_type', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(910, 'manage_type', 909, 'search', 'search_type', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(911, 'search_setting', 909, 'search', 'search_admin', 'setting', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(912, 'createindex', 909, 'search', 'search_admin', 'createindex', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(913, 'add_search_type', 909, 'search', 'search_type', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(914, 'database_toos', 977, 'admin', 'database', 'export', '', 6, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(915, 'database_export', 914, 'admin', 'database', 'export', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(916, 'database_import', 914, 'admin', 'database', 'import', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(917, 'dbsource_add', 902, 'dbsource', 'dbsource_admin', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(918, 'dbsource_edit', 902, 'dbsource', 'dbsource_admin', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(919, 'dbsource_del', 902, 'dbsource', 'dbsource_admin', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(920, 'dbsource_data_add', 902, 'dbsource', 'data', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(921, 'dbsource_data_edit', 902, 'dbsource', 'data', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(922, 'dbsource_data_del', 902, 'dbsource', 'data', 'del', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(926, 'add_special', 868, 'special', 'special', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(927, 'edit_special', 868, 'special', 'special', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(928, 'special_list', 868, 'special', 'special', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(929, 'special_elite', 868, 'special', 'special', 'elite', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(930, 'delete_special', 868, 'special', 'special', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(931, 'badword_add', 45, 'admin', 'badword', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(932, 'badword_edit', 45, 'admin', 'badword', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(933, 'badword_delete', 45, 'admin', 'badword', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(934, 'special_listorder', 868, 'special', 'special', 'listorder', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(935, 'special_content_list', 868, 'special', 'content', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(936, 'special_content_add', 935, 'special', 'content', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(937, 'special_content_list', 935, 'special', 'content', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(938, 'special_content_edit', 935, 'special', 'content', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(939, 'special_content_delete', 935, 'special', 'content', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(940, 'special_content_listorder', 935, 'special', 'content', 'listorder', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(941, 'special_content_import', 935, 'special', 'special', 'import', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(942, 'history_version', 827, 'template', 'template_bak', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(943, 'restore_version', 827, 'template', 'template_bak', 'restore', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(944, 'del_history_version', 827, 'template', 'template_bak', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(945, 'block', 821, 'block', 'block_admin', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(946, 'block_add', 945, 'block', 'block_admin', 'add', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(950, 'block_edit', 945, 'block', 'block_admin', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(951, 'block_del', 945, 'block', 'block_admin', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(952, 'block_update', 945, 'block', 'block_admin', 'block_update', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(953, 'block_restore', 945, 'block', 'block_admin', 'history_restore', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(954, 'history_del', 945, 'block', 'block_admin', 'history_del', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(978, 'urlrule_manage', 977, 'admin', 'urlrule', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(957, 'collection_node', 821, 'collection', 'node', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(979, 'safe_config', 30, 'admin', 'setting', 'init', '&tab=2', 11, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(959, 'basic_config', 30, 'admin', 'setting', 'init', '', 10, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(961, 'position_edit', 32, 'admin', 'position', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(962, 'collection_node_edit', 957, 'collection', 'node', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(963, 'collection_node_delete', 957, 'collection', 'node', 'del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(990, 'col_url_list', 957, 'collection', 'node', 'col_url_list', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(965, 'collection_node_publish', 957, 'collection', 'node', 'publist', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(966, 'collection_node_import', 957, 'collection', 'node', 'node_import', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(967, 'collection_node_export', 957, 'collection', 'node', 'export', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(968, 'collection_node_collection_content', 957, 'collection', 'node', 'col_content', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(969, 'googlesitemap', 977, 'admin', 'googlesitemap', 'set', '', 11, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(970, 'admininfo', 10, 'admin', 'admin_manage', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(971, 'editpwd', 970, 'admin', 'admin_manage', 'public_edit_pwd', '', 1, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(972, 'editinfo', 970, 'admin', 'admin_manage', 'public_edit_info', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(973, 'keylink', 977, 'admin', 'keylink', 'init', '', 12, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(974, 'add_keylink', 973, 'admin', 'keylink', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(975, 'content_settings', 4, 'content', 'content_settings', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(7, 'extend', 0, 'admin', 'extend', 'init_extend', '', 7, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(977, 'extend_all', 7, 'admin', 'extend_all', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(980, 'sso_config', 30, 'admin', 'setting', 'init', '&tab=3', 12, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(981, 'email_config', 30, 'admin', 'setting', 'init', '&tab=4', 13, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(982, 'module_manage', 82, 'admin', 'module', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(983, 'ipbanned', 977, 'admin', 'ipbanned', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(984, 'add_ipbanned', 983, 'admin', 'ipbanned', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(993, 'collection_content_import', 957, 'collection', 'node', 'import', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(991, 'copy_node', 957, 'collection', 'node', 'copy', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(992, 'content_del', 957, 'collection', 'node', 'content_del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(989, 'downsites', 977, 'admin', 'downservers', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(994, 'import_program_add', 957, 'collection', 'node', 'import_program_add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(995, 'import_program_del', 957, 'collection', 'node', 'import_program_del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(996, 'import_content', 957, 'collection', 'node', 'import_content', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(997, 'log', 977, 'admin', 'log', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(998, 'add_page', 43, 'admin', 'category', 'add', 's=1', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(999, 'add_cat_link', 43, 'admin', 'category', 'add', 's=2', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1000, 'count_items', 43, 'admin', 'category', 'count_items', '', 5, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1001, 'cache_all', 977, 'admin', 'cache_all', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1002, 'create_list_html', 873, 'content', 'create_html', 'category', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1003, 'create_html_quick', 10, 'content', 'create_html_opt', 'index', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1004, 'create_index', 1003, 'content', 'create_html', 'public_index', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1005, 'scan', 977, 'scan', 'index', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1006, 'scan_report', 1005, 'scan', 'index', 'scan_report', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1007, 'md5_creat', 1005, 'scan', 'index', 'md5_creat', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1008, 'album_import', 868, 'special', 'album', 'import', '', 0, '1');


INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`) VALUES(8, 'phpsso', 0, 'admin', 'phpsso', 'menu', '', 7, '1', '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1011, 'edit_content', 822, 'content', 'content', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1012, 'push_to_special', 822, 'content', 'push', 'init', '', 0, '0');



INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1023, 'delete_log', 997, 'admin', 'log', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1024, 'delete_ip', 983, 'admin', 'ipbanned', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1026, 'delete_keylink', 973, 'admin', 'keylink', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1027, 'edit_keylink', 973, 'admin', 'keylink', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1034, 'operation_pass', 74, 'member', 'member_verify', 'pass', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1035, 'operation_delete', 74, 'member', 'member_verify', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1039, 'operation_ignore', 74, 'member', 'member_verify', 'ignore', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1038, 'settingsave', 30, 'admin', 'setting', 'save', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1040, 'admin_edit', 54, 'admin', 'admin_manage', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1041, 'operation_reject', 74, 'member', 'member_verify', 'reject', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1042, 'admin_delete', 54, 'admin', 'admin_manage', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1043, 'card', 54, 'admin', 'admin_manage', 'card', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1044, 'creat_card', 54, 'admin', 'admin_manage', 'creat_card', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1045, 'remove_card', 54, 'admin', 'admin_manage', 'remove_card', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1049, 'member_group_edit', 812, 'member', 'member_group', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1048, 'member_edit', 72, 'member', 'member', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1050, 'role_edit', 50, 'admin', 'role', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1051, 'member_group_delete', 812, 'member', 'member_group', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1052, 'member_manage', 50, 'admin', 'role', 'member_manage', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1053, 'role_delete', 50, 'admin', 'role', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1054, 'member_model_export', 77, 'member', 'member_model', 'export', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1055, 'member_model_sort', 77, 'member', 'member_model', 'sort', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1056, 'member_model_move', 77, 'member', 'member_model', 'move', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1057, 'payment_add', 897, 'pay', 'payment', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1058, 'payment_delete', 897, 'pay', 'payment', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1059, 'payment_edit', 897, 'pay', 'payment', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1060, 'spend_record', 896, 'pay', 'spend', 'init', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1061, 'pay_stat', 896, 'pay', 'payment', 'pay_stat', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1062, 'fields_manage', 59, 'content', 'sitemodel_field', 'init', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1063, 'edit_model_content', 59, 'content', 'sitemodel', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1064, 'disabled_model', 59, 'content', 'sitemodel', 'disabled', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1065, 'delete_model', 59, 'content', 'sitemodel', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1066, 'export_model', 59, 'content', 'sitemodel', 'export', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1067, 'delete', 874, 'content', 'type_manage', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1068, 'edit', 874, 'content', 'type_manage', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1069, 'add_urlrule', 978, 'admin', 'urlrule', 'add', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1070, 'edit_urlrule', 978, 'admin', 'urlrule', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1071, 'delete_urlrule', 978, 'admin', 'urlrule', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1072, 'edit_menu', 31, 'admin', 'menu', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1073, 'delete_menu', 31, 'admin', 'menu', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1074, 'edit_workflow', 885, 'content', 'workflow', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1075, 'delete_workflow', 885, 'content', 'workflow', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1076, 'creat_html', 868, 'special', 'special', 'html', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1093, 'connect_config', 30, 'admin', 'setting', 'init', '&tab=5', 14, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1102, 'view_modelinfo', 74, 'member', 'member_verify', 'modelinfo', '', 0, '0');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1202, 'create_special_list', 868, 'special', 'special', 'create_special_list', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1240, 'view_memberlinfo', 72, 'member', 'member', 'memberinfo', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1239, 'copyfrom_manage', 977, 'admin', 'copyfrom', 'init', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1241, 'move_content', 822, 'content', 'content', 'remove', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1242, 'poster_template', 56, 'poster', 'space', 'poster_template', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1243, 'create_index', 873, 'content', 'create_html', 'public_index', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1244, 'add_othors', 822, 'content', 'content', 'add_othors', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1295, 'attachment_manager_dir', 857, 'attachment', 'manage', 'dir', '', 2, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1296, 'attachment_manager_db', 857, 'attachment', 'manage', 'init', '', 1, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1346, 'attachment_address_replace', 857, 'attachment', 'address', 'init', '', 3, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1347, 'attachment_address_update', 857, 'attachment', 'address', 'update', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1348, 'delete_content', 822, 'content', 'content', 'delete', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1349, 'member_menu_manage', 977, 'member', 'member_menu', 'manage', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1350, 'member_menu_add', 1349, 'member', 'member_menu', 'add', '', 0, '1');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1351, 'member_menu_edit', 1349, 'member', 'member_menu', 'edit', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1352, 'member_menu_delete', 1349, 'member', 'member_menu', 'delete', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1353, 'batch_show', 822, 'content', 'create_html', 'batch_show', '', 0, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1354, 'pay_delete', 898, 'pay', 'payment', 'pay_del', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1355, 'pay_cancel', 898, 'pay', 'payment', 'pay_cancel', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1356, 'discount', 898, 'pay', 'payment', 'discount', '', 0, '0');
INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1360, 'category_batch_edit', 43, 'admin', 'category', 'batch_edit', '', 6, '1');

INSERT INTO `phpcms_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`) VALUES(1500, 'listorder', 822, 'content', 'content', 'listorder', '', 0, '0');
INSERT INTO `phpcms_menu` (`name` ,`parentid` ,`m` ,`c` ,`a` ,`data` ,`listorder` ,`display` ,`project1` ,`project2` ,`project3` ,`project4` ,`project5`) VALUES ('a_clean_data',  '873',  'content',  'content',  'clear_data',  '',  '0',  '1',  '0',  '0',  '0',  '0',  '0');
-- ----------------------------
-- Records of phpcms_module
-- ----------------------------
INSERT INTO `phpcms_module` VALUES ('admin', 'admin', '', '1', '1.0', '', 'array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n)', '0', '0', '2010-10-18', '2010-10-18');

INSERT INTO `phpcms_module` VALUES ('member', '会员', '', '1', '1.0', '', 'array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)', '0', '0', '2010-09-06', '2010-09-06');

INSERT INTO `phpcms_module` VALUES ('pay', '支付', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');

INSERT INTO `phpcms_module` VALUES ('digg', '顶一下', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('special', '专题', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('content', '内容模块', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('search', '全站搜索', '', '0', '1.0', '', 'array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)', '0', '0', '2010-09-06', '2010-09-06');

INSERT INTO `phpcms_module` VALUES ('scan', '木马扫描', 'scan', '0', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('attachment', '附件', 'attachment', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('block', '碎片', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('collection', '采集模块', 'collection', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('dbsource', '数据源', '', '1', '', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('template', '模板风格', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` VALUES ('release', '发布点', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `phpcms_module` (`module`, `name`, `url`, `iscore`, `version`, `description`, `setting`, `listorder`, `disabled`, `installdate`, `updatedate`) VALUES ('video', '视频库', '', 0, '1.0', '', '', 0, 0, '2012-09-28', '2012-09-28');

-- ----------------------------
-- Records of phpcms_type
-- ----------------------------
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '52', 'search', '0', '专题', '0', 'special', '', '', '4', '专题');
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '1', 'search', '1', '新闻', '0', '', '', '', '1', '新闻模型搜索');
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '2', 'search', '2', '下载', '0', '', '', '', '3', '下载模型搜索');
INSERT INTO `phpcms_type` (`siteid`, `typeid`, `module`, `modelid`, `name`, `parentid`, `typedir`, `url`, `template`, `listorder`, `description`) VALUES('1', '3', 'search', '3', '图片', '0', '', '', '', '2', '图片模型搜索');



-- ----------------------------
-- Records of phpcms_urlrule
-- ----------------------------
INSERT INTO `phpcms_urlrule` VALUES ('1', 'content', 'category', '1', '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html', 'news/china/1000.html');
INSERT INTO `phpcms_urlrule` VALUES ('6', 'content', 'category', '0', 'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}', 'index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `phpcms_urlrule` VALUES ('11', 'content', 'show', '1', '{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html', '2010/catdir_0720/1_2.html');
INSERT INTO `phpcms_urlrule` VALUES ('12', 'content', 'show', '1', '{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html', 'it/product/2010/0720/1_2.html');
INSERT INTO `phpcms_urlrule` VALUES ('16', 'content', 'show', '0', 'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}', 'index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `phpcms_urlrule` VALUES ('17', 'content', 'show', '0', 'show-{$catid}-{$id}-{$page}.html', 'show-1-2-1.html');
INSERT INTO `phpcms_urlrule` VALUES ('18', 'content', 'show', '0', 'content-{$catid}-{$id}-{$page}.html', 'content-1-2-1.html');
INSERT INTO `phpcms_urlrule` VALUES ('30', 'content', 'category', '0', 'list-{$catid}-{$page}.html', 'list-1-1.html');


-- ----------------------------
-- Records of phpcms_model
-- ----------------------------
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `sort`, `type`) VALUES(1, 1, '文章模型', '', 'news', 1, 0, 'default', 'category', 'list', 'show', 0, 0);
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `sort`, `type`) VALUES(2, 1, '下载模型', '', 'download', 1, 0, 'default', 'category_download', 'list_download', 'show_download', 0, 0);
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `sort`, `type`) VALUES(3, 1, '图片模型', '', 'picture', 1, 0, 'default', 'category_picture', 'list_picture', 'show_picture', 0, 0);
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `sort`, `type`) VALUES(10, 1, '普通会员', '普通会员', 'member_detail', 1, 0, '', '', '', '', 0, 2);
INSERT INTO `phpcms_model` (`modelid`, `siteid`, `name`, `description`, `tablename`, `setting`, `addtime`, `items`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `js_template`, `sort`, `type`) VALUES(11, 1, '视频模型', '', 'video', '', 0, 0, 1, 0, 'default', 'category_video', 'list_video', 'show_video', '', 0, 0);

-- ----------------------------
-- Records of phpcms_model_field
-- ----------------------------

INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(1, 1, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(2, 1, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(3, 1, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(4, 1, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(5, 1, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(6, 1, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(7, 1, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(8, 1, 1, 'content', '内容', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>是否获取内容第</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">张图片作为标题图片\r\n</div>', '', 1, 999999, '', '内容不能为空', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(9, 1, 1, 'voteid', '添加投票', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''text\\'' name=\\''info[voteid]\\'' id=\\''voteid\\'' value=\\''{FIELD_VALUE}\\'' size=\\''3\\''> \r\n<input type=\\''button\\'' value="选择已有投票" onclick="omnipotent(\\''selectid\\'',\\''?m=vote&c=vote&a=public_get_votelist&from_api=1\\'',\\''选择已有投票\\'')" class="button">\r\n<input type=\\''button\\'' value="新增投票" onclick="omnipotent(\\''addvote\\'',\\''?m=vote&c=vote&a=add&from_api=1\\'',\\''添加投票\\'',0)" class="button">'',\n  ''fieldtype'' => ''mediumint'',\n  ''minnumber'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 1, 0, 21, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(10, 1, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(11, 1, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(12, 1, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(13, 1, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(14, 1, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(15, 1, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(16, 1, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(17, 1, 1, 'groupids_view', '阅读权限', '', '', 0, 0, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(18, 1, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(19, 1, 1, 'relation', '相关文章', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(20, 1, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(21, 1, 1, 'copyfrom', '来源', '', '', 0, 100, '', '', 'copyfrom', 'array (\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(80, 1, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0);

INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(22, 2, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(23, 2, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 1, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(24, 2, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(25, 2, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(26, 2, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(27, 2, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(28, 2, 1, 'content', '内容', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>是否获取内容第</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">张图片作为标题图片\r\n</div>', '', 1, 999999, '', '内容不能为空', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(29, 2, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(30, 2, 1, 'relation', '相关文章', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(31, 2, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 1, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(32, 2, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(33, 2, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(34, 2, 1, 'groupids_view', '阅读权限', '', '', 0, 0, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(35, 2, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(36, 2, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(37, 2, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(38, 2, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(39, 2, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(40, 2, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(41, 2, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(42, 2, 1, 'downfiles', '本地下载', '', '', 0, 0, '', '', 'downfiles', 'array (\n  ''upload_allowext'' => ''rar|zip'',\n  ''isselectimage'' => ''0'',\n  ''upload_number'' => ''10'',\n  ''downloadlink'' => ''1'',\n  ''downloadtype'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(43, 2, 1, 'downfile', '镜像下载', '', '', 0, 0, '', '', 'downfile', 'array (\n  ''downloadlink'' => ''1'',\n  ''downloadtype'' => ''1'',\n  ''upload_allowext'' => ''rar|zip'',\n  ''isselectimage'' => ''0'',\n  ''upload_number'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 9, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(44, 2, 1, 'systems', '软件平台', '<select name=''selectSystem'' onchange="ChangeInput(this,document.myform.systems,''/'')">\r\n	<option value=''WinXP''>WinXP</option>\r\n	<option value=''Vista''>Windows 7</option>\r\n	<option value=''Win2000''>Win2000</option>\r\n	<option value=''Win2003''>Win2003</option>\r\n	<option value=''Unix''>Unix</option>\r\n	<option value=''Linux''>Linux</option>\r\n	<option value=''MacOS''>MacOS</option>\r\n</select>', '', 0, 100, '', '', 'text', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => ''Win2000/WinXP/Win2003'',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 0, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(45, 2, 1, 'copytype', '软件授权形式', '', '', 0, 15, '', '', 'box', 'array (\n  ''options'' => ''免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''免费版'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 12, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(46, 2, 1, 'language', '软件语言', '', '', 0, 16, '', '', 'box', 'array (\n  ''options'' => ''英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''简体中文'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(47, 2, 1, 'classtype', '软件类型', '', '', 0, 20, '', '', 'box', 'array (\n  ''options'' => ''国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''国产软件'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 17, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(48, 2, 1, 'version', '版本号', '', '', 0, 20, '', '', 'text', 'array (\n  ''size'' => ''10'',\n  ''defaultvalue'' => '''',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 1, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(49, 2, 1, 'filesize', '文件大小', '', '', 0, 10, '', '', 'text', 'array (\n  ''size'' => ''10'',\n  ''defaultvalue'' => ''未知'',\n  ''ispassword'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 1, 0, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(50, 2, 1, 'stars', '评分等级', '', '', 0, 20, '', '', 'box', 'array (\n  ''options'' => ''★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''cols'' => ''5'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''default_select_value'' => ''★★★☆☆'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 17, 0, 0);

INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(51, 3, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(52, 3, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(53, 3, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(54, 3, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(55, 3, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(56, 3, 1, 'groupids_view', '阅读权限', '', '', 0, 0, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(57, 3, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(58, 3, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', '', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(59, 3, 1, 'relation', '相关组图', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(60, 3, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(61, 3, 1, 'content', '内容', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>是否获取内容第</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">张图片作为标题图片\r\n</div>', '', 0, 999999, '', '', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''1'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(62, 3, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\r\n  ''dateformat'' => ''int'',\r\n  ''format'' => ''Y-m-d H:i:s'',\r\n  ''defaulttype'' => ''1'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(63, 3, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\r\n  ''width'' => ''98'',\r\n  ''height'' => ''46'',\r\n  ''defaultvalue'' => '''',\r\n  ''enablehtml'' => ''0'',\r\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(64, 3, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', '', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(65, 3, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\r\n  ''size'' => ''100'',\r\n  ''defaultvalue'' => '''',\r\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(66, 3, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(67, 3, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(68, 3, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(69, 3, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(70, 3, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', '', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(71, 3, 1, 'pictureurls', '组图', '', '', 0, 0, '', '', 'images', 'array (\n  ''upload_allowext'' => ''gif|jpg|jpeg|png|bmp'',\n  ''isselectimage'' => ''1'',\n  ''upload_number'' => ''50'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 15, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(72, 3, 1, 'copyfrom', '来源', '', '', 0, 0, '', '', 'copyfrom', 'array (\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(73, 1, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(74, 2, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(75, 3, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', '', '', '', '', 0, 1, 0, 0, 0, 1, 0, 0, 30, 0, 0);
INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES(83, 10, 1, 'birthday', '生日', '', '', 0, 0, '', '生日格式错误', 'datetime', 'array (\n  ''fieldtype'' => ''date'',\n  ''format'' => ''Y-m-d'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0);

INSERT INTO `phpcms_model_field` (`fieldid`, `modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`, `isomnipotent`) VALUES
(84, 11, 1, 'catid', '栏目', '', '', 1, 6, '/^[0-9]{1,6}$/', '请选择栏目', 'catid', 'array (\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 0, 0, 1, 0, 0),
(85, 11, 1, 'typeid', '类别', '', '', 0, 0, '', '', 'typeid', 'array (\n  ''minnumber'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '', '', 0, 1, 0, 1, 1, 1, 0, 0, 2, 0, 0),
(86, 11, 1, 'title', '标题', '', 'inputtitle', 1, 80, '', '请输入标题', 'title', 'array (\n)', '', '', '', 0, 1, 0, 1, 1, 1, 1, 1, 4, 0, 0),
(87, 11, 1, 'keywords', '关键词', '多关键词之间用空格或者“,”隔开', '', 0, 40, '', '', 'keyword', 'array (\n  ''size'' => ''100'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 1, 0, 1, 1, 1, 1, 0, 7, 0, 0),
(88, 11, 1, 'description', '摘要', '', '', 0, 255, '', '', 'textarea', 'array (\n  ''width'' => ''98'',\n  ''height'' => ''46'',\n  ''defaultvalue'' => '''',\n  ''enablehtml'' => ''0'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 1, 1, 10, 0, 0),
(89, 11, 1, 'updatetime', '更新时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''dateformat'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''1'',\n  ''defaultvalue'' => '''',\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 12, 0, 0),
(90, 11, 1, 'content', '内容', '<div class="content_attr"><label><input name="add_introduce" type="checkbox"  value="1" checked>是否截取内容</label><input type="text" name="introcude_length" value="200" size="3">字符至内容摘要\r\n<label><input type=''checkbox'' name=''auto_thumb'' value="1" checked>是否获取内容第</label><input type="text" name="auto_thumb_no" value="1" size="2" class="">张图片作为标题图片\r\n</div>', '', 0, 999999, '', '内容不能为空', 'editor', 'array (\n  ''toolbar'' => ''full'',\n  ''defaultvalue'' => '''',\n  ''enablekeylink'' => ''1'',\n  ''replacenum'' => ''2'',\n  ''link_mode'' => ''0'',\n  ''enablesaveimage'' => ''1'',\n  ''height'' => '''',\n  ''disabled_page'' => ''0'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 1, 0, 13, 0, 0),
(91, 11, 1, 'thumb', '缩略图', '', '', 0, 100, '', '', 'image', 'array (\n  ''size'' => ''50'',\n  ''defaultvalue'' => '''',\n  ''show_type'' => ''1'',\n  ''upload_maxsize'' => ''1024'',\n  ''upload_allowext'' => ''jpg|jpeg|gif|png|bmp'',\n  ''watermark'' => ''0'',\n  ''isselectimage'' => ''1'',\n  ''images_width'' => '''',\n  ''images_height'' => '''',\n)', '', '', '', 0, 1, 0, 0, 0, 1, 0, 1, 14, 0, 0),
(92, 11, 1, 'relation', '相关文章', '', '', 0, 0, '', '', 'omnipotent', 'array (\n  ''formtext'' => ''<input type=\\''hidden\\'' name=\\''info[relation]\\'' id=\\''relation\\'' value=\\''{FIELD_VALUE}\\'' style=\\''50\\'' >\r\n<ul class="list-dot" id="relation_text"></ul>\r\n<div>\r\n<input type=\\''button\\'' value="添加相关" onclick="omnipotent(\\''selectid\\'',\\''?m=content&c=content&a=public_relationlist&modelid={MODELID}\\'',\\''添加相关文章\\'',1)" class="button" style="width:66px;">\r\n<span class="edit_content">\r\n<input type=\\''button\\'' value="显示已有" onclick="show_relation({MODELID},{ID})" class="button" style="width:66px;">\r\n</span>\r\n</div>'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n)', '', '2,6,4,5,1,17,18,7', '', 0, 0, 0, 0, 0, 0, 1, 0, 15, 0, 0),
(93, 11, 1, 'pages', '分页方式', '', '', 0, 0, '', '', 'pages', 'array (\n)', '', '-99', '-99', 0, 0, 0, 1, 0, 0, 0, 0, 16, 0, 0),
(94, 11, 1, 'inputtime', '发布时间', '', '', 0, 0, '', '', 'datetime', 'array (\n  ''fieldtype'' => ''int'',\n  ''format'' => ''Y-m-d H:i:s'',\n  ''defaulttype'' => ''0'',\n)', '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 17, 0, 0),
(95, 11, 1, 'posids', '推荐位', '', '', 0, 0, '', '', 'posid', 'array (\n  ''cols'' => ''4'',\n  ''width'' => ''125'',\n)', '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 18, 0, 0),
(96, 11, 1, 'groupids_view', '阅读权限', '', '', 0, 100, '', '', 'groupid', 'array (\n  ''groupids'' => '''',\n)', '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 19, 0, 0),
(97, 11, 1, 'url', 'URL', '', '', 0, 100, '', '', 'text', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 50, 0, 0),
(98, 11, 1, 'listorder', '排序', '', '', 0, 6, '', '', 'number', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 51, 0, 0),
(99, 11, 1, 'template', '内容页模板', '', '', 0, 30, '', '', 'template', 'array (\n  ''size'' => '''',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 53, 0, 0),
(100, 11, 1, 'allow_comment', '允许评论', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''boxtype'' => ''radio'',\n  ''fieldtype'' => ''tinyint'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''88'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''0'',\n)', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 54, 0, 0),
(101, 11, 1, 'status', '状态', '', '', 0, 2, '', '', 'box', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 55, 0, 0),
(102, 11, 1, 'readpoint', '阅读收费', '', '', 0, 5, '', '', 'readpoint', 'array (\n  ''minnumber'' => ''1'',\n  ''maxnumber'' => ''99999'',\n  ''decimaldigits'' => ''0'',\n  ''defaultvalue'' => '''',\n)', '', '-99', '-99', 0, 0, 0, 0, 0, 0, 0, 0, 55, 0, 0),
(103, 11, 1, 'username', '用户名', '', '', 0, 20, '', '', 'text', 'array (\n)', '', '', '', 1, 1, 0, 1, 0, 0, 0, 0, 98, 0, 0),
(104, 11, 1, 'islink', '转向链接', '', '', 0, 0, '', '', 'islink', 'array (\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 20, 0, 0),
(105, 11, 1, 'video', '视频上传', '', '', 0, 0, '', '', 'video', 'array (\n  ''upload_allowext'' => ''flv|rm|mp4|rmv'',\n)', '', '', '', 0, 0, 0, 1, 0, 1, 0, 0, 8, 0, 0),
(106, 11, 1, 'vision', '画质', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''高清|1\r\n普通|2'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''0'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''1'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 9, 0, 0),
(107, 11, 1, 'video_category', '视频分类', '', '', 0, 0, '', '', 'box', 'array (\n  ''options'' => ''喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6'',\n  ''boxtype'' => ''select'',\n  ''fieldtype'' => ''varchar'',\n  ''minnumber'' => ''1'',\n  ''width'' => ''80'',\n  ''size'' => ''1'',\n  ''defaultvalue'' => ''1'',\n  ''outputtype'' => ''1'',\n  ''filtertype'' => ''1'',\n)', '', '', '', 0, 1, 0, 1, 0, 1, 0, 0, 9, 0, 0);

--
-- 会员字段
--

INSERT INTO `phpcms_model_field` (`modelid`, `siteid`, `field`, `name`, `tips`, `css`, `minlength`, `maxlength`, `pattern`, `errortips`, `formtype`, `setting`, `formattribute`, `unsetgroupids`, `unsetroleids`, `iscore`, `issystem`, `isunique`, `isbase`, `issearch`, `isselect`, `iswhere`, `isorder`, `islist`, `isshow`, `isadd`, `isfulltext`, `isposition`, `listorder`, `disabled`) VALUES ('10', '1', 'birthday', '生日', '', '', '0', '0', '', '生日格式错误', 'datetime', 'array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0');

INSERT INTO `phpcms_admin_role` VALUES ('1', '超级管理员', '超级管理员', '0', '0');
INSERT INTO `phpcms_admin_role` VALUES ('2', '站点管理员', '站点管理员', '0', '0');
INSERT INTO `phpcms_admin_role` VALUES ('3', '运营总监', '运营总监', '1', '0');
INSERT INTO `phpcms_admin_role` VALUES ('4', '总编', '总编', '5', '0');
INSERT INTO `phpcms_admin_role` VALUES ('5', '编辑', '编辑', '1', '0');
INSERT INTO `phpcms_admin_role` VALUES ('7', '发布人员', '发布人员', '0', '0');

INSERT INTO `phpcms_site` VALUES ('1', '默认站点', '', 'http://test.phpcms.cn/', 'PHPCMS演示站', 'PHPCMS演示站', 'PHPCMS演示站', '', 'default', 'default', 'array (\n  \'upload_maxsize\' => \'2048\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\',\n  \'watermark_enable\' => \'1\',\n  \'watermark_minwidth\' => \'300\',\n  \'watermark_minheight\' => \'300\',\n  \'watermark_img\' => \'/statics/images/water/mark.png\',\n  \'watermark_pct\' => \'85\',\n  \'watermark_quality\' => \'80\',\n  \'watermark_pos\' => \'9\',\n)', '');

INSERT INTO `phpcms_member_group` VALUES ('8', '游客', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `phpcms_member_group` VALUES ('2', '新手上路', '1', '1', '50', '100', '1', '1', '0', '0', '0', '1', '0', '0', '50.00', '10.00', '1.00', '', '', '', '2', '0');
INSERT INTO `phpcms_member_group` VALUES ('6', '注册会员', '1', '2', '100', '150', '0', '1', '0', '0', '1', '1', '0', '0', '300.00', '30.00', '1.00', '', '', '', '6', '0');
INSERT INTO `phpcms_member_group` VALUES ('4', '中级会员', '1', '3', '150', '500', '1', '1', '0', '1', '1', '1', '0', '0', '500.00', '60.00', '1.00', '', '', '', '4', '0');
INSERT INTO `phpcms_member_group` VALUES ('5', '高级会员', '1', '5', '300', '999', '1', '1', '0', '1', '1', '1', '0', '0', '360.00', '90.00', '5.00', '', '', '', '5', '0');
INSERT INTO `phpcms_member_group` VALUES ('1', '禁止访问', '1', '0', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '0', '0', '0');
INSERT INTO `phpcms_member_group` VALUES ('7', '邮件认证', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', 'images/group/vip.jpg', '#000000', '', '7', '0');

INSERT INTO `phpcms_member_menu` VALUES ('', 'member_init', '0', 'member', 'index', 'init', 't=0', '0', '1', '', '');
INSERT INTO `phpcms_member_menu` VALUES ('', 'account_manage', '0', 'member', 'index', 'account_manage', 't=1', '0', '1', '', '');
INSERT INTO `phpcms_member_menu` VALUES ('', 'favorite', '0', 'member', 'index', 'favorite', 't=2', '0', '1', '', '');

INSERT INTO `phpcms_category` (`catid`, `siteid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`, `usable_type`) VALUES(1, 1, 'content', 1, 0, 0, '0', 1, '1,2,3,5,162', '网站介绍', '', '', '', '', 'about', '/html/about/', 0, 0, 'array (\n  ''ishtml'' => ''1'',\n  ''template_list'' => ''default'',\n  ''page_template'' => ''page'',\n  ''meta_title'' => '''',\n  ''meta_keywords'' => '''',\n  ''meta_description'' => '''',\n  ''category_ruleid'' => ''1'',\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 1, 0, 0, 'wangzhanjieshao', '');

INSERT INTO `phpcms_category` (`catid`, `siteid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`, `usable_type`) VALUES(2, 1, 'content', 1, 0, 1, '0,1', 0, '2', '关于我们', '', '', '', 'about/', 'aboutus', '/html/about/aboutus/', 0, 0, 'array (\n  ''ishtml'' => ''1'',\n  ''template_list'' => ''default'',\n  ''page_template'' => ''page'',\n  ''meta_title'' => ''关于我们'',\n  ''meta_keywords'' => ''关于我们'',\n  ''meta_description'' => ''关于我们'',\n  ''category_ruleid'' => ''1'',\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 1, 1, 0, 'guanyuwomen', '');
INSERT INTO `phpcms_category` (`catid`, `siteid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`, `usable_type`) VALUES(3, 1, 'content', 1, 0, 1, '0,1', 0, '3', '联系方式', '', '', '', 'about/', 'contactus', '/html/about/contactus/', 0, 0, 'array (\n  ''ishtml'' => ''1'',\n  ''template_list'' => ''default'',\n  ''page_template'' => ''page'',\n  ''meta_title'' => ''联系方式'',\n  ''meta_keywords'' => ''联系方式'',\n  ''meta_description'' => ''联系方式'',\n  ''category_ruleid'' => ''1'',\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 2, 1, 0, 'lianxifangshi', '');
INSERT INTO `phpcms_category` (`catid`, `siteid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`, `usable_type`) VALUES(4, 1, 'content', 1, 0, 1, '0,1', 0, '4', '版权声明', '', '', '', 'about/', 'copyright', 'http://test.phpcms.cn/index.php?m=content&c=index&a=lists&catid=4', 0, 0, 'array (\n  ''ishtml'' => ''0'',\n  ''template_list'' => ''default'',\n  ''page_template'' => ''page'',\n  ''meta_title'' => ''版权声明'',\n  ''meta_keywords'' => ''版权声明'',\n  ''meta_description'' => ''版权声明'',\n  ''category_ruleid'' => ''6'',\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 3, 1, 0, 'banquanshengming', '');
INSERT INTO `phpcms_category` (`catid`, `siteid`, `module`, `type`, `modelid`, `parentid`, `arrparentid`, `child`, `arrchildid`, `catname`, `style`, `image`, `description`, `parentdir`, `catdir`, `url`, `items`, `hits`, `setting`, `listorder`, `ismenu`, `sethtml`, `letter`, `usable_type`) VALUES(5, 1, 'content', 1, 0, 1, '0,1', 0, '5', '招聘信息', '', '', '', 'about/', 'hr', '/html/about/hr/', 0, 0, 'array (\n  ''ishtml'' => ''1'',\n  ''template_list'' => ''default'',\n  ''page_template'' => ''page'',\n  ''meta_title'' => '''',\n  ''meta_keywords'' => '''',\n  ''meta_description'' => '''',\n  ''category_ruleid'' => ''1'',\n  ''show_ruleid'' => '''',\n  ''repeatchargedays'' => ''1'',\n)', 4, 1, 0, 'zhaopinxinxi', '');

DROP TABLE IF EXISTS `phpcms_video_content`;
CREATE TABLE IF NOT EXISTS `phpcms_video_content` (
  `contentid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `videoid` (`videoid`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `phpcms_video_store`;
CREATE TABLE IF NOT EXISTS `phpcms_video_store` (
  `videoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(60) NOT NULL,
  `vid` char(40) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `picpath` char(120) NOT NULL,
  `size` char(20) NOT NULL,
  `timelen` mediumint(9) NOT NULL DEFAULT '0',
  `userupload` tinyint(1) NOT NULL DEFAULT '0',
  `channelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`videoid`),
  KEY `videoid` (`videoid`,`status`)
) ENGINE=InnoDB;

INSERT INTO `v9_menu` (`id`, `name`, `parentid`, `m`, `c`, `a`, `data`, `listorder`, `display`, `project1`, `project2`, `project3`, `project4`, `project5`) VALUES
(9, 'video', 0, 'video', 'video', 'init', '', 11, '1', 1, 1, 1, 1, 1),
(1589, 'video', 9, 'video', 'video', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1583, 'sub_delete', 1589, 'video', 'video', 'sub_del', '', 0, '0', 1, 1, 1, 1, 1),
(1582, 'subscribe_manage', 1589, 'video', 'video', 'subscribe_list', '', 0, '1', 1, 1, 1, 1, 1),
(1581, 'video_open', 1589, 'video', 'video', 'open', '', 0, '1', 1, 1, 1, 1, 1),
(1592, 'complete_info', 1581, 'video', 'video', 'complete_info', '', 0, '1', 1, 1, 1, 1, 1),
(1591, 'video_inputinfo', 1581, 'video', 'video', 'open', '', 0, '1', 1, 1, 1, 1, 1),
(1577, 'video_manage', 1589, 'video', 'video', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1590, 'player_manage', 1589, 'video', 'player', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1585, 'import_ku6_video', 1589, 'video', 'video', 'import_ku6video', '', 0, '1', 1, 1, 1, 1, 1),
(1579, 'video_edit', 1589, 'video', 'video', 'edit', '', 0, '0', 1, 1, 1, 1, 1),
(1580, 'video_delete', 1589, 'video', 'video', 'delete', '', 0, '0', 1, 1, 1, 1, 1),
(1578, 'video_upload', 1589, 'video', 'video', 'add', '', 0, '1', 1, 1, 1, 1, 1),
(1593, 'video_stat', 1589, 'video', 'stat', 'init', '', 0, '1', 1, 1, 1, 1, 1),
(1586, 'video_store', 1589, 'video', 'video', 'video2content', '', 0, '0', 1, 1, 1, 1, 1);