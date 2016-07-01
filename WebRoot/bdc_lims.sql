/*
Navicat MySQL Data Transfer

Source Server         : .
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : bdc_lims

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2016-04-18 23:50:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bdc_analysiscategory
-- ----------------------------
DROP TABLE IF EXISTS `bdc_analysiscategory`;
CREATE TABLE `bdc_analysiscategory` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `other` varchar(1000) default NULL,
  `deliveryReceitp` int(11) default NULL,
  `inspectionSheet` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_analysiscategory
-- ----------------------------
INSERT INTO `bdc_analysiscategory` VALUES ('1', '废水', '', '1', '1');
INSERT INTO `bdc_analysiscategory` VALUES ('2', '空气', '', '2', '2');
INSERT INTO `bdc_analysiscategory` VALUES ('3', '土壤', '', '3', '3');
INSERT INTO `bdc_analysiscategory` VALUES ('4', '固定', '', '3', '4');

-- ----------------------------
-- Table structure for bdc_analysisedproject_project
-- ----------------------------
DROP TABLE IF EXISTS `bdc_analysisedproject_project`;
CREATE TABLE `bdc_analysisedproject_project` (
  `project_id` bigint(20) NOT NULL,
  `analysisProject_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`project_id`,`analysisProject_id`),
  KEY `FKB64A1B9AE2F08032` (`project_id`),
  KEY `FKB64A1B9ABA2BED92` (`analysisProject_id`),
  CONSTRAINT `FKB64A1B9ABA2BED92` FOREIGN KEY (`analysisProject_id`) REFERENCES `bdc_analysisproject` (`id`),
  CONSTRAINT `FKB64A1B9AE2F08032` FOREIGN KEY (`project_id`) REFERENCES `bdc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_analysisedproject_project
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_analysisfrequency
-- ----------------------------
DROP TABLE IF EXISTS `bdc_analysisfrequency`;
CREATE TABLE `bdc_analysisfrequency` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `other` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_analysisfrequency
-- ----------------------------
INSERT INTO `bdc_analysisfrequency` VALUES ('1', '1次/月', '');
INSERT INTO `bdc_analysisfrequency` VALUES ('2', '1次/年', '');
INSERT INTO `bdc_analysisfrequency` VALUES ('3', '1次/季', '');
INSERT INTO `bdc_analysisfrequency` VALUES ('4', '1次/2年', '');

-- ----------------------------
-- Table structure for bdc_analysisproject
-- ----------------------------
DROP TABLE IF EXISTS `bdc_analysisproject`;
CREATE TABLE `bdc_analysisproject` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `other` varchar(255) default NULL,
  `categoryId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKB26F0BFF91C647B` (`categoryId`),
  CONSTRAINT `FKB26F0BFF91C647B` FOREIGN KEY (`categoryId`) REFERENCES `bdc_analysiscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_analysisproject
-- ----------------------------
INSERT INTO `bdc_analysisproject` VALUES ('1', '空气一', '0', '', '2');
INSERT INTO `bdc_analysisproject` VALUES ('2', '空气二', '0', '', '2');
INSERT INTO `bdc_analysisproject` VALUES ('3', '空气三', '0', '', '2');
INSERT INTO `bdc_analysisproject` VALUES ('4', '空气四', '0', '', '2');
INSERT INTO `bdc_analysisproject` VALUES ('5', '空气五', '0', '', '2');
INSERT INTO `bdc_analysisproject` VALUES ('6', '废水一', '0', '', '1');
INSERT INTO `bdc_analysisproject` VALUES ('7', '废水二', '0', '', '1');
INSERT INTO `bdc_analysisproject` VALUES ('8', '废水三', '0', '', '1');
INSERT INTO `bdc_analysisproject` VALUES ('9', '废水四', '0', '', '1');
INSERT INTO `bdc_analysisproject` VALUES ('10', '土壤一', '0', '', '3');
INSERT INTO `bdc_analysisproject` VALUES ('11', '土壤二', '0', '', '3');
INSERT INTO `bdc_analysisproject` VALUES ('12', '土壤三', '0', '', '3');
INSERT INTO `bdc_analysisproject` VALUES ('13', '土壤四', '0', '', '3');
INSERT INTO `bdc_analysisproject` VALUES ('14', '固定一', '0', '', '4');
INSERT INTO `bdc_analysisproject` VALUES ('15', '固定二', '0', '', '4');
INSERT INTO `bdc_analysisproject` VALUES ('16', '固定三', '0', '', '4');

-- ----------------------------
-- Table structure for bdc_analysisproject_deliveryreceitp
-- ----------------------------
DROP TABLE IF EXISTS `bdc_analysisproject_deliveryreceitp`;
CREATE TABLE `bdc_analysisproject_deliveryreceitp` (
  `deliveryReceitp_id` bigint(20) NOT NULL,
  `analysisProject_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`deliveryReceitp_id`,`analysisProject_id`),
  KEY `FKE6853C9C8C80C932` (`deliveryReceitp_id`),
  KEY `FKE6853C9CBA2BED92` (`analysisProject_id`),
  CONSTRAINT `FKE6853C9C8C80C932` FOREIGN KEY (`deliveryReceitp_id`) REFERENCES `bdc_deliveryreceitp` (`id`),
  CONSTRAINT `FKE6853C9CBA2BED92` FOREIGN KEY (`analysisProject_id`) REFERENCES `bdc_analysisproject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_analysisproject_deliveryreceitp
-- ----------------------------
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('18', '7');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('19', '4');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('19', '16');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('20', '11');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('21', '3');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('21', '4');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('22', '8');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('22', '9');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('23', '12');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('24', '12');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('25', '7');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('29', '11');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('29', '15');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('30', '7');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('30', '8');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('31', '4');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('31', '5');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('50', '3');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('51', '13');
INSERT INTO `bdc_analysisproject_deliveryreceitp` VALUES ('52', '7');

-- ----------------------------
-- Table structure for bdc_analysistype
-- ----------------------------
DROP TABLE IF EXISTS `bdc_analysistype`;
CREATE TABLE `bdc_analysistype` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `desp` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_analysistype
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_authsignator
-- ----------------------------
DROP TABLE IF EXISTS `bdc_authsignator`;
CREATE TABLE `bdc_authsignator` (
  `id` bigint(20) NOT NULL auto_increment,
  `reportType` varchar(255) default NULL,
  `user_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK456F19599EBD9FC2` (`user_id`),
  CONSTRAINT `FK456F19599EBD9FC2` FOREIGN KEY (`user_id`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_authsignator
-- ----------------------------
INSERT INTO `bdc_authsignator` VALUES ('1', '0, 1, 2', '1');
INSERT INTO `bdc_authsignator` VALUES ('3', '2, 3, 4', '2');
INSERT INTO `bdc_authsignator` VALUES ('4', '0, 1, 2, 3, 4', '4');

-- ----------------------------
-- Table structure for bdc_businessregistration
-- ----------------------------
DROP TABLE IF EXISTS `bdc_businessregistration`;
CREATE TABLE `bdc_businessregistration` (
  `id` bigint(20) NOT NULL auto_increment,
  `item` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `contacts` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `time` date default NULL,
  `payment` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_businessregistration
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_commontemplet
-- ----------------------------
DROP TABLE IF EXISTS `bdc_commontemplet`;
CREATE TABLE `bdc_commontemplet` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) default NULL,
  `filesId` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `path` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_commontemplet
-- ----------------------------
INSERT INTO `bdc_commontemplet` VALUES ('1', '23', '21', '24', 'H:/apache-tomcat-7.0.57/webapps/LIMS/commonTemplet/3、BEM-QPBS0407 任  务  书.doc');

-- ----------------------------
-- Table structure for bdc_contactitem
-- ----------------------------
DROP TABLE IF EXISTS `bdc_contactitem`;
CREATE TABLE `bdc_contactitem` (
  `id` bigint(20) NOT NULL auto_increment,
  `siteNum` int(11) default NULL,
  `other` varchar(255) default NULL,
  `analysisProjectId` bigint(20) default NULL,
  `analysisFrequencyId` bigint(20) default NULL,
  `analysisCategoryId` bigint(20) default NULL,
  `contractId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKBAA45475B8AC64F4` (`contractId`),
  KEY `FKBAA4547518545413` (`analysisFrequencyId`),
  KEY `FKBAA454755623344D` (`analysisProjectId`),
  KEY `FKBAA454756F7FB457` (`analysisCategoryId`),
  CONSTRAINT `FKBAA4547518545413` FOREIGN KEY (`analysisFrequencyId`) REFERENCES `bdc_analysisfrequency` (`id`),
  CONSTRAINT `FKBAA454755623344D` FOREIGN KEY (`analysisProjectId`) REFERENCES `bdc_analysisproject` (`id`),
  CONSTRAINT `FKBAA454756F7FB457` FOREIGN KEY (`analysisCategoryId`) REFERENCES `bdc_analysiscategory` (`id`),
  CONSTRAINT `FKBAA45475B8AC64F4` FOREIGN KEY (`contractId`) REFERENCES `bdc_trafficcontract` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_contactitem
-- ----------------------------
INSERT INTO `bdc_contactitem` VALUES ('1', '12', '1', '8', '2', '1', '1');
INSERT INTO `bdc_contactitem` VALUES ('2', '343', '12', '12', '4', '3', '1');
INSERT INTO `bdc_contactitem` VALUES ('3', '343', '12', '4', '1', '2', '1');
INSERT INTO `bdc_contactitem` VALUES ('4', '343', '12', '9', '1', '1', '1');
INSERT INTO `bdc_contactitem` VALUES ('5', '3', '1', '3', '3', '2', '1');
INSERT INTO `bdc_contactitem` VALUES ('6', '12', '32', '7', '2', '1', '2');
INSERT INTO `bdc_contactitem` VALUES ('7', '12', '32', '12', '3', '3', '2');
INSERT INTO `bdc_contactitem` VALUES ('8', '12', '34', '7', '2', '1', '3');
INSERT INTO `bdc_contactitem` VALUES ('9', '1223', '34', '11', '2', '3', '3');
INSERT INTO `bdc_contactitem` VALUES ('10', '12232', '34', '16', '2', '4', '3');
INSERT INTO `bdc_contactitem` VALUES ('11', '122', '34', '4', '2', '2', '3');
INSERT INTO `bdc_contactitem` VALUES ('18', '321', '无备注3', '9', '2', '1', '4');
INSERT INTO `bdc_contactitem` VALUES ('19', '212', '无备12', '10', '4', '3', '4');
INSERT INTO `bdc_contactitem` VALUES ('20', '13', '无备注2', '4', '4', '2', '4');
INSERT INTO `bdc_contactitem` VALUES ('21', '4', '1', '3', '1', '2', '4');
INSERT INTO `bdc_contactitem` VALUES ('22', '12', '无备注', '8', '3', '1', '4');
INSERT INTO `bdc_contactitem` VALUES ('23', '22', '12', '15', '2', '4', '4');
INSERT INTO `bdc_contactitem` VALUES ('66', '12', '32', '7', '4', '1', '12');
INSERT INTO `bdc_contactitem` VALUES ('67', '12', '32', '13', '4', '3', '12');
INSERT INTO `bdc_contactitem` VALUES ('68', '12', '32', '3', '2', '2', '12');
INSERT INTO `bdc_contactitem` VALUES ('69', '12', '3', '3', '1', '2', '13');
INSERT INTO `bdc_contactitem` VALUES ('84', '12', '1', '7', '2', '1', '28');
INSERT INTO `bdc_contactitem` VALUES ('90', '3', '无备注', '5', '4', '2', '34');
INSERT INTO `bdc_contactitem` VALUES ('91', '4', '无备注', '11', '4', '3', '34');
INSERT INTO `bdc_contactitem` VALUES ('92', '2', '无备注', '7', '2', '1', '34');
INSERT INTO `bdc_contactitem` VALUES ('93', '2', '无备注', '8', '2', '1', '34');
INSERT INTO `bdc_contactitem` VALUES ('94', '3', '无备注', '4', '3', '2', '34');
INSERT INTO `bdc_contactitem` VALUES ('95', '1', '无备注', '15', '1', '4', '34');

-- ----------------------------
-- Table structure for bdc_contractaudit
-- ----------------------------
DROP TABLE IF EXISTS `bdc_contractaudit`;
CREATE TABLE `bdc_contractaudit` (
  `id` bigint(20) NOT NULL auto_increment,
  `client` varchar(1000) default NULL,
  `service` varchar(1000) default NULL,
  `contractContext` varchar(1000) default NULL,
  `contractSame` int(11) default NULL,
  `resourceSatisfaction` int(11) default NULL,
  `custSatisfaction` int(11) default NULL,
  `subpackage` int(11) default NULL,
  `subcontractUnit` int(11) default NULL,
  `paymentSatisfaction` int(11) default NULL,
  `timeSatisfaction` int(11) default NULL,
  `other` varchar(2000) default NULL,
  `auditResult` varchar(1000) default NULL,
  `project_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `project_id` (`project_id`),
  KEY `FK6EF9068BE2F08032` (`project_id`),
  CONSTRAINT `FK6EF9068BE2F08032` FOREIGN KEY (`project_id`) REFERENCES `bdc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_contractaudit
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_contractchange
-- ----------------------------
DROP TABLE IF EXISTS `bdc_contractchange`;
CREATE TABLE `bdc_contractchange` (
  `id` bigint(20) NOT NULL auto_increment,
  `changeDate` date default NULL,
  `reason` varchar(1000) default NULL,
  `changeColumn` varchar(255) default NULL,
  `context` varchar(2000) default NULL,
  `reAudit` int(11) default NULL,
  `other` varchar(1000) default NULL,
  `serviceContract_id` bigint(20) default NULL,
  `projectId` bigint(20) default NULL,
  `changerId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK72D8FF002305D225` (`projectId`),
  KEY `FK72D8FF00FE407910` (`changerId`),
  KEY `FK72D8FF00AA720592` (`serviceContract_id`),
  CONSTRAINT `FK72D8FF002305D225` FOREIGN KEY (`projectId`) REFERENCES `bdc_project` (`id`),
  CONSTRAINT `FK72D8FF00AA720592` FOREIGN KEY (`serviceContract_id`) REFERENCES `bdc_servicecontract` (`id`),
  CONSTRAINT `FK72D8FF00FE407910` FOREIGN KEY (`changerId`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_contractchange
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_customer
-- ----------------------------
DROP TABLE IF EXISTS `bdc_customer`;
CREATE TABLE `bdc_customer` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `curType` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `entryTime` date default NULL,
  `leaguer` varchar(255) default NULL,
  `linkMan` varchar(255) default NULL,
  `linkManPosition` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `workTel` varchar(255) default NULL,
  `roleId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `identify` (`identify`),
  KEY `FKBD4491FC70588E6F` (`roleId`),
  CONSTRAINT `FKBD4491FC70588E6F` FOREIGN KEY (`roleId`) REFERENCES `bdc_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_customer
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_deliveryreceitp
-- ----------------------------
DROP TABLE IF EXISTS `bdc_deliveryreceitp`;
CREATE TABLE `bdc_deliveryreceitp` (
  `id` bigint(20) NOT NULL auto_increment,
  `samplesType` int(11) default NULL,
  `samplingDate` date default NULL,
  `monitoringType` varchar(255) default NULL,
  `itemNum` int(11) default NULL,
  `transferDate` date default NULL,
  `backDate` date default NULL,
  `transferUser` bigint(20) default NULL,
  `receiverUser` bigint(20) default NULL,
  `backUser` bigint(20) default NULL,
  `projectId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK2E68443E7A90F7ED` (`receiverUser`),
  KEY `FK2E68443E27CE67E9` (`transferUser`),
  KEY `FK2E68443E2305D225` (`projectId`),
  KEY `FK2E68443E25FCD6E5` (`backUser`),
  CONSTRAINT `FK2E68443E2305D225` FOREIGN KEY (`projectId`) REFERENCES `bdc_project` (`id`),
  CONSTRAINT `FK2E68443E25FCD6E5` FOREIGN KEY (`backUser`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK2E68443E27CE67E9` FOREIGN KEY (`transferUser`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK2E68443E7A90F7ED` FOREIGN KEY (`receiverUser`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_deliveryreceitp
-- ----------------------------
INSERT INTO `bdc_deliveryreceitp` VALUES ('18', '1', '2016-03-23', '委托监测', '1', '2016-03-25', null, '1', '1', null, '3');
INSERT INTO `bdc_deliveryreceitp` VALUES ('19', '2', '2016-03-23', '委托监测', '2', '2016-03-25', null, '1', '1', null, '3');
INSERT INTO `bdc_deliveryreceitp` VALUES ('20', '0', '2016-03-23', '委托监测', '2', '2016-03-25', null, '1', '1', null, '3');
INSERT INTO `bdc_deliveryreceitp` VALUES ('21', '2', '2016-04-01', '验收监测', '2', '2016-03-25', null, '1', '1', null, '1');
INSERT INTO `bdc_deliveryreceitp` VALUES ('22', '1', '2016-04-01', '验收监测', '2', '2016-03-25', null, '1', '1', null, '1');
INSERT INTO `bdc_deliveryreceitp` VALUES ('23', '0', '2016-04-01', '验收监测', '2', '2016-03-25', null, '1', '1', null, '1');
INSERT INTO `bdc_deliveryreceitp` VALUES ('24', '0', '2016-03-23', '委托监测', '0', '2016-03-25', null, '1', null, null, '2');
INSERT INTO `bdc_deliveryreceitp` VALUES ('25', '1', '2016-03-23', '委托监测', '1', '2016-03-25', null, '1', null, null, '2');
INSERT INTO `bdc_deliveryreceitp` VALUES ('29', '0', '2016-04-05', '验收监测', '2', '2016-04-06', null, '1', '1', null, '7');
INSERT INTO `bdc_deliveryreceitp` VALUES ('30', '1', '2016-04-05', '验收监测', '2', '2016-04-06', null, '1', '1', null, '7');
INSERT INTO `bdc_deliveryreceitp` VALUES ('31', '2', '2016-04-05', '验收监测', '2', '2016-04-06', null, '1', '1', null, '7');
INSERT INTO `bdc_deliveryreceitp` VALUES ('50', '2', '2016-04-09', '验收监测', '1', '2016-04-08', null, '1', '1', null, '4');
INSERT INTO `bdc_deliveryreceitp` VALUES ('51', '0', '2016-04-09', '验收监测', '1', '2016-04-08', null, '1', '1', null, '4');
INSERT INTO `bdc_deliveryreceitp` VALUES ('52', '1', '2016-04-09', '验收监测', '1', '2016-04-08', null, '1', '1', null, '4');

-- ----------------------------
-- Table structure for bdc_delivery_nonselfsendsampleinfo
-- ----------------------------
DROP TABLE IF EXISTS `bdc_delivery_nonselfsendsampleinfo`;
CREATE TABLE `bdc_delivery_nonselfsendsampleinfo` (
  `delivery_id` bigint(20) NOT NULL,
  `nonSelfSendSample_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`delivery_id`,`nonSelfSendSample_id`),
  KEY `FKE5DB14CCA3F6AE7A` (`delivery_id`),
  KEY `FKE5DB14CCD8B8E952` (`nonSelfSendSample_id`),
  CONSTRAINT `FKE5DB14CCA3F6AE7A` FOREIGN KEY (`delivery_id`) REFERENCES `bdc_deliveryreceitp` (`id`),
  CONSTRAINT `FKE5DB14CCD8B8E952` FOREIGN KEY (`nonSelfSendSample_id`) REFERENCES `bdc_nonselfsendsampleinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_delivery_nonselfsendsampleinfo
-- ----------------------------
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('50', '41');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('50', '42');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('50', '43');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('50', '44');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('50', '45');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('51', '39');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('51', '40');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('51', '43');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('51', '44');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('52', '37');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('52', '38');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('52', '43');
INSERT INTO `bdc_delivery_nonselfsendsampleinfo` VALUES ('52', '45');

-- ----------------------------
-- Table structure for bdc_delivery_selfsendsampleinfo
-- ----------------------------
DROP TABLE IF EXISTS `bdc_delivery_selfsendsampleinfo`;
CREATE TABLE `bdc_delivery_selfsendsampleinfo` (
  `delivery_id` bigint(20) NOT NULL,
  `selfSendSampleInf_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`delivery_id`,`selfSendSampleInf_id`),
  UNIQUE KEY `selfSendSampleInf_id` (`selfSendSampleInf_id`),
  KEY `FKEE059CD9A3F6AE7A` (`delivery_id`),
  KEY `FKEE059CD9A266CCAB` (`selfSendSampleInf_id`),
  CONSTRAINT `FKEE059CD9A266CCAB` FOREIGN KEY (`selfSendSampleInf_id`) REFERENCES `bdc_selfsendsampleinfo` (`id`),
  CONSTRAINT `FKEE059CD9A3F6AE7A` FOREIGN KEY (`delivery_id`) REFERENCES `bdc_deliveryreceitp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_delivery_selfsendsampleinfo
-- ----------------------------
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('18', '3');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('20', '4');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('19', '5');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('19', '6');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('30', '45');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('30', '46');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('30', '47');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('29', '48');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('31', '56');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('31', '57');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('31', '58');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('29', '59');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('29', '60');
INSERT INTO `bdc_delivery_selfsendsampleinfo` VALUES ('29', '61');

-- ----------------------------
-- Table structure for bdc_department
-- ----------------------------
DROP TABLE IF EXISTS `bdc_department`;
CREATE TABLE `bdc_department` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `identify` varchar(255) NOT NULL,
  `desp` varchar(255) default NULL,
  `managerId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `identify` (`identify`),
  UNIQUE KEY `managerId` (`managerId`),
  KEY `FKF3545F08B452BE6` (`managerId`),
  CONSTRAINT `FKF3545F08B452BE6` FOREIGN KEY (`managerId`) REFERENCES `bdc_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_department
-- ----------------------------
INSERT INTO `bdc_department` VALUES ('1', '管理员组', 'BM0000', '系统管理员分组', null);
INSERT INTO `bdc_department` VALUES ('2', '综合办公室', 'BM0001', '', null);
INSERT INTO `bdc_department` VALUES ('3', '现场采样室', 'BM0002', '', null);
INSERT INTO `bdc_department` VALUES ('4', '质量控制室', 'BM0003', '', null);
INSERT INTO `bdc_department` VALUES ('5', '实验分析室', 'BM0004', '', null);

-- ----------------------------
-- Table structure for bdc_device
-- ----------------------------
DROP TABLE IF EXISTS `bdc_device`;
CREATE TABLE `bdc_device` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `timeBuying` date default NULL,
  `coreDesp` varchar(255) default NULL,
  `commonlyUserdParts` varchar(255) default NULL,
  `technicalDocument` varchar(255) default NULL,
  `adminId` bigint(20) default NULL,
  `custodianId` bigint(20) default NULL,
  `supplierId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `identify` (`identify`),
  KEY `FKECC81FF42EB86D3C` (`custodianId`),
  KEY `FKECC81FF463952A5D` (`adminId`),
  KEY `FKECC81FF4E88CD5AD` (`supplierId`),
  CONSTRAINT `FKECC81FF42EB86D3C` FOREIGN KEY (`custodianId`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FKECC81FF463952A5D` FOREIGN KEY (`adminId`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FKECC81FF4E88CD5AD` FOREIGN KEY (`supplierId`) REFERENCES `bdc_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_device
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_encode
-- ----------------------------
DROP TABLE IF EXISTS `bdc_encode`;
CREATE TABLE `bdc_encode` (
  `id` bigint(20) NOT NULL auto_increment,
  `contracId` int(11) NOT NULL,
  `selfSendSample` int(11) default NULL,
  `airReport` int(11) default NULL,
  `voiceReport` int(11) default NULL,
  `waterReport` int(11) default NULL,
  `soilReport` int(11) default NULL,
  `smokeReport` int(11) default NULL,
  `nonSelfSendSample` int(11) default NULL,
  `nonSelfSendSamplePre` varchar(255) default NULL,
  `userId` int(11) default NULL,
  `department` int(11) default NULL,
  `role` int(11) default NULL,
  `analysisType` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_encode
-- ----------------------------
INSERT INTO `bdc_encode` VALUES ('1', '32', '62', '4', '1', '1', '3', '3', '45', 'A', '15', '4', '6', '0');

-- ----------------------------
-- Table structure for bdc_feedback
-- ----------------------------
DROP TABLE IF EXISTS `bdc_feedback`;
CREATE TABLE `bdc_feedback` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` date default NULL,
  `context` varchar(2000) default NULL,
  `type` int(11) default NULL,
  `refer` int(11) default NULL,
  `referContext` varchar(2000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_historylogin
-- ----------------------------
DROP TABLE IF EXISTS `bdc_historylogin`;
CREATE TABLE `bdc_historylogin` (
  `id` bigint(20) NOT NULL auto_increment,
  `user` bigint(20) default NULL,
  `ip` varchar(1000) default NULL,
  `state` int(11) default NULL,
  `startDate` varchar(1000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKD8EFAA53A7B99D7E` (`user`),
  CONSTRAINT `FKD8EFAA53A7B99D7E` FOREIGN KEY (`user`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_historylogin
-- ----------------------------
INSERT INTO `bdc_historylogin` VALUES ('1', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-22 20:38:43');
INSERT INTO `bdc_historylogin` VALUES ('2', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-22 23:01:50');
INSERT INTO `bdc_historylogin` VALUES ('3', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-22 23:26:48');
INSERT INTO `bdc_historylogin` VALUES ('4', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-23 19:43:01');
INSERT INTO `bdc_historylogin` VALUES ('5', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-23 20:11:30');
INSERT INTO `bdc_historylogin` VALUES ('6', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-23 22:11:19');
INSERT INTO `bdc_historylogin` VALUES ('7', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-24 20:15:08');
INSERT INTO `bdc_historylogin` VALUES ('8', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-24 20:25:53');
INSERT INTO `bdc_historylogin` VALUES ('9', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-24 21:38:14');
INSERT INTO `bdc_historylogin` VALUES ('10', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-25 15:42:14');
INSERT INTO `bdc_historylogin` VALUES ('11', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-25 20:10:25');
INSERT INTO `bdc_historylogin` VALUES ('12', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-25 20:29:17');
INSERT INTO `bdc_historylogin` VALUES ('13', '7', '0:0:0:0:0:0:0:1', '1', '2016-03-25 21:37:19');
INSERT INTO `bdc_historylogin` VALUES ('14', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-25 22:00:54');
INSERT INTO `bdc_historylogin` VALUES ('15', '7', '0:0:0:0:0:0:0:1', '1', '2016-03-25 22:01:09');
INSERT INTO `bdc_historylogin` VALUES ('16', '7', '0:0:0:0:0:0:0:1', '1', '2016-03-25 22:51:25');
INSERT INTO `bdc_historylogin` VALUES ('17', '7', '0:0:0:0:0:0:0:1', '1', '2016-03-26 00:07:26');
INSERT INTO `bdc_historylogin` VALUES ('18', '1', '0:0:0:0:0:0:0:1', '1', '2016-03-31 20:47:20');
INSERT INTO `bdc_historylogin` VALUES ('19', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-04 22:56:12');
INSERT INTO `bdc_historylogin` VALUES ('20', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-04 22:57:01');
INSERT INTO `bdc_historylogin` VALUES ('21', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-04 23:58:50');
INSERT INTO `bdc_historylogin` VALUES ('22', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-04 23:59:04');
INSERT INTO `bdc_historylogin` VALUES ('23', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 00:07:17');
INSERT INTO `bdc_historylogin` VALUES ('24', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 06:56:05');
INSERT INTO `bdc_historylogin` VALUES ('25', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 07:31:00');
INSERT INTO `bdc_historylogin` VALUES ('26', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 19:43:52');
INSERT INTO `bdc_historylogin` VALUES ('27', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 19:50:00');
INSERT INTO `bdc_historylogin` VALUES ('28', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 20:01:01');
INSERT INTO `bdc_historylogin` VALUES ('29', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 20:28:46');
INSERT INTO `bdc_historylogin` VALUES ('30', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 20:43:22');
INSERT INTO `bdc_historylogin` VALUES ('31', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 20:47:30');
INSERT INTO `bdc_historylogin` VALUES ('32', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 21:57:55');
INSERT INTO `bdc_historylogin` VALUES ('33', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 22:16:01');
INSERT INTO `bdc_historylogin` VALUES ('34', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 22:56:24');
INSERT INTO `bdc_historylogin` VALUES ('35', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-05 23:07:08');
INSERT INTO `bdc_historylogin` VALUES ('36', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-06 08:05:18');
INSERT INTO `bdc_historylogin` VALUES ('37', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-06 19:50:36');
INSERT INTO `bdc_historylogin` VALUES ('38', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-06 22:43:18');
INSERT INTO `bdc_historylogin` VALUES ('39', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-07 20:04:32');
INSERT INTO `bdc_historylogin` VALUES ('40', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-07 20:39:44');
INSERT INTO `bdc_historylogin` VALUES ('41', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-07 21:50:21');
INSERT INTO `bdc_historylogin` VALUES ('42', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-07 22:49:10');
INSERT INTO `bdc_historylogin` VALUES ('43', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-07 23:07:45');
INSERT INTO `bdc_historylogin` VALUES ('44', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-08 20:06:11');
INSERT INTO `bdc_historylogin` VALUES ('45', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-08 21:36:19');
INSERT INTO `bdc_historylogin` VALUES ('46', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-08 23:28:00');
INSERT INTO `bdc_historylogin` VALUES ('47', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-09 08:11:21');
INSERT INTO `bdc_historylogin` VALUES ('48', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-09 19:25:15');
INSERT INTO `bdc_historylogin` VALUES ('49', '7', '0:0:0:0:0:0:0:1', '1', '2016-04-09 19:27:11');
INSERT INTO `bdc_historylogin` VALUES ('50', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-09 19:27:51');
INSERT INTO `bdc_historylogin` VALUES ('51', '7', '0:0:0:0:0:0:0:1', '1', '2016-04-09 19:28:27');
INSERT INTO `bdc_historylogin` VALUES ('52', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-09 19:55:48');
INSERT INTO `bdc_historylogin` VALUES ('53', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-09 21:45:51');
INSERT INTO `bdc_historylogin` VALUES ('54', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-10 08:53:01');
INSERT INTO `bdc_historylogin` VALUES ('55', '7', '0:0:0:0:0:0:0:1', '1', '2016-04-10 10:27:29');
INSERT INTO `bdc_historylogin` VALUES ('56', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-10 12:19:13');
INSERT INTO `bdc_historylogin` VALUES ('57', '7', '0:0:0:0:0:0:0:1', '1', '2016-04-10 12:19:34');
INSERT INTO `bdc_historylogin` VALUES ('58', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-10 12:42:46');
INSERT INTO `bdc_historylogin` VALUES ('59', '7', '0:0:0:0:0:0:0:1', '1', '2016-04-10 12:42:55');
INSERT INTO `bdc_historylogin` VALUES ('60', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-10 16:33:24');
INSERT INTO `bdc_historylogin` VALUES ('61', '7', '0:0:0:0:0:0:0:1', '1', '2016-04-10 16:33:32');
INSERT INTO `bdc_historylogin` VALUES ('62', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-10 18:43:09');
INSERT INTO `bdc_historylogin` VALUES ('63', '7', '0:0:0:0:0:0:0:1', '1', '2016-04-10 18:43:20');
INSERT INTO `bdc_historylogin` VALUES ('64', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-10 19:27:14');
INSERT INTO `bdc_historylogin` VALUES ('65', '7', '0:0:0:0:0:0:0:1', '1', '2016-04-10 19:28:36');
INSERT INTO `bdc_historylogin` VALUES ('66', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-10 21:30:33');
INSERT INTO `bdc_historylogin` VALUES ('67', '7', '0:0:0:0:0:0:0:1', '1', '2016-04-10 21:30:42');
INSERT INTO `bdc_historylogin` VALUES ('68', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-10 22:30:48');
INSERT INTO `bdc_historylogin` VALUES ('69', '7', '0:0:0:0:0:0:0:1', '1', '2016-04-10 22:30:59');
INSERT INTO `bdc_historylogin` VALUES ('70', '7', '0:0:0:0:0:0:0:1', '0', '2016-04-11 20:34:57');
INSERT INTO `bdc_historylogin` VALUES ('71', '8', '0:0:0:0:0:0:0:1', '0', '2016-04-11 20:43:58');
INSERT INTO `bdc_historylogin` VALUES ('72', '9', '0:0:0:0:0:0:0:1', '0', '2016-04-11 20:46:11');
INSERT INTO `bdc_historylogin` VALUES ('73', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-11 21:53:11');
INSERT INTO `bdc_historylogin` VALUES ('74', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-12 07:19:03');
INSERT INTO `bdc_historylogin` VALUES ('75', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-12 19:59:16');
INSERT INTO `bdc_historylogin` VALUES ('76', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-12 21:11:21');
INSERT INTO `bdc_historylogin` VALUES ('77', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-12 21:51:51');
INSERT INTO `bdc_historylogin` VALUES ('78', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 07:08:20');
INSERT INTO `bdc_historylogin` VALUES ('79', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 19:36:21');
INSERT INTO `bdc_historylogin` VALUES ('80', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 20:23:05');
INSERT INTO `bdc_historylogin` VALUES ('81', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 20:34:33');
INSERT INTO `bdc_historylogin` VALUES ('82', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 20:41:50');
INSERT INTO `bdc_historylogin` VALUES ('83', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 21:50:09');
INSERT INTO `bdc_historylogin` VALUES ('84', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 22:15:51');
INSERT INTO `bdc_historylogin` VALUES ('85', '3', '0:0:0:0:0:0:0:1', '1', '2016-04-13 22:50:19');
INSERT INTO `bdc_historylogin` VALUES ('86', '2', '0:0:0:0:0:0:0:1', '1', '2016-04-13 22:50:28');
INSERT INTO `bdc_historylogin` VALUES ('87', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 22:50:35');
INSERT INTO `bdc_historylogin` VALUES ('88', '3', '0:0:0:0:0:0:0:1', '0', '2016-04-13 22:51:44');
INSERT INTO `bdc_historylogin` VALUES ('89', '4', '0:0:0:0:0:0:0:1', '1', '2016-04-13 22:53:51');
INSERT INTO `bdc_historylogin` VALUES ('90', '2', '0:0:0:0:0:0:0:1', '1', '2016-04-13 22:54:02');
INSERT INTO `bdc_historylogin` VALUES ('91', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 22:59:45');
INSERT INTO `bdc_historylogin` VALUES ('92', '2', '0:0:0:0:0:0:0:1', '1', '2016-04-13 23:02:51');
INSERT INTO `bdc_historylogin` VALUES ('93', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 23:03:08');
INSERT INTO `bdc_historylogin` VALUES ('94', '4', '0:0:0:0:0:0:0:1', '0', '2016-04-13 23:03:31');
INSERT INTO `bdc_historylogin` VALUES ('95', '2', '0:0:0:0:0:0:0:1', '1', '2016-04-13 23:04:08');
INSERT INTO `bdc_historylogin` VALUES ('96', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 23:04:29');
INSERT INTO `bdc_historylogin` VALUES ('97', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 23:43:33');
INSERT INTO `bdc_historylogin` VALUES ('98', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 23:43:57');
INSERT INTO `bdc_historylogin` VALUES ('99', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 23:55:34');
INSERT INTO `bdc_historylogin` VALUES ('100', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-13 23:56:43');
INSERT INTO `bdc_historylogin` VALUES ('101', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-14 07:20:30');
INSERT INTO `bdc_historylogin` VALUES ('102', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-17 09:00:44');
INSERT INTO `bdc_historylogin` VALUES ('103', '2', '0:0:0:0:0:0:0:1', '1', '2016-04-17 11:15:05');
INSERT INTO `bdc_historylogin` VALUES ('104', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-17 11:22:23');
INSERT INTO `bdc_historylogin` VALUES ('105', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-17 12:14:57');
INSERT INTO `bdc_historylogin` VALUES ('106', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-17 12:15:15');
INSERT INTO `bdc_historylogin` VALUES ('107', '2', '0:0:0:0:0:0:0:1', '0', '2016-04-17 12:20:23');
INSERT INTO `bdc_historylogin` VALUES ('108', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-18 22:14:54');
INSERT INTO `bdc_historylogin` VALUES ('109', '1', '0:0:0:0:0:0:0:1', '1', '2016-04-18 22:26:58');
INSERT INTO `bdc_historylogin` VALUES ('110', '1', '0:0:0:0:0:0:0:1', '0', '2016-04-18 22:27:31');

-- ----------------------------
-- Table structure for bdc_inspectionsheet
-- ----------------------------
DROP TABLE IF EXISTS `bdc_inspectionsheet`;
CREATE TABLE `bdc_inspectionsheet` (
  `id` bigint(20) NOT NULL auto_increment,
  `sheetType` int(11) default NULL,
  `samplingDate` date default NULL,
  `sendSample` date default NULL,
  `other` varchar(255) default NULL,
  `analysisDate` date default NULL,
  `sendUser` bigint(20) default NULL,
  `receiver` bigint(20) default NULL,
  `analyst` bigint(20) default NULL,
  `review` bigint(20) default NULL,
  `audit` bigint(20) default NULL,
  `projectId` bigint(20) default NULL,
  `analysisProject_item` bigint(20) default NULL,
  `resultPath` varchar(1000) default NULL,
  `step` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK8731986DF1EC6906` (`sendUser`),
  KEY `FK8731986D5BFEB30A` (`analysisProject_item`),
  KEY `FK8731986D73FE0E35` (`analyst`),
  KEY `FK8731986D2305D225` (`projectId`),
  KEY `FK8731986DAD104D8E` (`audit`),
  KEY `FK8731986D6FD1A90B` (`review`),
  KEY `FK8731986D774E9BA2` (`receiver`),
  CONSTRAINT `FK8731986D2305D225` FOREIGN KEY (`projectId`) REFERENCES `bdc_project` (`id`),
  CONSTRAINT `FK8731986D5BFEB30A` FOREIGN KEY (`analysisProject_item`) REFERENCES `bdc_analysisproject` (`id`),
  CONSTRAINT `FK8731986D6FD1A90B` FOREIGN KEY (`review`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK8731986D73FE0E35` FOREIGN KEY (`analyst`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK8731986D774E9BA2` FOREIGN KEY (`receiver`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK8731986DAD104D8E` FOREIGN KEY (`audit`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK8731986DF1EC6906` FOREIGN KEY (`sendUser`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_inspectionsheet
-- ----------------------------
INSERT INTO `bdc_inspectionsheet` VALUES ('17', '1', '2016-03-23', '2016-03-25', null, null, '1', '1', '7', '11', '7', '3', '11', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('18', '2', '2016-03-23', '2016-03-25', null, null, '1', '1', '7', '11', '7', '3', '16', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('19', '3', '2016-03-23', '2016-03-25', null, null, '1', '1', '7', '11', '7', '3', '4', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('20', '0', '2016-03-23', '2016-03-25', null, null, '1', '1', '7', '11', '7', '3', '7', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('21', '1', '2016-04-01', '2016-03-25', null, null, '1', '1', '11', '11', '7', '1', '12', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('22', '3', '2016-04-01', '2016-03-25', null, null, '1', '1', '7', '11', '7', '1', '4', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('23', '0', '2016-04-01', '2016-03-25', null, null, '1', '1', '7', '11', '7', '1', '8', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('24', '3', '2016-04-01', '2016-03-25', null, null, '1', '1', '7', '11', '7', '1', '3', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('25', '0', '2016-04-01', '2016-03-25', null, null, '1', '1', '7', '11', '7', '1', '9', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('26', '1', '2016-03-23', '2016-03-25', null, null, '1', null, null, null, null, '2', '12', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('27', '0', '2016-03-23', '2016-03-25', null, null, '1', null, null, null, null, '2', '7', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('34', '1', '2016-04-05', '2016-04-06', null, null, '1', '1', '7', '8', '9', '7', '11', 'originalRecordSave/a8b295668afef20f8e8f07008a662ba6', '4');
INSERT INTO `bdc_inspectionsheet` VALUES ('35', '3', '2016-04-05', '2016-04-06', null, null, '1', '1', '7', '8', '9', '7', '4', 'originalRecordSave/3c2ee698369d62efcdaad4c1c251063e', '4');
INSERT INTO `bdc_inspectionsheet` VALUES ('36', '3', '2016-04-05', '2016-04-06', null, null, '1', '1', '7', '8', '9', '7', '5', 'originalRecordSave/a8b295668afef20f8e8f07008a662ba6', '4');
INSERT INTO `bdc_inspectionsheet` VALUES ('37', '2', '2016-04-05', '2016-04-06', null, null, '1', '1', '7', '8', '9', '7', '15', 'originalRecordSave/50f678564e4dc9a91842e173f4213f41', '4');
INSERT INTO `bdc_inspectionsheet` VALUES ('38', '0', '2016-04-05', '2016-04-06', null, null, '1', '1', '7', '8', '9', '7', '8', 'originalRecordSave/50f678564e4dc9a91842e173f4213f41', '4');
INSERT INTO `bdc_inspectionsheet` VALUES ('39', '0', '2016-04-05', '2016-04-06', null, null, '1', '1', '7', '8', '9', '7', '7', 'originalRecordSave/b96708f152c6ad5b4b63eb67f9457fe4', '4');
INSERT INTO `bdc_inspectionsheet` VALUES ('40', '1', '2016-04-09', '2016-04-08', null, null, '1', '1', '7', '8', '9', '4', '13', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('41', '3', '2016-04-09', '2016-04-08', null, null, '1', '1', '7', '8', '9', '4', '3', null, '0');
INSERT INTO `bdc_inspectionsheet` VALUES ('42', '0', '2016-04-09', '2016-04-08', null, null, '1', '1', '7', '8', '9', '4', '7', null, '0');

-- ----------------------------
-- Table structure for bdc_inspectionsheet_air
-- ----------------------------
DROP TABLE IF EXISTS `bdc_inspectionsheet_air`;
CREATE TABLE `bdc_inspectionsheet_air` (
  `type_id` bigint(20) NOT NULL,
  `analysisResult` double default NULL,
  `standardVolume` double default NULL,
  `concentration` double default NULL,
  PRIMARY KEY  (`type_id`),
  KEY `FKEAD1CA58D2982AD9` (`type_id`),
  CONSTRAINT `FKEAD1CA58D2982AD9` FOREIGN KEY (`type_id`) REFERENCES `bdc_inspectionsheet_result` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_inspectionsheet_air
-- ----------------------------
INSERT INTO `bdc_inspectionsheet_air` VALUES ('21', '0', '0', '0');
INSERT INTO `bdc_inspectionsheet_air` VALUES ('24', '0', '0', '0');
INSERT INTO `bdc_inspectionsheet_air` VALUES ('26', '0', '0', '0');
INSERT INTO `bdc_inspectionsheet_air` VALUES ('46', '78', '90', '4523');
INSERT INTO `bdc_inspectionsheet_air` VALUES ('47', '12', '34', '56');
INSERT INTO `bdc_inspectionsheet_air` VALUES ('48', '1', '2', '3');
INSERT INTO `bdc_inspectionsheet_air` VALUES ('49', '4', '5', '6');
INSERT INTO `bdc_inspectionsheet_air` VALUES ('59', '53.3', '4.4', '5.5');
INSERT INTO `bdc_inspectionsheet_air` VALUES ('60', '1', '2.2', '3.3');
INSERT INTO `bdc_inspectionsheet_air` VALUES ('61', '4.4', '5.5', '6.6');
INSERT INTO `bdc_inspectionsheet_air` VALUES ('62', '2.2', '3.3', '4.4');
INSERT INTO `bdc_inspectionsheet_air` VALUES ('63', '7.7', '8.8', '9.9');

-- ----------------------------
-- Table structure for bdc_inspectionsheet_result
-- ----------------------------
DROP TABLE IF EXISTS `bdc_inspectionsheet_result`;
CREATE TABLE `bdc_inspectionsheet_result` (
  `id` bigint(20) NOT NULL auto_increment,
  `sampleInfo_Id` bigint(20) default NULL,
  `nonSampleInfo_Id` bigint(20) default NULL,
  `inspectionSheet` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK86F1482FF60AEEB8` (`nonSampleInfo_Id`),
  KEY `FK86F1482F841BDED6` (`sampleInfo_Id`),
  KEY `FK86F1482F532B39CE` (`inspectionSheet`),
  CONSTRAINT `FK86F1482F532B39CE` FOREIGN KEY (`inspectionSheet`) REFERENCES `bdc_inspectionsheet` (`id`),
  CONSTRAINT `FK86F1482F841BDED6` FOREIGN KEY (`sampleInfo_Id`) REFERENCES `bdc_selfsendsampleinfo` (`id`),
  CONSTRAINT `FK86F1482FF60AEEB8` FOREIGN KEY (`nonSampleInfo_Id`) REFERENCES `bdc_nonselfsendsampleinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_inspectionsheet_result
-- ----------------------------
INSERT INTO `bdc_inspectionsheet_result` VALUES ('19', '4', null, '17');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('20', '6', null, '18');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('21', '5', null, '19');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('22', '3', null, '20');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('23', null, '34', '21');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('24', null, '30', '22');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('25', null, '29', '23');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('26', null, '31', '24');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('27', null, '32', '25');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('28', null, '33', '25');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('29', null, '36', '26');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('30', null, '35', '27');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('43', '60', null, '34');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('44', '48', null, '34');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('45', '61', null, '34');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('46', '58', null, '35');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('47', '57', null, '35');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('48', '56', null, '36');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('49', '58', null, '36');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('50', '59', null, '37');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('51', '47', null, '38');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('52', '46', null, '38');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('53', '47', null, '39');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('54', '45', null, '39');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('55', null, '43', '40');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('56', null, '44', '40');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('57', null, '39', '40');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('58', null, '40', '40');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('59', null, '43', '41');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('60', null, '45', '41');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('61', null, '44', '41');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('62', null, '41', '41');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('63', null, '42', '41');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('64', null, '37', '42');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('65', null, '38', '42');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('66', null, '45', '42');
INSERT INTO `bdc_inspectionsheet_result` VALUES ('67', null, '43', '42');

-- ----------------------------
-- Table structure for bdc_inspectionsheet_soil
-- ----------------------------
DROP TABLE IF EXISTS `bdc_inspectionsheet_soil`;
CREATE TABLE `bdc_inspectionsheet_soil` (
  `type_id` bigint(20) NOT NULL,
  `samplingSection` varchar(255) default NULL,
  `analysisResult` double default NULL,
  `remarks` varchar(255) default NULL,
  PRIMARY KEY  (`type_id`),
  KEY `FK6F6FC531D2982AD9` (`type_id`),
  CONSTRAINT `FK6F6FC531D2982AD9` FOREIGN KEY (`type_id`) REFERENCES `bdc_inspectionsheet_result` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_inspectionsheet_soil
-- ----------------------------
INSERT INTO `bdc_inspectionsheet_soil` VALUES ('19', null, '0', null);
INSERT INTO `bdc_inspectionsheet_soil` VALUES ('23', null, '0', null);
INSERT INTO `bdc_inspectionsheet_soil` VALUES ('29', null, '0', null);
INSERT INTO `bdc_inspectionsheet_soil` VALUES ('43', '34', '3', '无备注');
INSERT INTO `bdc_inspectionsheet_soil` VALUES ('44', '1232', '2', '无备注');
INSERT INTO `bdc_inspectionsheet_soil` VALUES ('45', '56', '40', '无备注');
INSERT INTO `bdc_inspectionsheet_soil` VALUES ('55', '5', '0.65', '无备注');
INSERT INTO `bdc_inspectionsheet_soil` VALUES ('56', '3', '0.35', '无备注');
INSERT INTO `bdc_inspectionsheet_soil` VALUES ('57', '4', '0.55', '无备注');
INSERT INTO `bdc_inspectionsheet_soil` VALUES ('58', '2', '0.25', '无备注');

-- ----------------------------
-- Table structure for bdc_inspectionsheet_solid
-- ----------------------------
DROP TABLE IF EXISTS `bdc_inspectionsheet_solid`;
CREATE TABLE `bdc_inspectionsheet_solid` (
  `type_id` bigint(20) NOT NULL,
  `analysisResult` double default NULL,
  `standardVolume` double default NULL,
  `concentration` double default NULL,
  `standardDryFlow` double default NULL,
  `discharge` double default NULL,
  PRIMARY KEY  (`type_id`),
  KEY `FK7E88EC39D2982AD9` (`type_id`),
  CONSTRAINT `FK7E88EC39D2982AD9` FOREIGN KEY (`type_id`) REFERENCES `bdc_inspectionsheet_result` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_inspectionsheet_solid
-- ----------------------------
INSERT INTO `bdc_inspectionsheet_solid` VALUES ('20', '0', '0', '0', '0', '0');
INSERT INTO `bdc_inspectionsheet_solid` VALUES ('50', '15.32', '2', '4', '3', '5');

-- ----------------------------
-- Table structure for bdc_inspectionsheet_water
-- ----------------------------
DROP TABLE IF EXISTS `bdc_inspectionsheet_water`;
CREATE TABLE `bdc_inspectionsheet_water` (
  `type_id` bigint(20) NOT NULL,
  `sampleProperties` varchar(255) default NULL,
  `analysisResult` double default NULL,
  PRIMARY KEY  (`type_id`),
  KEY `FK7EBB0AA5D2982AD9` (`type_id`),
  CONSTRAINT `FK7EBB0AA5D2982AD9` FOREIGN KEY (`type_id`) REFERENCES `bdc_inspectionsheet_result` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_inspectionsheet_water
-- ----------------------------
INSERT INTO `bdc_inspectionsheet_water` VALUES ('22', '43', '21');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('25', '32', '1');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('27', null, '0');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('28', null, '0');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('30', null, '0');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('51', null, '123');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('52', null, '456');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('53', null, '456');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('54', null, '125');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('64', null, '0');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('65', null, '0');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('66', null, '0');
INSERT INTO `bdc_inspectionsheet_water` VALUES ('67', null, '0');

-- ----------------------------
-- Table structure for bdc_inventory
-- ----------------------------
DROP TABLE IF EXISTS `bdc_inventory`;
CREATE TABLE `bdc_inventory` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `standard` varchar(255) NOT NULL,
  `unit` varchar(255) default NULL,
  `price` double NOT NULL,
  `type` varchar(255) default NULL,
  `lowerValue` double NOT NULL,
  `amount` double NOT NULL,
  `attention` varchar(255) default NULL,
  `envirRequire` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `identify` (`identify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_inventory
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_messagelisten
-- ----------------------------
DROP TABLE IF EXISTS `bdc_messagelisten`;
CREATE TABLE `bdc_messagelisten` (
  `id` bigint(20) NOT NULL auto_increment,
  `type` bigint(20) default NULL,
  `receiver` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK25CE2950774E9BA2` (`receiver`),
  CONSTRAINT `FK25CE2950774E9BA2` FOREIGN KEY (`receiver`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_messagelisten
-- ----------------------------
INSERT INTO `bdc_messagelisten` VALUES ('1', '1', '1');
INSERT INTO `bdc_messagelisten` VALUES ('2', '2', '1');
INSERT INTO `bdc_messagelisten` VALUES ('3', '3', '1');
INSERT INTO `bdc_messagelisten` VALUES ('4', '4', '1');
INSERT INTO `bdc_messagelisten` VALUES ('5', '5', '1');
INSERT INTO `bdc_messagelisten` VALUES ('6', '6', '1');
INSERT INTO `bdc_messagelisten` VALUES ('7', '7', '1');
INSERT INTO `bdc_messagelisten` VALUES ('8', '8', '1');
INSERT INTO `bdc_messagelisten` VALUES ('9', '9', '1');
INSERT INTO `bdc_messagelisten` VALUES ('10', '10', '1');
INSERT INTO `bdc_messagelisten` VALUES ('11', '11', '1');
INSERT INTO `bdc_messagelisten` VALUES ('12', '12', '1');
INSERT INTO `bdc_messagelisten` VALUES ('13', '13', '1');
INSERT INTO `bdc_messagelisten` VALUES ('14', '14', '1');
INSERT INTO `bdc_messagelisten` VALUES ('15', '15', '1');
INSERT INTO `bdc_messagelisten` VALUES ('16', '16', '1');

-- ----------------------------
-- Table structure for bdc_messagequeue
-- ----------------------------
DROP TABLE IF EXISTS `bdc_messagequeue`;
CREATE TABLE `bdc_messagequeue` (
  `id` bigint(20) NOT NULL auto_increment,
  `message` varchar(1000) default NULL,
  `type` int(11) default NULL,
  `itemId` bigint(20) default NULL,
  `pushDate` date default NULL,
  `flag` int(11) default NULL,
  `receiver_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK183E8682A303F1E` (`receiver_id`),
  CONSTRAINT `FK183E8682A303F1E` FOREIGN KEY (`receiver_id`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_messagequeue
-- ----------------------------
INSERT INTO `bdc_messagequeue` VALUES ('1', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '1', '1');
INSERT INTO `bdc_messagequeue` VALUES ('2', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '2');
INSERT INTO `bdc_messagequeue` VALUES ('3', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '3');
INSERT INTO `bdc_messagequeue` VALUES ('4', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '4');
INSERT INTO `bdc_messagequeue` VALUES ('5', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '5');
INSERT INTO `bdc_messagequeue` VALUES ('6', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '6');
INSERT INTO `bdc_messagequeue` VALUES ('7', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '7');
INSERT INTO `bdc_messagequeue` VALUES ('8', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '8');
INSERT INTO `bdc_messagequeue` VALUES ('9', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '9');
INSERT INTO `bdc_messagequeue` VALUES ('10', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '10');
INSERT INTO `bdc_messagequeue` VALUES ('11', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '11');
INSERT INTO `bdc_messagequeue` VALUES ('12', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '12');
INSERT INTO `bdc_messagequeue` VALUES ('13', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '13');
INSERT INTO `bdc_messagequeue` VALUES ('14', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '14');
INSERT INTO `bdc_messagequeue` VALUES ('15', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '15');
INSERT INTO `bdc_messagequeue` VALUES ('16', '您有一条新公告,请及时查看！', '0', '1', '2016-04-18', '0', '16');
INSERT INTO `bdc_messagequeue` VALUES ('17', '您有待质量控制的项目，请及时查看！', '10', '2', '2016-04-18', '1', '1');
INSERT INTO `bdc_messagequeue` VALUES ('18', '您有待下达任务，请及时查看！', '14', '6', '2016-04-18', '1', '1');
INSERT INTO `bdc_messagequeue` VALUES ('19', '您有自送样需要登记，请及时查看！', '15', '5', '2016-04-18', '1', '1');

-- ----------------------------
-- Table structure for bdc_nonselfsampleinfo_analysisproject
-- ----------------------------
DROP TABLE IF EXISTS `bdc_nonselfsampleinfo_analysisproject`;
CREATE TABLE `bdc_nonselfsampleinfo_analysisproject` (
  `sample_id` bigint(20) NOT NULL,
  `analysisProjectId` bigint(20) NOT NULL,
  PRIMARY KEY  (`sample_id`,`analysisProjectId`),
  KEY `FKAA7572115623344D` (`analysisProjectId`),
  KEY `FKAA757211F6EDAAD3` (`sample_id`),
  CONSTRAINT `FKAA7572115623344D` FOREIGN KEY (`analysisProjectId`) REFERENCES `bdc_analysisproject` (`id`),
  CONSTRAINT `FKAA757211F6EDAAD3` FOREIGN KEY (`sample_id`) REFERENCES `bdc_nonselfsendsampleinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_nonselfsampleinfo_analysisproject
-- ----------------------------
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('41', '3');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('42', '3');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('43', '3');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('44', '3');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('45', '3');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('37', '7');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('38', '7');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('43', '7');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('45', '7');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('39', '13');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('40', '13');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('43', '13');
INSERT INTO `bdc_nonselfsampleinfo_analysisproject` VALUES ('44', '13');

-- ----------------------------
-- Table structure for bdc_nonselfsendsampleinfo
-- ----------------------------
DROP TABLE IF EXISTS `bdc_nonselfsendsampleinfo`;
CREATE TABLE `bdc_nonselfsendsampleinfo` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) NOT NULL,
  `samplingPosition` varchar(500) default NULL,
  `sampleName` varchar(500) default NULL,
  `projectName` varchar(500) default NULL,
  `other` varchar(1000) default NULL,
  `date` date default NULL,
  `deliver` int(11) default NULL,
  `userId` bigint(20) default NULL,
  `projectId` bigint(20) default NULL,
  `sampleState` varchar(500) default NULL,
  `analysisProject` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `identify` (`identify`),
  KEY `FKB0E42DDB2305D225` (`projectId`),
  KEY `FKB0E42DDB75ADE3D9` (`userId`),
  KEY `FKB0E42DDBF61A6272` (`analysisProject`),
  CONSTRAINT `FKB0E42DDB2305D225` FOREIGN KEY (`projectId`) REFERENCES `bdc_project` (`id`),
  CONSTRAINT `FKB0E42DDB75ADE3D9` FOREIGN KEY (`userId`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FKB0E42DDBF61A6272` FOREIGN KEY (`analysisProject`) REFERENCES `bdc_analysisproject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_nonselfsendsampleinfo
-- ----------------------------
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('1', 'A0001', '六号桥', '样品一', null, '无备注', null, '0', null, null, '污水', '8');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('2', 'A0002', '四号桥', '样品一', null, '无备注', null, '0', null, null, '污水', '9');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('3', 'A0003', '3', '123', null, '21', null, '0', null, null, '42', '8');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('4', 'A0004', '四号桥', '样品一', null, '无备注', null, '0', null, null, '污水', '9');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('5', 'A0005', '四号桥', '样品二', null, '无备注', null, '0', null, null, '废气', '4');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('6', 'A0006', '四号桥', '样品三', null, '无备注', null, '0', null, null, '土壤', '12');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('9', 'A0009', '上海', '样品一', null, '无备注', null, '0', null, null, '污水', '8');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('10', 'A0010', '上海', '样品二', null, '无备注', null, '0', null, null, '污水', '3');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('11', 'A0011', '四号桥', '样品一', null, '无备注', null, '0', null, null, '污水', '8');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('12', 'A0012', '四号桥', '样品二', null, '无备注', null, '0', null, null, '废气', '4');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('13', 'A0013', '四号桥', '样品三', null, '无备注', null, '0', null, null, '废气', '3');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('14', 'A0014', '四号桥', '样品四', null, '无备注', null, '0', null, null, '废气', '3');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('15', 'A0015', '四号桥', '样品五', null, '无备注', null, '0', null, null, '土壤', '12');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('29', 'A0029', '四号桥', '样品一', null, '无备注', '2016-04-01', '1', '1', '1', '污水', '8');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('30', 'A0030', '四号桥', '样品二', null, '无备注', '2016-04-01', '1', '1', '1', '废气', '4');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('31', 'A0031', '四号桥', '样品三', null, '无备注', '2016-04-01', '1', '1', '1', '废气', '3');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('32', 'A0032', '四号桥', '样品四', null, '无备注', '2016-04-01', '1', '1', '1', '废水', '9');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('33', 'A0033', '四号桥', '样品五', null, '无备注', '2016-04-01', '1', '1', '1', '废水', '9');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('34', 'A0034', '四号桥', '样品六', null, '无备注', '2016-04-01', '1', '1', '1', '土壤', '12');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('35', 'A0035', '四号桥', '样品一', null, '无备注', '2016-03-23', '0', '1', '2', '污水', '7');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('36', 'A0036', '四号桥', '样品二', null, '无备注', '2016-03-23', '0', '1', '2', '土壤', '12');
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('37', 'A0037', '四号桥', '样品一', null, '无', '2016-04-09', '1', '1', '4', '污水', null);
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('38', 'A0038', '四号桥', '样品二', null, '无', '2016-04-09', '1', '1', '4', '污水', null);
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('39', 'A0039', '四号桥', '样品三', null, '无', '2016-04-09', '1', '1', '4', '土壤', null);
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('40', 'A0040', '四号桥', '样品四', null, '无', '2016-04-09', '1', '1', '4', '土壤', null);
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('41', 'A0041', '四号桥', '样品五', null, '无', '2016-04-09', '1', '1', '4', '空气', null);
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('42', 'A0042', '四号桥', '样品六', null, '无', '2016-04-09', '1', '1', '4', '空气', null);
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('43', 'A0043', '四号桥', '样品七', null, '无', '2016-04-09', '1', '1', '4', '多样', null);
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('44', 'A0044', '四号桥', '样品八', null, '无', '2016-04-09', '1', '1', '4', '多样', null);
INSERT INTO `bdc_nonselfsendsampleinfo` VALUES ('45', 'A0045', '四号桥', '样品九', null, '无', '2016-04-09', '1', '1', '4', '多样', null);

-- ----------------------------
-- Table structure for bdc_notice
-- ----------------------------
DROP TABLE IF EXISTS `bdc_notice`;
CREATE TABLE `bdc_notice` (
  `id` bigint(20) NOT NULL auto_increment,
  `priority` int(11) default NULL,
  `noticeHead` varchar(1000) default NULL,
  `context` varchar(5000) default NULL,
  `startDate` date default NULL,
  `endDate` date default NULL,
  `sendWay` int(11) default NULL,
  `send_id` bigint(20) default NULL,
  `path` varchar(1000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKFE6498761D85C6E5` (`send_id`),
  CONSTRAINT `FKFE6498761D85C6E5` FOREIGN KEY (`send_id`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_notice
-- ----------------------------
INSERT INTO `bdc_notice` VALUES ('1', '0', '测试公告', '<h2 align=\"center\">\r\n	这是一个公告标题\r\n</h2>\r\n<p>\r\n	这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容这是公告内容\r\n</p>', '2016-04-19', '2016-05-06', '0', '1', 'H:apache-tomcat-7.0.57webappsLIMS\r\noticeFile/0c3e3de3b28b5b24074c8624dddb86a7');

-- ----------------------------
-- Table structure for bdc_notice_department
-- ----------------------------
DROP TABLE IF EXISTS `bdc_notice_department`;
CREATE TABLE `bdc_notice_department` (
  `notice_id` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`notice_id`,`department_id`),
  KEY `FK549B3ABB4B259062` (`department_id`),
  KEY `FK549B3ABB36A5CEA2` (`notice_id`),
  CONSTRAINT `FK549B3ABB36A5CEA2` FOREIGN KEY (`notice_id`) REFERENCES `bdc_notice` (`id`),
  CONSTRAINT `FK549B3ABB4B259062` FOREIGN KEY (`department_id`) REFERENCES `bdc_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_notice_department
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_notice_receive
-- ----------------------------
DROP TABLE IF EXISTS `bdc_notice_receive`;
CREATE TABLE `bdc_notice_receive` (
  `notice_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`notice_id`,`user_id`),
  KEY `FK20E9DC1A9EBD9FC2` (`user_id`),
  KEY `FK20E9DC1A36A5CEA2` (`notice_id`),
  CONSTRAINT `FK20E9DC1A36A5CEA2` FOREIGN KEY (`notice_id`) REFERENCES `bdc_notice` (`id`),
  CONSTRAINT `FK20E9DC1A9EBD9FC2` FOREIGN KEY (`user_id`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_notice_receive
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_originalrecord
-- ----------------------------
DROP TABLE IF EXISTS `bdc_originalrecord`;
CREATE TABLE `bdc_originalrecord` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(1000) default NULL,
  `path` varchar(2000) default NULL,
  `category` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKB2120520AED79EE0` (`category`),
  CONSTRAINT `FKB2120520AED79EE0` FOREIGN KEY (`category`) REFERENCES `bdc_analysiscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_originalrecord
-- ----------------------------
INSERT INTO `bdc_originalrecord` VALUES ('16', '05pH分析原始记录表', 'originalRecord/c62cb8d9eb84412286ea72deea3df586', '1');
INSERT INTO `bdc_originalrecord` VALUES ('17', '06一氧化碳分析原始记录', 'originalRecord/7eab43b8bb85fa49426ce004013c72a8', '2');
INSERT INTO `bdc_originalrecord` VALUES ('18', '颗粒物分析记录表', 'originalRecord/a22622784d15780238e99d0c91704b32', '4');
INSERT INTO `bdc_originalrecord` VALUES ('19', '色度分析', 'originalRecord/f2c2d06b6bb59c94a32200c5e1c408b7', '1');
INSERT INTO `bdc_originalrecord` VALUES ('20', '化学需氧量', 'originalRecord/019caa561b3b79e2fcf9642bbbda1142', '1');
INSERT INTO `bdc_originalrecord` VALUES ('21', '土壤样品', 'originalRecord/b01112f1ccdd83c8c4ea5eb6788745cb', '3');
INSERT INTO `bdc_originalrecord` VALUES ('22', '油类', 'originalRecord/50fe6d3cb7c176bab388d99950c74dae', '3');
INSERT INTO `bdc_originalrecord` VALUES ('23', '34气相色谱质谱分析原始记录（定性）', 'originalRecord/d80116614c0283a06f8bb8b936a3fb71', '4');
INSERT INTO `bdc_originalrecord` VALUES ('24', '42土壤样品消解过程记录表', 'originalRecord/b01112f1ccdd83c8c4ea5eb6788745cb', '3');
INSERT INTO `bdc_originalrecord` VALUES ('25', '33原子荧光法分析原始记录', 'originalRecord/6940755a72ebea67612756a468e26a42', '1');
INSERT INTO `bdc_originalrecord` VALUES ('26', '27石墨炉原子吸收法分析原始记录', 'originalRecord/e0785f0848015ad40f76c6252369cf11', '2');

-- ----------------------------
-- Table structure for bdc_power
-- ----------------------------
DROP TABLE IF EXISTS `bdc_power`;
CREATE TABLE `bdc_power` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) NOT NULL,
  `powerAction` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_power
-- ----------------------------
INSERT INTO `bdc_power` VALUES ('1', '11', 'mainPage_main');
INSERT INTO `bdc_power` VALUES ('2', '12', 'notice_notice_main');
INSERT INTO `bdc_power` VALUES ('3', '13', 'commonTemplet_commonTemplet_main');
INSERT INTO `bdc_power` VALUES ('4', '21', 'performance_performance_main');
INSERT INTO `bdc_power` VALUES ('5', '31', 'sampleTransfer_sampleTransfer_main');
INSERT INTO `bdc_power` VALUES ('6', '32', 'taskDistribution_taskDistribution_main');
INSERT INTO `bdc_power` VALUES ('7', '33', 'detectionResult_detectionResult_main');
INSERT INTO `bdc_power` VALUES ('8', '34', 'resultReview_resultReview_main');
INSERT INTO `bdc_power` VALUES ('9', '35', 'resultAudit_resultAudit_main');
INSERT INTO `bdc_power` VALUES ('10', '41', 'report_report_main');
INSERT INTO `bdc_power` VALUES ('11', '42', 'reportAudit_reportAudit_main');
INSERT INTO `bdc_power` VALUES ('12', '43', 'reportIssued_reportIssued_main');
INSERT INTO `bdc_power` VALUES ('13', '44', 'reportReceipt_reportReceipt_main');
INSERT INTO `bdc_power` VALUES ('14', '51', 'qualityControl_qualityControl_main');
INSERT INTO `bdc_power` VALUES ('15', '52', 'resultAuditSecond_resultAuditSecond_main');
INSERT INTO `bdc_power` VALUES ('16', '53', 'reportAuditSecond_reportAuditSecond_main');
INSERT INTO `bdc_power` VALUES ('17', '61', 'contractManage_contractList_main');
INSERT INTO `bdc_power` VALUES ('18', '62', 'contractManage_contractList_contractSList');
INSERT INTO `bdc_power` VALUES ('19', '63', 'contractManage_contract_addPage');
INSERT INTO `bdc_power` VALUES ('20', '64', 'contractManage_contractChange_main');
INSERT INTO `bdc_power` VALUES ('21', '65', 'contractManage_trafficContractChange_main');
INSERT INTO `bdc_power` VALUES ('22', '66', 'contractManage_contractAudit_main');
INSERT INTO `bdc_power` VALUES ('23', '67', 'contractManage_projectPlan_main');
INSERT INTO `bdc_power` VALUES ('24', '68', 'selfSendSampleInfo_selfSendSampleInfo_main');
INSERT INTO `bdc_power` VALUES ('25', '69', 'nonSelfSendSample_nonSelfSendSample_main');
INSERT INTO `bdc_power` VALUES ('26', '71', 'userPWDManage_userPWD_main');
INSERT INTO `bdc_power` VALUES ('27', '72', 'departmentManage_department_main');
INSERT INTO `bdc_power` VALUES ('28', '73', 'roleManage_role_main');
INSERT INTO `bdc_power` VALUES ('29', '74', 'userManage_user_main');
INSERT INTO `bdc_power` VALUES ('30', '75', 'noticeManage_noticeManage_main');
INSERT INTO `bdc_power` VALUES ('31', '76', 'analysisFrequency_analysisFrequency_main');
INSERT INTO `bdc_power` VALUES ('32', '77', 'analysisCategory_analysisCategory_main');
INSERT INTO `bdc_power` VALUES ('33', '78', 'analysisProject_analysisProject_main');
INSERT INTO `bdc_power` VALUES ('34', '79', 'basicSetting_basicSetting_main');

-- ----------------------------
-- Table structure for bdc_project
-- ----------------------------
DROP TABLE IF EXISTS `bdc_project`;
CREATE TABLE `bdc_project` (
  `id` bigint(20) NOT NULL auto_increment,
  `tContractId` bigint(20) default NULL,
  `sContractId` bigint(20) default NULL,
  `process` int(11) default NULL,
  `createTime` date default NULL,
  `draftsMan` bigint(20) default NULL,
  `auditRole_id` bigint(20) default NULL,
  `rewriteCount` int(11) default NULL,
  `contractId` varchar(255) default NULL,
  `businessRegistration_Id` bigint(20) default NULL,
  `projectBook_id` bigint(20) default NULL,
  `gainSample` varchar(255) default NULL,
  `QualityControlDate` date default NULL,
  `qualityControlUser_id` bigint(20) default NULL,
  `recordAudit_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `tContractId` (`tContractId`),
  UNIQUE KEY `sContractId` (`sContractId`),
  UNIQUE KEY `businessRegistration_Id` (`businessRegistration_Id`),
  UNIQUE KEY `projectBook_id` (`projectBook_id`),
  UNIQUE KEY `recordAudit_id` (`recordAudit_id`),
  KEY `FK3CD37D3B3759BD22` (`businessRegistration_Id`),
  KEY `FK3CD37D3B3F3243A7` (`auditRole_id`),
  KEY `FK3CD37D3B48961E5F` (`sContractId`),
  KEY `FK3CD37D3B7BBC9E72` (`recordAudit_id`),
  KEY `FK3CD37D3B19B77E84` (`qualityControlUser_id`),
  KEY `FK3CD37D3B94675EDB` (`draftsMan`),
  KEY `FK3CD37D3B304D6468` (`tContractId`),
  KEY `FK3CD37D3BA34DA3B2` (`projectBook_id`),
  CONSTRAINT `FK3CD37D3B19B77E84` FOREIGN KEY (`qualityControlUser_id`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK3CD37D3B304D6468` FOREIGN KEY (`tContractId`) REFERENCES `bdc_trafficcontract` (`id`),
  CONSTRAINT `FK3CD37D3B3759BD22` FOREIGN KEY (`businessRegistration_Id`) REFERENCES `bdc_businessregistration` (`id`),
  CONSTRAINT `FK3CD37D3B3F3243A7` FOREIGN KEY (`auditRole_id`) REFERENCES `bdc_role` (`id`),
  CONSTRAINT `FK3CD37D3B48961E5F` FOREIGN KEY (`sContractId`) REFERENCES `bdc_servicecontract` (`id`),
  CONSTRAINT `FK3CD37D3B7BBC9E72` FOREIGN KEY (`recordAudit_id`) REFERENCES `bdc_recordaudit` (`id`),
  CONSTRAINT `FK3CD37D3B94675EDB` FOREIGN KEY (`draftsMan`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK3CD37D3BA34DA3B2` FOREIGN KEY (`projectBook_id`) REFERENCES `bdc_projectbook` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_project
-- ----------------------------
INSERT INTO `bdc_project` VALUES ('1', '1', null, '-1', '2016-03-22', '1', null, '0', '2016001', null, '1', '0', '2016-03-25', '1', null);
INSERT INTO `bdc_project` VALUES ('2', '2', null, '3', '2016-03-22', '1', null, '0', '2016002', null, '11', '0', null, null, null);
INSERT INTO `bdc_project` VALUES ('3', '3', null, '-1', '2016-03-23', '1', null, '0', '2016003', null, '12', '1', '2016-03-25', '1', null);
INSERT INTO `bdc_project` VALUES ('4', '12', null, '6', '2016-03-31', '1', null, '0', '2016012', null, '19', '0', '2016-04-08', '1', null);
INSERT INTO `bdc_project` VALUES ('5', '13', null, '-2', '2016-03-31', '1', null, '0', '2016013', null, '14', '1', null, null, null);
INSERT INTO `bdc_project` VALUES ('6', '28', null, '1', '2016-03-31', '1', null, '0', '2016026', null, '13', '1', null, null, null);
INSERT INTO `bdc_project` VALUES ('7', '34', null, '11', '2016-04-05', '1', null, '0', '2016032', null, '18', '1', '2016-04-07', '1', '1');
INSERT INTO `bdc_project` VALUES ('8', '4', null, '1', '2016-04-18', '1', null, '0', '2016004', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for bdc_projectbook
-- ----------------------------
DROP TABLE IF EXISTS `bdc_projectbook`;
CREATE TABLE `bdc_projectbook` (
  `id` bigint(20) NOT NULL auto_increment,
  `client` varchar(255) default NULL,
  `projectName` varchar(255) default NULL,
  `aim` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  `contact` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `context` varchar(255) default NULL,
  `customerText` varchar(255) default NULL,
  `other` varchar(255) default NULL,
  `projectWay` int(11) default NULL,
  `taskUnderDate` date default NULL,
  `reportDate` date default NULL,
  `reportFirstDate` date default NULL,
  `reportSecondDate` date default NULL,
  `reportSignDate` date default NULL,
  `salesmanSignDate` date default NULL,
  `fileClerkDate` date default NULL,
  `undertake` bigint(20) default NULL,
  `projectCharge` bigint(20) default NULL,
  `taskUnder` bigint(20) default NULL,
  `reportWriter` bigint(20) default NULL,
  `reportFirstInstance` bigint(20) default NULL,
  `reportSecondInstance` bigint(20) default NULL,
  `reportSign` bigint(20) default NULL,
  `salesmanSign` bigint(20) default NULL,
  `fileClerk` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK802C16C4CAB52844` (`reportFirstInstance`),
  KEY `FK802C16C4323800F0` (`reportSecondInstance`),
  KEY `FK802C16C4B37E6A26` (`taskUnder`),
  KEY `FK802C16C4F0EBA93E` (`salesmanSign`),
  KEY `FK802C16C41AAF2AA4` (`reportSign`),
  KEY `FK802C16C475C1A8C0` (`projectCharge`),
  KEY `FK802C16C45942820C` (`fileClerk`),
  KEY `FK802C16C4D4A54699` (`undertake`),
  KEY `FK802C16C48C7F45A` (`reportWriter`),
  CONSTRAINT `FK802C16C41AAF2AA4` FOREIGN KEY (`reportSign`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK802C16C4323800F0` FOREIGN KEY (`reportSecondInstance`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK802C16C45942820C` FOREIGN KEY (`fileClerk`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK802C16C475C1A8C0` FOREIGN KEY (`projectCharge`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK802C16C48C7F45A` FOREIGN KEY (`reportWriter`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK802C16C4B37E6A26` FOREIGN KEY (`taskUnder`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK802C16C4CAB52844` FOREIGN KEY (`reportFirstInstance`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK802C16C4D4A54699` FOREIGN KEY (`undertake`) REFERENCES `bdc_department` (`id`),
  CONSTRAINT `FK802C16C4F0EBA93E` FOREIGN KEY (`salesmanSign`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_projectbook
-- ----------------------------
INSERT INTO `bdc_projectbook` VALUES ('1', '常州市xxxx环保部门', '项目名称为xxxxx', '监测目的为xxxx', '江苏省常州市', '213023', '张三', '13816157552', null, '', '', '0', '2016-03-22', null, null, null, null, null, null, '3', '5', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('2', '委托单位', '项目名词', '监测目的', '地址', '123456', '张三', '13816157552', null, '', '', '0', '2016-03-22', null, null, null, null, null, null, '2', '3', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('3', '委托单位', '项目名词', '监测目的', '地址', '123456', '张三', '13816157552', null, '', '', '0', '2016-03-23', null, null, null, null, null, null, '3', '4', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('5', '委托单位', '项目名词', '监测目的', '地址', '123456', '张三', '13816157552', null, '', '', '0', '2016-03-23', null, null, null, null, null, null, '3', '4', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('6', '委托单位', '项目名词', '监测目的', '地址', '123456', '张三', '13816157552', null, '', '', '0', '2016-03-23', null, null, null, null, null, null, '2', '2', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('7', '委托单位', '项目名词', '监测目的', '地址', '123456', '张三', '13816157552', null, '', '', '0', '2016-03-23', null, null, null, null, null, null, '3', '5', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('8', '委托单位', '项目名词', '监测目的', '地址', '123456', '张三', '13816157552', null, '', '', '0', '2016-03-23', null, null, null, null, null, null, '2', '2', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('10', '委托单位', '项目名词', '监测目的', '地址', '123456', '张三', '13816157552', null, '', '', '0', '2016-03-23', null, null, null, null, null, null, '2', '3', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('11', '委托单位', '项目名词', '监测目的', '地址', '123456', '张三', '13816157552', null, '', '', '0', '2016-03-23', null, null, null, null, null, null, '3', '5', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('12', '委托单位', '项目名称为xxxx', '检测目的为xxx', '江苏省常州市', '212023', '张三', '13816157552', null, '', '', '0', '2016-03-23', null, null, null, null, null, null, '2', '3', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('13', '1234', '12', '42', '32', '', '42', '', null, '', '', '0', '2016-04-04', null, null, null, null, null, null, '3', '5', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('14', '12', '56', '12', '', '', '34', '', null, '', '', '0', '2016-04-04', null, null, null, null, null, null, '5', '10', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('15', '委托单位为甲方xxx', '关于六号桥水质环境监测的项目', '检测环境是否达标', '江苏省常州市钟楼区', '213023', '张三', '13816157552', null, '', '', '0', '2016-04-05', null, null, null, null, null, null, '3', '5', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('17', '委托单位为甲方xxx', '关于六号桥水质环境监测的项目', '检测环境是否达标', '江苏省常州市钟楼区', '213023', '张三', '13816157552', null, '这是客户指定的方式', '', '1', '2016-04-05', null, null, null, null, null, null, '3', '5', '1', null, null, null, null, null, null);
INSERT INTO `bdc_projectbook` VALUES ('18', '委托单位为甲方xxx', '关于六号桥水质环境监测的项目', '检测环境是否达标', '江苏省常州市钟楼区', '213023', '张三', '13816157552', null, '这是客户指定的方式', '我是其他的备注信息', '1', '2016-04-05', '2016-04-17', '2016-04-17', '2016-04-17', '2016-04-17', '2016-04-17', null, '3', '5', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `bdc_projectbook` VALUES ('19', '委托单位为xxx', '项目名称为xxx', '监测目的为xxx', '江苏省常州市', '213023', '张安', '13816157552', null, '', '', '0', '2016-04-07', null, null, null, null, null, null, '3', '5', '1', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for bdc_qualitycontrol
-- ----------------------------
DROP TABLE IF EXISTS `bdc_qualitycontrol`;
CREATE TABLE `bdc_qualitycontrol` (
  `id` bigint(20) NOT NULL auto_increment,
  `SampleNum` int(11) default NULL,
  `parallelSample` int(11) default NULL,
  `laboratorySampleNum` int(11) default NULL,
  `spikedRecoverySampleNum` int(11) default NULL,
  `blindSample` int(11) default NULL,
  `analysisProject_id` bigint(20) default NULL,
  `laboratorySample_id` bigint(20) default NULL,
  `nonLaboratorySample_id` bigint(20) default NULL,
  `spikedRecoverySample_id` bigint(20) default NULL,
  `nonSpikedRecoverySample_id` bigint(20) default NULL,
  `projectId` bigint(20) default NULL,
  `laboratorySampleIdentifys` varchar(1000) default NULL,
  `spikedSampleIdentifys` varchar(1000) default NULL,
  `createDate` date default NULL,
  `createUser` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKDC1B72FCE3BA8BF1` (`spikedRecoverySample_id`),
  KEY `FKDC1B72FC2A3C2EF1` (`laboratorySample_id`),
  KEY `FKDC1B72FC2305D225` (`projectId`),
  KEY `FKDC1B72FC7760F493` (`nonLaboratorySample_id`),
  KEY `FKDC1B72FCCA8B1013` (`nonSpikedRecoverySample_id`),
  KEY `FKDC1B72FCBA2BED92` (`analysisProject_id`),
  KEY `FKDC1B72FCF92E607A` (`createUser`),
  CONSTRAINT `FKDC1B72FC2305D225` FOREIGN KEY (`projectId`) REFERENCES `bdc_project` (`id`),
  CONSTRAINT `FKDC1B72FC2A3C2EF1` FOREIGN KEY (`laboratorySample_id`) REFERENCES `bdc_selfsendsampleinfo` (`id`),
  CONSTRAINT `FKDC1B72FC7760F493` FOREIGN KEY (`nonLaboratorySample_id`) REFERENCES `bdc_nonselfsendsampleinfo` (`id`),
  CONSTRAINT `FKDC1B72FCBA2BED92` FOREIGN KEY (`analysisProject_id`) REFERENCES `bdc_analysisproject` (`id`),
  CONSTRAINT `FKDC1B72FCCA8B1013` FOREIGN KEY (`nonSpikedRecoverySample_id`) REFERENCES `bdc_nonselfsendsampleinfo` (`id`),
  CONSTRAINT `FKDC1B72FCE3BA8BF1` FOREIGN KEY (`spikedRecoverySample_id`) REFERENCES `bdc_selfsendsampleinfo` (`id`),
  CONSTRAINT `FKDC1B72FCF92E607A` FOREIGN KEY (`createUser`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_qualitycontrol
-- ----------------------------
INSERT INTO `bdc_qualitycontrol` VALUES ('2', '1', '1', '1', '1', '1', '3', null, null, null, null, '1', 'A0031,', 'A0031,', null, null);
INSERT INTO `bdc_qualitycontrol` VALUES ('3', '2', '2', '2', '2', '2', '9', null, null, null, null, '1', 'A0032,A0033,', 'A0032,A0033,', null, null);
INSERT INTO `bdc_qualitycontrol` VALUES ('4', '2', '2', '2', '0', '0', '9', null, null, null, null, '1', '', '', null, null);
INSERT INTO `bdc_qualitycontrol` VALUES ('5', '1', '0', '0', '0', '0', '8', null, null, null, null, '1', '', '', null, null);
INSERT INTO `bdc_qualitycontrol` VALUES ('6', '1', '0', '0', '0', '0', '8', null, null, null, null, '1', '', '', null, null);
INSERT INTO `bdc_qualitycontrol` VALUES ('9', '1', '1', '1', '1', '0', '4', null, null, null, null, '3', 'Z0005,', 'Z0005,', null, null);
INSERT INTO `bdc_qualitycontrol` VALUES ('16', '2', '2', '2', '2', '1', '7', null, null, null, null, '7', 'Z0045,Z0047,', 'Z0046,Z0047,', '2016-04-07', '1');
INSERT INTO `bdc_qualitycontrol` VALUES ('17', '3', '3', '3', '3', '0', '11', null, null, null, null, '7', 'Z0061,Z0048,Z0060,', 'Z0061,Z0060,Z0048,', '2016-04-07', '1');
INSERT INTO `bdc_qualitycontrol` VALUES ('18', '2', '1', '1', '1', '0', '5', null, null, null, null, '7', 'Z0056,', 'Z0056,', '2016-04-07', '1');
INSERT INTO `bdc_qualitycontrol` VALUES ('19', '1', '1', '1', '1', '0', '15', null, null, null, null, '7', 'Z0059,', 'Z0059,', '2016-04-07', '1');
INSERT INTO `bdc_qualitycontrol` VALUES ('20', '2', '0', '3', '4', '0', '8', null, null, null, null, '7', 'Z0059,Z0048,Z0060,', 'Z0060,Z0061,Z0046,Z0047,', '2016-04-07', '1');
INSERT INTO `bdc_qualitycontrol` VALUES ('21', '3', '0', '2', '2', '0', '11', null, null, null, null, '7', 'Z0061,Z0060,', 'Z0061,Z0060,', '2016-04-07', '1');
INSERT INTO `bdc_qualitycontrol` VALUES ('22', '4', '2', '1', '2', '1', '7', null, null, null, null, '4', 'A0037,', 'A0038,A0037,', '2016-04-08', '1');
INSERT INTO `bdc_qualitycontrol` VALUES ('23', '4', '1', '2', '2', '1', '13', null, null, null, null, '4', 'A0039,A0040,', 'A0039,A0040,', '2016-04-08', '1');
INSERT INTO `bdc_qualitycontrol` VALUES ('24', '5', '2', '4', '5', '0', '3', null, null, null, null, '4', 'A0045,A0043,A0044,A0041,', 'A0045,A0044,A0041,A0042,A0043,', '2016-04-08', '1');

-- ----------------------------
-- Table structure for bdc_qualitycontrol_project
-- ----------------------------
DROP TABLE IF EXISTS `bdc_qualitycontrol_project`;
CREATE TABLE `bdc_qualitycontrol_project` (
  `project_id` bigint(20) NOT NULL,
  `qualityControl_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`project_id`,`qualityControl_id`),
  KEY `FK7806A8D6971B74C2` (`qualityControl_id`),
  KEY `FK7806A8D6E2F08032` (`project_id`),
  CONSTRAINT `FK7806A8D6971B74C2` FOREIGN KEY (`qualityControl_id`) REFERENCES `bdc_qualitycontrol` (`id`),
  CONSTRAINT `FK7806A8D6E2F08032` FOREIGN KEY (`project_id`) REFERENCES `bdc_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_qualitycontrol_project
-- ----------------------------
INSERT INTO `bdc_qualitycontrol_project` VALUES ('1', '2');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('1', '3');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('1', '4');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('1', '5');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('1', '6');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('3', '9');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('7', '16');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('7', '17');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('7', '18');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('7', '19');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('7', '20');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('7', '21');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('4', '22');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('4', '23');
INSERT INTO `bdc_qualitycontrol_project` VALUES ('4', '24');

-- ----------------------------
-- Table structure for bdc_recordaudit
-- ----------------------------
DROP TABLE IF EXISTS `bdc_recordaudit`;
CREATE TABLE `bdc_recordaudit` (
  `id` bigint(20) NOT NULL auto_increment,
  `firstAuditDate` date default NULL,
  `secondAuditDate` date default NULL,
  `firstInstance1` int(11) default NULL,
  `firstInstance2` int(11) default NULL,
  `firstInstance3` int(11) default NULL,
  `firstInstance4` int(11) default NULL,
  `firstInstance5` int(11) default NULL,
  `firstInstance6` int(11) default NULL,
  `secondInstance1` int(11) default NULL,
  `secondInstance2` int(11) default NULL,
  `secondInstance3` int(11) default NULL,
  `secondInstance4` int(11) default NULL,
  `secondInstance5` int(11) default NULL,
  `secondInstance6` int(11) default NULL,
  `remarks` varchar(2000) default NULL,
  `firstOther` varchar(2000) default NULL,
  `secondOther` varchar(2000) default NULL,
  `firstAudit` bigint(20) default NULL,
  `secondAudit` bigint(20) default NULL,
  `project_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK5199B2CE2F08032` (`project_id`),
  KEY `FK5199B2CB771B19A` (`secondAudit`),
  KEY `FK5199B2C9E09A8DE` (`firstAudit`),
  CONSTRAINT `FK5199B2C9E09A8DE` FOREIGN KEY (`firstAudit`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK5199B2CB771B19A` FOREIGN KEY (`secondAudit`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK5199B2CE2F08032` FOREIGN KEY (`project_id`) REFERENCES `bdc_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_recordaudit
-- ----------------------------
INSERT INTO `bdc_recordaudit` VALUES ('1', '2016-04-11', '2016-04-11', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '一审员：备注1。二审员：备注2', '其他方面1', '其他方面二', '9', '1', '7');

-- ----------------------------
-- Table structure for bdc_report
-- ----------------------------
DROP TABLE IF EXISTS `bdc_report`;
CREATE TABLE `bdc_report` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) NOT NULL,
  `type` int(11) default NULL,
  `path` varchar(1000) default NULL,
  `createDate` date default NULL,
  `project_id` bigint(20) default NULL,
  `maker` bigint(20) default NULL,
  `result` int(11) default NULL,
  `coverPath` varchar(1000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK4A956D2ADB069F7` (`maker`),
  KEY `FK4A956D2E2F08032` (`project_id`),
  CONSTRAINT `FK4A956D2ADB069F7` FOREIGN KEY (`maker`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FK4A956D2E2F08032` FOREIGN KEY (`project_id`) REFERENCES `bdc_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_report
-- ----------------------------
INSERT INTO `bdc_report` VALUES ('3', '2016-001', '1', 'reportSave/358cdb3f667e0b356ab63bf2fb2f3a22', '2016-04-12', '7', '1', '5', 'reportSave/80ba3050e8d735dbadff38033ffe655e');
INSERT INTO `bdc_report` VALUES ('4', '2016-001', '2', 'reportSave/45fc1221ba0e8944c86637a238b13066', '2016-04-12', '7', '1', '5', 'reportSave/cd4aa65277044ab67abd869ac0826c84');
INSERT INTO `bdc_report` VALUES ('8', '2016-003', '4', 'reportSave/1cb5c4b607d2b40769df0145952e963d', '2016-04-13', '7', '1', '5', 'reportSave/c9e238c400901f4676081f111fafe978');
INSERT INTO `bdc_report` VALUES ('9', '2016-004', '0', 'reportSave/9923721066e2f114e0f53e28a79dd034', '2016-04-13', '7', '1', '5', 'reportSave/2c99c2a718714b1540a50bcfa526c133');
INSERT INTO `bdc_report` VALUES ('10', '2016-003', '3', 'reportSave/04694a371a3c9356c6f9c82fa8fe00cd', '2016-04-17', '7', '1', '5', 'reportSave/9aaca2aa852460ba73f31fe593c0d406');

-- ----------------------------
-- Table structure for bdc_reportaudit
-- ----------------------------
DROP TABLE IF EXISTS `bdc_reportaudit`;
CREATE TABLE `bdc_reportaudit` (
  `id` bigint(20) NOT NULL auto_increment,
  `firstInstance1` int(11) default NULL,
  `firstInstance2` int(11) default NULL,
  `firstInstance3` int(11) default NULL,
  `firstInstance4` int(11) default NULL,
  `firstInstance5` int(11) default NULL,
  `firstInstance6` int(11) default NULL,
  `firstInstance7` int(11) default NULL,
  `secondInstance1` int(11) default NULL,
  `secondInstance2` int(11) default NULL,
  `secondInstance3` int(11) default NULL,
  `secondInstance4` int(11) default NULL,
  `secondInstance5` int(11) default NULL,
  `secondInstance6` int(11) default NULL,
  `issueAudit1` int(11) default NULL,
  `issueAudit2` int(11) default NULL,
  `issueAudit3` int(11) default NULL,
  `firstOther` varchar(2000) default NULL,
  `secondOhter` varchar(2000) default NULL,
  `issueOther` varchar(2000) default NULL,
  `issueOpinion` int(11) default NULL,
  `firstDate` date default NULL,
  `secondDate` date default NULL,
  `issueDate` date default NULL,
  `firstUser` bigint(20) default NULL,
  `secondUser` bigint(20) default NULL,
  `issueUser` bigint(20) default NULL,
  `report_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKA7E0C829B29531D7` (`issueUser`),
  KEY `FKA7E0C829B6AEE122` (`report_id`),
  KEY `FKA7E0C829AF7F982E` (`firstUser`),
  KEY `FKA7E0C829C0D587F2` (`secondUser`),
  CONSTRAINT `FKA7E0C829AF7F982E` FOREIGN KEY (`firstUser`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FKA7E0C829B29531D7` FOREIGN KEY (`issueUser`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FKA7E0C829B6AEE122` FOREIGN KEY (`report_id`) REFERENCES `bdc_report` (`id`),
  CONSTRAINT `FKA7E0C829C0D587F2` FOREIGN KEY (`secondUser`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_reportaudit
-- ----------------------------
INSERT INTO `bdc_reportaudit` VALUES ('47', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '一审通过', '二审不通过', '三审通过', '1', '2016-04-17', '2016-04-17', '2016-04-17', '1', '1', '2', '4');
INSERT INTO `bdc_reportaudit` VALUES ('49', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '一审通过', '二审不通过', '三审通过', '1', '2016-04-17', '2016-04-17', '2016-04-17', '1', '1', '2', '8');
INSERT INTO `bdc_reportaudit` VALUES ('52', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '一审通过', '二审通过', '三审通过', '1', '2016-04-17', '2016-04-17', '2016-04-17', '1', '1', '2', '10');
INSERT INTO `bdc_reportaudit` VALUES ('55', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '一审通过', '二审通过', '三婶通过', '1', '2016-04-17', '2016-04-17', '2016-04-17', '1', '1', '1', '9');
INSERT INTO `bdc_reportaudit` VALUES ('56', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '二审通过', '二审通过', '三婶通过', '1', '2016-04-17', '2016-04-17', '2016-04-17', '1', '1', '1', '3');

-- ----------------------------
-- Table structure for bdc_role
-- ----------------------------
DROP TABLE IF EXISTS `bdc_role`;
CREATE TABLE `bdc_role` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `identify` varchar(255) NOT NULL,
  `desp` varchar(255) default NULL,
  `departmentId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `identify` (`identify`),
  KEY `FK1C825194D9E2BF27` (`departmentId`),
  CONSTRAINT `FK1C825194D9E2BF27` FOREIGN KEY (`departmentId`) REFERENCES `bdc_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_role
-- ----------------------------
INSERT INTO `bdc_role` VALUES ('1', '超级管理员', 'JS0000', '超级管理员角色', '1');
INSERT INTO `bdc_role` VALUES ('2', '角色一', 'JS0001', '', '2');
INSERT INTO `bdc_role` VALUES ('3', '角色二', 'JS0002', '', '2');
INSERT INTO `bdc_role` VALUES ('4', '角色三', 'JS0003', '', '3');
INSERT INTO `bdc_role` VALUES ('5', '角色四', 'JS0004', '', '3');
INSERT INTO `bdc_role` VALUES ('6', '角色五', 'JS0005', '', '4');
INSERT INTO `bdc_role` VALUES ('7', '角色六', 'JS0006', '', '4');
INSERT INTO `bdc_role` VALUES ('8', '实验分析员', 'JS0007', null, '5');
INSERT INTO `bdc_role` VALUES ('9', '复核员', 'JS0008', null, '5');

-- ----------------------------
-- Table structure for bdc_role_power
-- ----------------------------
DROP TABLE IF EXISTS `bdc_role_power`;
CREATE TABLE `bdc_role_power` (
  `role_id` bigint(20) NOT NULL,
  `powerId` bigint(20) NOT NULL,
  PRIMARY KEY  (`role_id`,`powerId`),
  KEY `FK4956BE9A316BE8FD` (`powerId`),
  KEY `FK4956BE9AF992DBE2` (`role_id`),
  CONSTRAINT `FK4956BE9A316BE8FD` FOREIGN KEY (`powerId`) REFERENCES `bdc_power` (`id`),
  CONSTRAINT `FK4956BE9AF992DBE2` FOREIGN KEY (`role_id`) REFERENCES `bdc_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_role_power
-- ----------------------------
INSERT INTO `bdc_role_power` VALUES ('1', '1');
INSERT INTO `bdc_role_power` VALUES ('2', '1');
INSERT INTO `bdc_role_power` VALUES ('3', '1');
INSERT INTO `bdc_role_power` VALUES ('4', '1');
INSERT INTO `bdc_role_power` VALUES ('8', '1');
INSERT INTO `bdc_role_power` VALUES ('9', '1');
INSERT INTO `bdc_role_power` VALUES ('1', '2');
INSERT INTO `bdc_role_power` VALUES ('2', '2');
INSERT INTO `bdc_role_power` VALUES ('3', '2');
INSERT INTO `bdc_role_power` VALUES ('4', '2');
INSERT INTO `bdc_role_power` VALUES ('8', '2');
INSERT INTO `bdc_role_power` VALUES ('9', '2');
INSERT INTO `bdc_role_power` VALUES ('1', '3');
INSERT INTO `bdc_role_power` VALUES ('2', '3');
INSERT INTO `bdc_role_power` VALUES ('3', '3');
INSERT INTO `bdc_role_power` VALUES ('4', '3');
INSERT INTO `bdc_role_power` VALUES ('8', '3');
INSERT INTO `bdc_role_power` VALUES ('9', '3');
INSERT INTO `bdc_role_power` VALUES ('1', '4');
INSERT INTO `bdc_role_power` VALUES ('2', '4');
INSERT INTO `bdc_role_power` VALUES ('3', '4');
INSERT INTO `bdc_role_power` VALUES ('4', '4');
INSERT INTO `bdc_role_power` VALUES ('8', '4');
INSERT INTO `bdc_role_power` VALUES ('1', '5');
INSERT INTO `bdc_role_power` VALUES ('2', '5');
INSERT INTO `bdc_role_power` VALUES ('3', '5');
INSERT INTO `bdc_role_power` VALUES ('4', '5');
INSERT INTO `bdc_role_power` VALUES ('8', '5');
INSERT INTO `bdc_role_power` VALUES ('9', '5');
INSERT INTO `bdc_role_power` VALUES ('1', '6');
INSERT INTO `bdc_role_power` VALUES ('2', '6');
INSERT INTO `bdc_role_power` VALUES ('3', '6');
INSERT INTO `bdc_role_power` VALUES ('4', '6');
INSERT INTO `bdc_role_power` VALUES ('8', '6');
INSERT INTO `bdc_role_power` VALUES ('9', '6');
INSERT INTO `bdc_role_power` VALUES ('1', '7');
INSERT INTO `bdc_role_power` VALUES ('2', '7');
INSERT INTO `bdc_role_power` VALUES ('3', '7');
INSERT INTO `bdc_role_power` VALUES ('4', '7');
INSERT INTO `bdc_role_power` VALUES ('8', '7');
INSERT INTO `bdc_role_power` VALUES ('9', '7');
INSERT INTO `bdc_role_power` VALUES ('1', '8');
INSERT INTO `bdc_role_power` VALUES ('2', '8');
INSERT INTO `bdc_role_power` VALUES ('3', '8');
INSERT INTO `bdc_role_power` VALUES ('4', '8');
INSERT INTO `bdc_role_power` VALUES ('8', '8');
INSERT INTO `bdc_role_power` VALUES ('9', '8');
INSERT INTO `bdc_role_power` VALUES ('1', '9');
INSERT INTO `bdc_role_power` VALUES ('2', '9');
INSERT INTO `bdc_role_power` VALUES ('3', '9');
INSERT INTO `bdc_role_power` VALUES ('4', '9');
INSERT INTO `bdc_role_power` VALUES ('8', '9');
INSERT INTO `bdc_role_power` VALUES ('9', '9');
INSERT INTO `bdc_role_power` VALUES ('1', '10');
INSERT INTO `bdc_role_power` VALUES ('2', '10');
INSERT INTO `bdc_role_power` VALUES ('3', '10');
INSERT INTO `bdc_role_power` VALUES ('4', '10');
INSERT INTO `bdc_role_power` VALUES ('8', '10');
INSERT INTO `bdc_role_power` VALUES ('1', '11');
INSERT INTO `bdc_role_power` VALUES ('2', '11');
INSERT INTO `bdc_role_power` VALUES ('3', '11');
INSERT INTO `bdc_role_power` VALUES ('4', '11');
INSERT INTO `bdc_role_power` VALUES ('8', '11');
INSERT INTO `bdc_role_power` VALUES ('1', '12');
INSERT INTO `bdc_role_power` VALUES ('2', '12');
INSERT INTO `bdc_role_power` VALUES ('3', '12');
INSERT INTO `bdc_role_power` VALUES ('4', '12');
INSERT INTO `bdc_role_power` VALUES ('8', '12');
INSERT INTO `bdc_role_power` VALUES ('1', '13');
INSERT INTO `bdc_role_power` VALUES ('2', '13');
INSERT INTO `bdc_role_power` VALUES ('3', '13');
INSERT INTO `bdc_role_power` VALUES ('4', '13');
INSERT INTO `bdc_role_power` VALUES ('8', '13');
INSERT INTO `bdc_role_power` VALUES ('1', '14');
INSERT INTO `bdc_role_power` VALUES ('2', '14');
INSERT INTO `bdc_role_power` VALUES ('3', '14');
INSERT INTO `bdc_role_power` VALUES ('4', '14');
INSERT INTO `bdc_role_power` VALUES ('8', '14');
INSERT INTO `bdc_role_power` VALUES ('1', '15');
INSERT INTO `bdc_role_power` VALUES ('2', '15');
INSERT INTO `bdc_role_power` VALUES ('3', '15');
INSERT INTO `bdc_role_power` VALUES ('4', '15');
INSERT INTO `bdc_role_power` VALUES ('8', '15');
INSERT INTO `bdc_role_power` VALUES ('1', '16');
INSERT INTO `bdc_role_power` VALUES ('2', '16');
INSERT INTO `bdc_role_power` VALUES ('3', '16');
INSERT INTO `bdc_role_power` VALUES ('4', '16');
INSERT INTO `bdc_role_power` VALUES ('8', '16');
INSERT INTO `bdc_role_power` VALUES ('1', '17');
INSERT INTO `bdc_role_power` VALUES ('2', '17');
INSERT INTO `bdc_role_power` VALUES ('3', '17');
INSERT INTO `bdc_role_power` VALUES ('4', '17');
INSERT INTO `bdc_role_power` VALUES ('8', '17');
INSERT INTO `bdc_role_power` VALUES ('1', '18');
INSERT INTO `bdc_role_power` VALUES ('2', '18');
INSERT INTO `bdc_role_power` VALUES ('3', '18');
INSERT INTO `bdc_role_power` VALUES ('4', '18');
INSERT INTO `bdc_role_power` VALUES ('8', '18');
INSERT INTO `bdc_role_power` VALUES ('1', '19');
INSERT INTO `bdc_role_power` VALUES ('2', '19');
INSERT INTO `bdc_role_power` VALUES ('3', '19');
INSERT INTO `bdc_role_power` VALUES ('4', '19');
INSERT INTO `bdc_role_power` VALUES ('8', '19');
INSERT INTO `bdc_role_power` VALUES ('1', '20');
INSERT INTO `bdc_role_power` VALUES ('2', '20');
INSERT INTO `bdc_role_power` VALUES ('3', '20');
INSERT INTO `bdc_role_power` VALUES ('4', '20');
INSERT INTO `bdc_role_power` VALUES ('8', '20');
INSERT INTO `bdc_role_power` VALUES ('1', '21');
INSERT INTO `bdc_role_power` VALUES ('2', '21');
INSERT INTO `bdc_role_power` VALUES ('3', '21');
INSERT INTO `bdc_role_power` VALUES ('4', '21');
INSERT INTO `bdc_role_power` VALUES ('8', '21');
INSERT INTO `bdc_role_power` VALUES ('1', '22');
INSERT INTO `bdc_role_power` VALUES ('2', '22');
INSERT INTO `bdc_role_power` VALUES ('3', '22');
INSERT INTO `bdc_role_power` VALUES ('4', '22');
INSERT INTO `bdc_role_power` VALUES ('8', '22');
INSERT INTO `bdc_role_power` VALUES ('1', '23');
INSERT INTO `bdc_role_power` VALUES ('2', '23');
INSERT INTO `bdc_role_power` VALUES ('3', '23');
INSERT INTO `bdc_role_power` VALUES ('4', '23');
INSERT INTO `bdc_role_power` VALUES ('8', '23');
INSERT INTO `bdc_role_power` VALUES ('1', '24');
INSERT INTO `bdc_role_power` VALUES ('2', '24');
INSERT INTO `bdc_role_power` VALUES ('3', '24');
INSERT INTO `bdc_role_power` VALUES ('4', '24');
INSERT INTO `bdc_role_power` VALUES ('8', '24');
INSERT INTO `bdc_role_power` VALUES ('1', '25');
INSERT INTO `bdc_role_power` VALUES ('2', '25');
INSERT INTO `bdc_role_power` VALUES ('3', '25');
INSERT INTO `bdc_role_power` VALUES ('4', '25');
INSERT INTO `bdc_role_power` VALUES ('8', '25');
INSERT INTO `bdc_role_power` VALUES ('1', '26');
INSERT INTO `bdc_role_power` VALUES ('2', '26');
INSERT INTO `bdc_role_power` VALUES ('3', '26');
INSERT INTO `bdc_role_power` VALUES ('4', '26');
INSERT INTO `bdc_role_power` VALUES ('8', '26');
INSERT INTO `bdc_role_power` VALUES ('1', '27');
INSERT INTO `bdc_role_power` VALUES ('2', '27');
INSERT INTO `bdc_role_power` VALUES ('3', '27');
INSERT INTO `bdc_role_power` VALUES ('4', '27');
INSERT INTO `bdc_role_power` VALUES ('8', '27');
INSERT INTO `bdc_role_power` VALUES ('1', '28');
INSERT INTO `bdc_role_power` VALUES ('2', '28');
INSERT INTO `bdc_role_power` VALUES ('3', '28');
INSERT INTO `bdc_role_power` VALUES ('4', '28');
INSERT INTO `bdc_role_power` VALUES ('8', '28');
INSERT INTO `bdc_role_power` VALUES ('1', '29');
INSERT INTO `bdc_role_power` VALUES ('2', '29');
INSERT INTO `bdc_role_power` VALUES ('3', '29');
INSERT INTO `bdc_role_power` VALUES ('4', '29');
INSERT INTO `bdc_role_power` VALUES ('8', '29');
INSERT INTO `bdc_role_power` VALUES ('1', '30');
INSERT INTO `bdc_role_power` VALUES ('2', '30');
INSERT INTO `bdc_role_power` VALUES ('3', '30');
INSERT INTO `bdc_role_power` VALUES ('4', '30');
INSERT INTO `bdc_role_power` VALUES ('8', '30');
INSERT INTO `bdc_role_power` VALUES ('1', '31');
INSERT INTO `bdc_role_power` VALUES ('2', '31');
INSERT INTO `bdc_role_power` VALUES ('3', '31');
INSERT INTO `bdc_role_power` VALUES ('4', '31');
INSERT INTO `bdc_role_power` VALUES ('8', '31');
INSERT INTO `bdc_role_power` VALUES ('1', '32');
INSERT INTO `bdc_role_power` VALUES ('2', '32');
INSERT INTO `bdc_role_power` VALUES ('3', '32');
INSERT INTO `bdc_role_power` VALUES ('4', '32');
INSERT INTO `bdc_role_power` VALUES ('8', '32');
INSERT INTO `bdc_role_power` VALUES ('1', '33');
INSERT INTO `bdc_role_power` VALUES ('1', '34');

-- ----------------------------
-- Table structure for bdc_selfsampleinfo_analysisproject
-- ----------------------------
DROP TABLE IF EXISTS `bdc_selfsampleinfo_analysisproject`;
CREATE TABLE `bdc_selfsampleinfo_analysisproject` (
  `sample_id` bigint(20) NOT NULL,
  `analysisProjectId` bigint(20) NOT NULL,
  PRIMARY KEY  (`sample_id`,`analysisProjectId`),
  KEY `FK3C52FBE05623344D` (`analysisProjectId`),
  KEY `FK3C52FBE0751BA544` (`sample_id`),
  CONSTRAINT `FK3C52FBE05623344D` FOREIGN KEY (`analysisProjectId`) REFERENCES `bdc_analysisproject` (`id`),
  CONSTRAINT `FK3C52FBE0751BA544` FOREIGN KEY (`sample_id`) REFERENCES `bdc_selfsendsampleinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_selfsampleinfo_analysisproject
-- ----------------------------
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('27', '4');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('28', '4');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('29', '4');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('51', '4');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('57', '4');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('58', '4');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('29', '5');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('30', '5');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('51', '5');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('56', '5');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('58', '5');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('17', '7');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('23', '7');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('26', '7');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('40', '7');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('45', '7');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('47', '7');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('24', '8');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('25', '8');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('26', '8');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('38', '8');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('40', '8');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('46', '8');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('47', '8');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('18', '11');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('33', '11');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('34', '11');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('36', '11');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('48', '11');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('60', '11');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('61', '11');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('19', '15');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('31', '15');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('32', '15');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('52', '15');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('53', '15');
INSERT INTO `bdc_selfsampleinfo_analysisproject` VALUES ('59', '15');

-- ----------------------------
-- Table structure for bdc_selfsendsampleinfo
-- ----------------------------
DROP TABLE IF EXISTS `bdc_selfsendsampleinfo`;
CREATE TABLE `bdc_selfsendsampleinfo` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) NOT NULL,
  `sampleName` varchar(255) default NULL,
  `sampleState` varchar(255) default NULL,
  `other` varchar(255) default NULL,
  `client` varchar(255) default NULL,
  `date` date default NULL,
  `deliver` int(11) default NULL,
  `analysisProject` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `projectId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `identify` (`identify`),
  KEY `FKB3DEB62A2305D225` (`projectId`),
  KEY `FKB3DEB62AF61A6272` (`analysisProject`),
  KEY `FKB3DEB62A75ADE3D9` (`userId`),
  CONSTRAINT `FKB3DEB62A2305D225` FOREIGN KEY (`projectId`) REFERENCES `bdc_project` (`id`),
  CONSTRAINT `FKB3DEB62A75ADE3D9` FOREIGN KEY (`userId`) REFERENCES `bdc_user` (`id`),
  CONSTRAINT `FKB3DEB62AF61A6272` FOREIGN KEY (`analysisProject`) REFERENCES `bdc_analysisproject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_selfsendsampleinfo
-- ----------------------------
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('2', 'Z0002', '样品一', '废土', '无备注', '委托单位', '2016-03-22', '0', '12', '1', '2');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('3', 'Z0003', '样品一', '污水', '无备注', '委托单位', '2016-03-23', '1', '7', '1', '3');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('4', 'Z0004', '样品二', '土壤', '无备注', '委托单位', '2016-03-23', '1', '11', '1', '3');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('5', 'Z0005', '样品三', '废气', '无备注', '委托单位', '2016-03-23', '1', '4', '1', '3');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('6', 'Z0006', '样品四', '固定', '无备注', '委托单位', '2016-03-23', '1', '16', '1', '3');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('8', 'Z0008', '样品一', '污水', '无备注', null, null, '0', '7', null, null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('9', 'Z0009', '样品二', '污水', '无', null, null, '0', '7', null, null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('17', 'Z0017', '样品八', '废水', '无备注', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('18', 'Z0018', '样品九', '土壤', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('19', 'Z0019', '样品十', '固体', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('23', 'Z0023', '样品一', '水状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('24', 'Z0024', '样品二', '水状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('25', 'Z0025', '样品三', '水状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('26', 'Z0026', '样品四', '水状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('27', 'Z0027', '样品五', '气状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('28', 'Z0028', '样品六', '气状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('29', 'Z0029', '样品七', '气状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('30', 'Z0030', '样品八', '气状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('31', 'Z0031', '样品九', '固体状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('32', 'Z0032', '样品十', '固体状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('33', 'Z0033', '样品十一', '土壤状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('34', 'Z0034', '样品十二', '土壤状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('36', 'Z0036', '样品十三', '土壤状态', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('38', 'Z0038', '样品一', '污水', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('40', 'Z0040', '样品三', '污水', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('43', 'Z0043', '12', '32', '123', null, null, '0', null, null, null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('45', 'Z0045', '样品一', '污水', '无', '委托单位为甲方xxx', '2016-04-05', '1', null, '1', '7');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('46', 'Z0046', '样品二', '污水', '无', '委托单位为甲方xxx', '2016-04-05', '1', null, '1', '7');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('47', 'Z0047', '样品三', '污水', '无', '委托单位为甲方xxx', '2016-04-05', '1', null, '1', '7');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('48', 'Z0048', '样品四', '土壤', '无', '委托单位为甲方xxx', '2016-04-05', '1', null, '1', '7');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('49', 'Z0049', '样品五', '废气', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('50', 'Z0050', '12', '32', '4', '委托单位为甲方xxx', '2016-04-05', '0', null, null, null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('51', 'Z0051', '样品六', '废气', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('52', 'Z0052', '样品七', '固体', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('53', 'Z0053', '样品八', '固定', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, '1', null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('55', 'Z0055', '12', '32', '43', '委托单位为甲方xxx', '2016-04-05', '0', null, null, null);
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('56', 'Z0056', '样品五', '废气', '无', '委托单位为甲方xxx', '2016-04-05', '1', null, '1', '7');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('57', 'Z0057', '样品六', '废气', '无', '委托单位为甲方xxx', '2016-04-05', '1', null, '1', '7');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('58', 'Z0058', '样品七', '废气', '无', '委托单位为甲方xxx', '2016-04-05', '1', null, '1', '7');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('59', 'Z0059', '样品八', '固体', '无', '委托单位为甲方xxx', '2016-04-05', '1', null, '1', '7');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('60', 'Z0060', '样品九', '土壤', '无', '委托单位为甲方xxx', '2016-04-05', '1', null, '1', '7');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('61', 'Z0061', '样品十', '土壤', '无', '委托单位为甲方xxx', '2016-04-05', '1', null, '1', '7');
INSERT INTO `bdc_selfsendsampleinfo` VALUES ('62', 'Z0062', '12', '32', '无', '委托单位为甲方xxx', '2016-04-05', '0', null, null, null);

-- ----------------------------
-- Table structure for bdc_servicecontract
-- ----------------------------
DROP TABLE IF EXISTS `bdc_servicecontract`;
CREATE TABLE `bdc_servicecontract` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) NOT NULL,
  `name` varchar(500) default NULL,
  `context` varchar(2000) default NULL,
  `clientResp` varchar(1000) default NULL,
  `serviceResp` varchar(1000) default NULL,
  `deadLine` date default NULL,
  `times` int(11) default NULL,
  `cost` double default NULL,
  `client` varchar(255) default NULL,
  `clientAddress` varchar(255) default NULL,
  `clientTel` varchar(255) default NULL,
  `service` varchar(255) default NULL,
  `serviceAddress` varchar(255) default NULL,
  `serviceTel` varchar(255) default NULL,
  `serviceBank` varchar(255) default NULL,
  `serviceCard` varchar(255) default NULL,
  `bearUnit` varchar(255) default NULL,
  `bearUnitAddress` varchar(255) default NULL,
  `bearUnitTel` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `identify` (`identify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_servicecontract
-- ----------------------------

-- ----------------------------
-- Table structure for bdc_templet_department
-- ----------------------------
DROP TABLE IF EXISTS `bdc_templet_department`;
CREATE TABLE `bdc_templet_department` (
  `templet_id` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`templet_id`,`department_id`),
  KEY `FKE428AD684B259062` (`department_id`),
  KEY `FKE428AD688780A707` (`templet_id`),
  CONSTRAINT `FKE428AD684B259062` FOREIGN KEY (`department_id`) REFERENCES `bdc_department` (`id`),
  CONSTRAINT `FKE428AD688780A707` FOREIGN KEY (`templet_id`) REFERENCES `bdc_commontemplet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_templet_department
-- ----------------------------
INSERT INTO `bdc_templet_department` VALUES ('1', '1');
INSERT INTO `bdc_templet_department` VALUES ('1', '2');
INSERT INTO `bdc_templet_department` VALUES ('1', '3');

-- ----------------------------
-- Table structure for bdc_trafficcontract
-- ----------------------------
DROP TABLE IF EXISTS `bdc_trafficcontract`;
CREATE TABLE `bdc_trafficcontract` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) NOT NULL,
  `customerName` varchar(255) default NULL,
  `customerCode` varchar(255) default NULL,
  `customerAddress` varchar(255) default NULL,
  `customerTel` varchar(255) default NULL,
  `customerPeople` varchar(255) default NULL,
  `customerFax` varchar(255) default NULL,
  `projectName` varchar(255) default NULL,
  `projectAim` varchar(255) default NULL,
  `projectType` varchar(255) default NULL,
  `projectWay` int(11) default NULL,
  `projectWayText` varchar(255) default NULL,
  `subpackageName` varchar(255) default NULL,
  `subProject` varchar(255) default NULL,
  `paymentWay` varchar(255) default NULL,
  `deadLine` date default NULL,
  `cost` double default NULL,
  `inRoom` int(11) default NULL,
  `secrecy` int(11) default NULL,
  `other` varchar(255) default NULL,
  `entrusted` varchar(255) default NULL,
  `entrustedCode` varchar(255) default NULL,
  `entrustedAddress` varchar(255) default NULL,
  `entrustedTel` varchar(255) default NULL,
  `entrustedFax` varchar(255) default NULL,
  `contractors` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `identify` (`identify`),
  KEY `FKE56A3A5128F1DE51` (`contractors`),
  CONSTRAINT `FKE56A3A5128F1DE51` FOREIGN KEY (`contractors`) REFERENCES `bdc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_trafficcontract
-- ----------------------------
INSERT INTO `bdc_trafficcontract` VALUES ('1', '2016001', '常州市xxxx环保部门', '213023', '江苏省常州市', '13816157552', '张三', '', '项目名称为xxxxx', '监测目的为xxxx', '验收监测', '0', '', '', '', '挂号邮寄', '2016-03-24', '123', '0', '1', '', '邦达诚环境监测中心（江苏）有限公司', '213022', '常州市新北区环保产业园环保一路2号', '0519-89802621', '0519-89802605', '1');
INSERT INTO `bdc_trafficcontract` VALUES ('2', '2016002', '委托单位', '123456', '地址', '', '张三', '', '项目名词', '监测目的', '委托监测', '0', '', '', '', '挂号邮寄', '2016-03-25', '123', '0', '1', '', '邦达诚环境监测中心（江苏）有限公司', '213022', '常州市新北区环保产业园环保一路2号', '0519-89802621', '0519-89802605', '1');
INSERT INTO `bdc_trafficcontract` VALUES ('3', '2016003', '委托单位', '212023', '江苏省常州市', '13816157552', '张三', '', '项目名称为xxxx', '检测目的为xxx', '委托监测', '0', '', '', '', '挂号邮寄', '2016-03-26', '123', '0', '1', '', '邦达诚环境监测中心（江苏）有限公司', '213022', '常州市新北区环保产业园环保一路2号', '0519-89802621', '0519-89802605', '1');
INSERT INTO `bdc_trafficcontract` VALUES ('4', '2016004', '江苏省常州市环保局', '2123023', '江苏常州', '', '张三', '1321515', '项目名词为xxxx', '监测目的为xxxx', '委托分析', '1', '监测方式为xxxx', '五分报信息', '分包项目为xxx', '挂号邮寄', '2016-04-14', '1231', '0', '1', '无其他约定', '邦达诚环境监测中心（江苏）有限公司', '213022', '常州市新北区环保产业园环保一路2号', '0519-89802621', '0519-89802605', '1');
INSERT INTO `bdc_trafficcontract` VALUES ('12', '2016012', '委托单位为xxx', '213023', '江苏省常州市', '13816157552', '张安', '0519-83276724', '项目名称为xxx', '监测目的为xxx', '验收监测', '0', '', '分包单位为xxx', '分包项目为xxx', '挂号邮寄', '2016-04-21', '123', '0', '1', '无', '邦达诚环境监测中心（江苏）有限公司', '213022', '常州市新北区环保产业园环保一路2号', '0519-89802621', '0519-89802605', '1');
INSERT INTO `bdc_trafficcontract` VALUES ('13', '2016013', '12', '', '', '', '34', '', '56', '12', '委托监测', '0', '', '', '', '挂号邮寄', '2016-04-21', '12', '0', '1', '', '邦达诚环境监测中心（江苏）有限公司', '213022', '常州市新北区环保产业园环保一路2号', '0519-89802621', '0519-89802605', '1');
INSERT INTO `bdc_trafficcontract` VALUES ('28', '2016026', '1234', '', '32', '', '42', '', '12', '42', '委托监测', '0', '', '', '', '挂号邮寄', '2016-04-06', '12', '0', '1', '', '邦达诚环境监测中心（江苏）有限公司', '213022', '常州市新北区环保产业园环保一路2号', '0519-89802621', '0519-89802605', '1');
INSERT INTO `bdc_trafficcontract` VALUES ('34', '2016032', '委托单位为甲方xxx', '213023', '江苏省常州市钟楼区', '13816157552', '张三', '0519-83276724', '关于六号桥水质环境监测的项目', '检测环境是否达标', '验收监测', '1', '这是客户指定的方式', '无分包单位信息', '无分包项目', '挂号邮寄', '2016-04-29', '123', '0', '1', '无其他约定', '邦达诚环境监测中心（江苏）有限公司', '213022', '常州市新北区环保产业园环保一路2号', '0519-89802621', '0519-89802605', '1');

-- ----------------------------
-- Table structure for bdc_user
-- ----------------------------
DROP TABLE IF EXISTS `bdc_user`;
CREATE TABLE `bdc_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `identify` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` varchar(255) default NULL,
  `idCard` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `workTel` varchar(255) default NULL,
  `entryTime` date default NULL,
  `address` varchar(255) default NULL,
  `contacts` varchar(255) default NULL,
  `contactsTel` varchar(255) default NULL,
  `role_id` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `identify` (`identify`),
  KEY `FK1C83BCE9F992DBE2` (`role_id`),
  CONSTRAINT `FK1C83BCE9F992DBE2` FOREIGN KEY (`role_id`) REFERENCES `bdc_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bdc_user
-- ----------------------------
INSERT INTO `bdc_user` VALUES ('1', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', null, null, null, null, null, null, null, null, '1');
INSERT INTO `bdc_user` VALUES ('2', 'YH0001', '张三', '670b14728ad9902aecba32e22fa4f6bd', '男', '320404199202214414', '13816157552', '', '2016-03-25', '', '', '', '2');
INSERT INTO `bdc_user` VALUES ('3', 'YH0002', '李四', '670b14728ad9902aecba32e22fa4f6bd', '男', '320404199202214414', '13816157552', '', null, '', '', '', '3');
INSERT INTO `bdc_user` VALUES ('4', 'YH0003', '王五', '670b14728ad9902aecba32e22fa4f6bd', '男', '320404199202214414', '13816157552', '', null, '', '', '', '4');
INSERT INTO `bdc_user` VALUES ('5', 'YH0004', '赵柳', '670b14728ad9902aecba32e22fa4f6bd', '男', '320404199202214414', '13816157552', '', null, '', '', '', '4');
INSERT INTO `bdc_user` VALUES ('6', 'YH0005', '测试', '670b14728ad9902aecba32e22fa4f6bd', '男', '320404199202214414', '13816157552', '', null, '', '', '', '5');
INSERT INTO `bdc_user` VALUES ('7', 'YH0006', '分析员1', '670b14728ad9902aecba32e22fa4f6bd', '男', '320404199202214414', '13816157552', null, '2016-03-25', null, null, null, '8');
INSERT INTO `bdc_user` VALUES ('8', 'YH0007', '分析员2', '670b14728ad9902aecba32e22fa4f6bd', null, null, null, null, null, null, null, null, '8');
INSERT INTO `bdc_user` VALUES ('9', 'YH0008', '分析员3', '670b14728ad9902aecba32e22fa4f6bd', null, null, null, null, null, null, null, null, '8');
INSERT INTO `bdc_user` VALUES ('10', 'YH0009', '分析员4', '670b14728ad9902aecba32e22fa4f6bd', null, null, null, null, null, null, null, null, '8');
INSERT INTO `bdc_user` VALUES ('11', 'YH0010', '分析员5', '670b14728ad9902aecba32e22fa4f6bd', null, null, null, null, null, null, null, null, '8');
INSERT INTO `bdc_user` VALUES ('12', 'YH0011', '复核员1', '670b14728ad9902aecba32e22fa4f6bd', null, null, null, null, null, null, null, null, '9');
INSERT INTO `bdc_user` VALUES ('13', 'YH0012', '复核员2', '670b14728ad9902aecba32e22fa4f6bd', null, null, null, null, null, null, null, null, '9');
INSERT INTO `bdc_user` VALUES ('14', 'YH0013', '复核员3', '670b14728ad9902aecba32e22fa4f6bd', null, null, null, null, null, null, null, null, '9');
INSERT INTO `bdc_user` VALUES ('15', 'YH0014', '复核员4', '670b14728ad9902aecba32e22fa4f6bd', null, null, null, null, null, null, null, null, '9');
INSERT INTO `bdc_user` VALUES ('16', 'YH0015', '测试密码', '670b14728ad9902aecba32e22fa4f6bd', '男', '320404199202214414', '13816157552', '', '2016-04-14', '', '', '', '2');
