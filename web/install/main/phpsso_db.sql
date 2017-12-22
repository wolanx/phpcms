/*
Navicat MySQL Data Transfer

Source Server         : v9
Source Server Version : 50091
Source Host           : 10.228.134.211:3306
Source Database       : phpsso

Target Server Type    : MYSQL
Target Server Version : 50091
File Encoding         : 936

Date: 2010-09-08 14:13:09
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `ps_admin`
-- ----------------------------
DROP TABLE IF EXISTS `ps_admin`;
CREATE TABLE `ps_admin` (
  `id` smallint(6) NOT NULL auto_increment,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) default NULL,
  `issuper` tinyint(1) default '0',
  `lastlogin` int(10) default NULL,
  `ip` char(15) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `ps_applications`
-- ----------------------------
DROP TABLE IF EXISTS `ps_applications`;
CREATE TABLE `ps_applications` (
  `appid` smallint(6) unsigned NOT NULL auto_increment,
  `type` char(16) NOT NULL default '',
  `name` char(20) NOT NULL default '',
  `url` char(255) NOT NULL default '',
  `authkey` char(255) NOT NULL default '',
  `ip` char(15) NOT NULL default '',
  `apifilename` char(30) NOT NULL default 'phpsso.php',
  `charset` char(8) NOT NULL default '',
  `synlogin` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `ps_members`
-- ----------------------------
DROP TABLE IF EXISTS `ps_members`;
CREATE TABLE `ps_members` (
  `uid` int(10) unsigned NOT NULL auto_increment,
  `username` char(20) NOT NULL default '',
  `password` char(32) NOT NULL default '',
  `random` char(8) NOT NULL default '',
  `email` char(32) NOT NULL default '',
  `regip` char(15) NOT NULL default '',
  `regdate` int(10) unsigned NOT NULL default '0',
  `lastip` char(15) NOT NULL default '0',
  `lastdate` int(10) unsigned NOT NULL default '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') default NULL,
  `avatar` tinyint(1) NOT NULL default '0',
  `ucuserid` mediumint(8) unsigned default '0',
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `ps_messagequeue`
-- ----------------------------
DROP TABLE IF EXISTS `ps_messagequeue`;
CREATE TABLE `ps_messagequeue` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL default '0',
  `totalnum` smallint(6) unsigned NOT NULL default '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `appstatus` mediumtext,
  PRIMARY KEY  (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=InnoDB;

-- ----------------------------
-- Table structure for `ps_session`
-- ----------------------------
DROP TABLE IF EXISTS `ps_session`;
CREATE TABLE `ps_session` (
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
-- Table structure for `ps_settings`
-- ----------------------------
DROP TABLE IF EXISTS `ps_settings`;
CREATE TABLE `ps_settings` (
  `name` varchar(32) NOT NULL default '',
  `data` text NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB;

INSERT INTO `ps_settings` VALUES ('denyemail', '');
INSERT INTO `ps_settings` VALUES ('denyusername', '');
INSERT INTO `ps_settings` VALUES ('creditrate', '');
INSERT INTO `ps_settings` VALUES ('sp4', '');
INSERT INTO `ps_settings` VALUES ('ucenter', '');