/*
MySQL Data Transfer
Source Host: localhost
Source Database: hospital
Target Host: localhost
Target Database: hospital
Date: 2017/3/20 21:20:49
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bed
-- ----------------------------
CREATE TABLE `bed` (
  `bno` int(11) NOT NULL,
  `pno` int(11) DEFAULT NULL,
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` int(11) NOT NULL,
  `pno` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sno` (`sno`),
  KEY `pno` (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for drug
-- ----------------------------
CREATE TABLE `drug` (
  `dno` int(11) NOT NULL,
  `name` char(50) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fee
-- ----------------------------
CREATE TABLE `fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pno` int(11) NOT NULL,
  `sno` int(11) NOT NULL,
  `dno` int(11) NOT NULL,
  `price` double NOT NULL,
  `cout` int(11) NOT NULL,
  `date` date NOT NULL,
  `hj` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pno` (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for job
-- ----------------------------
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` char(20) NOT NULL,
  `grade` char(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for makedrug
-- ----------------------------
CREATE TABLE `makedrug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pno` int(11) NOT NULL,
  `dno` int(11) NOT NULL,
  `sno` int(11) NOT NULL,
  `cout` int(2) NOT NULL,
  `makeDrugDate` date NOT NULL,
  `useDrugDate` date NOT NULL,
  `send` char(8) NOT NULL DEFAULT '否',
  PRIMARY KEY (`id`),
  KEY `pno` (`pno`),
  KEY `dno` (`dno`),
  KEY `sno` (`sno`),
  KEY `useDrugDate` (`useDrugDate`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for money
-- ----------------------------
CREATE TABLE `money` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pno` int(11) NOT NULL,
  `sth` char(20) NOT NULL,
  `time` date NOT NULL,
  `fee` double NOT NULL DEFAULT '1000',
  PRIMARY KEY (`id`),
  KEY `pno` (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for patient
-- ----------------------------
CREATE TABLE `patient` (
  `pno` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL,
  `sex` char(4) NOT NULL,
  `age` int(11) NOT NULL,
  `address` char(50) NOT NULL,
  `tel` char(11) NOT NULL,
  `bing` char(50) NOT NULL,
  `time` date NOT NULL,
  `bed` int(11) NOT NULL,
  `_desc` text,
  PRIMARY KEY (`pno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` int(11) NOT NULL,
  `name` char(20) NOT NULL,
  `password` char(20) NOT NULL,
  `sex` char(4) NOT NULL,
  `tel` char(11) NOT NULL,
  `qq` char(12) NOT NULL,
  `job_code` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sno` (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- View structure for v_bill
-- ----------------------------
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bill` AS select `vm`.`pno` AS `pno`,`vm`.`name` AS `name`,`vm`.`sum` AS `sum`,`vf`.`feeAll` AS `feeAll`,(`vm`.`sum` - `vf`.`feeAll`) AS `jieyu` from (`v_money` `vm` join `v_fee` `vf`) where (`vm`.`pno` = `vf`.`pno`);

-- ----------------------------
-- View structure for v_fee
-- ----------------------------
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_fee` AS select `fee`.`pno` AS `pno`,sum(`fee`.`hj`) AS `feeAll` from `fee` group by `fee`.`pno` having `fee`.`pno` in (select `bed`.`pno` from `bed` where (`bed`.`pno` <> 0));

-- ----------------------------
-- View structure for v_money
-- ----------------------------
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_money` AS select `m`.`pno` AS `pno`,`p`.`name` AS `name`,sum(`m`.`fee`) AS `sum` from (`money` `m` join `patient` `p`) where ((`p`.`pno` = `m`.`pno`) and `m`.`pno` in (select `bed`.`pno` from `bed` where (`bed`.`pno` <> 0))) group by `m`.`pno`;

-- ----------------------------
-- View structure for vfee
-- ----------------------------
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vfee` AS select `p`.`name` AS `name`,(select sum(`money`.`fee`) from `money` where (`money`.`pno` = 7)) AS `(select sum(fee) from money where pno=7)`,sum(`f`.`hj`) AS `sum(f.hj)`,((select sum(`money`.`fee`) from `money` where (`money`.`pno` = 7)) - sum(`f`.`hj`)) AS `(select sum(fee) from money where pno=7)-sum(f.hj)` from (`fee` `f` join `patient` `p`) where ((`p`.`pno` = 7) and (`f`.`pno` = 7));

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bed` VALUES ('1', '1');
INSERT INTO `bed` VALUES ('2', '4');
INSERT INTO `bed` VALUES ('3', '3');
INSERT INTO `bed` VALUES ('4', '2');
INSERT INTO `bed` VALUES ('5', '5');
INSERT INTO `bed` VALUES ('6', '6');
INSERT INTO `bed` VALUES ('7', '7');
INSERT INTO `bed` VALUES ('8', '8');
INSERT INTO `bed` VALUES ('9', '9');
INSERT INTO `bed` VALUES ('10', '10');
INSERT INTO `bed` VALUES ('11', '0');
INSERT INTO `bed` VALUES ('12', '0');
INSERT INTO `bed` VALUES ('13', '0');
INSERT INTO `bed` VALUES ('14', '0');
INSERT INTO `bed` VALUES ('15', '0');
INSERT INTO `bed` VALUES ('16', '0');
INSERT INTO `bed` VALUES ('17', '0');
INSERT INTO `bed` VALUES ('18', '0');
INSERT INTO `bed` VALUES ('19', '0');
INSERT INTO `bed` VALUES ('20', '0');
INSERT INTO `bed` VALUES ('21', '0');
INSERT INTO `bed` VALUES ('22', '0');
INSERT INTO `bed` VALUES ('23', '0');
INSERT INTO `bed` VALUES ('24', '0');
INSERT INTO `bed` VALUES ('25', '0');
INSERT INTO `bed` VALUES ('26', '0');
INSERT INTO `bed` VALUES ('27', '0');
INSERT INTO `bed` VALUES ('28', '0');
INSERT INTO `bed` VALUES ('29', '0');
INSERT INTO `bed` VALUES ('30', '0');
INSERT INTO `doctor` VALUES ('1', '20170001', '1');
INSERT INTO `doctor` VALUES ('2', '20170002', '1');
INSERT INTO `doctor` VALUES ('3', '20170002', '2');
INSERT INTO `doctor` VALUES ('4', '20170002', '3');
INSERT INTO `doctor` VALUES ('5', '20170002', '4');
INSERT INTO `doctor` VALUES ('6', '20170002', '5');
INSERT INTO `doctor` VALUES ('7', '20170002', '6');
INSERT INTO `doctor` VALUES ('8', '20170001', '2');
INSERT INTO `doctor` VALUES ('9', '20170001', '3');
INSERT INTO `doctor` VALUES ('10', '20170001', '6');
INSERT INTO `doctor` VALUES ('11', '20170001', '7');
INSERT INTO `doctor` VALUES ('12', '20170001', '8');
INSERT INTO `doctor` VALUES ('13', '20170002', '7');
INSERT INTO `doctor` VALUES ('14', '20170002', '8');
INSERT INTO `doctor` VALUES ('15', '20170001', '4');
INSERT INTO `doctor` VALUES ('16', '20170001', '5');
INSERT INTO `doctor` VALUES ('17', '20170002', '9');
INSERT INTO `doctor` VALUES ('18', '20170002', '10');
INSERT INTO `doctor` VALUES ('19', '20170011', '10');
INSERT INTO `drug` VALUES ('0', '床位费', '20');
INSERT INTO `drug` VALUES ('1', '药物1', '26.8');
INSERT INTO `drug` VALUES ('2', '药物2', '56.9');
INSERT INTO `drug` VALUES ('3', '药物3', '78.5');
INSERT INTO `drug` VALUES ('4', '药物4', '150.5');
INSERT INTO `drug` VALUES ('5', '药物5', '268');
INSERT INTO `drug` VALUES ('6', '药物6', '135.6');
INSERT INTO `drug` VALUES ('7', '药物7', '186.5');
INSERT INTO `drug` VALUES ('8', '药物8', '350');
INSERT INTO `drug` VALUES ('9', '药物9', '458');
INSERT INTO `drug` VALUES ('10', '药物10', '265.8');
INSERT INTO `drug` VALUES ('11', '药物11', '98.5');
INSERT INTO `drug` VALUES ('12', '药物12', '600');
INSERT INTO `drug` VALUES ('13', '药物13', '198.6');
INSERT INTO `drug` VALUES ('14', '药物14', '800');
INSERT INTO `fee` VALUES ('1', '4', '20170001', '1', '26.8', '1', '2017-02-20', '26.8');
INSERT INTO `fee` VALUES ('2', '7', '20170001', '1', '26.8', '2', '2017-02-20', '53.6');
INSERT INTO `fee` VALUES ('3', '7', '20170001', '2', '56.9', '3', '2017-02-20', '170.7');
INSERT INTO `fee` VALUES ('4', '7', '20170001', '3', '78.5', '2', '2017-02-20', '157');
INSERT INTO `fee` VALUES ('5', '7', '20170001', '4', '150.5', '10', '2017-02-20', '1505');
INSERT INTO `fee` VALUES ('6', '1', '20170001', '1', '26.8', '2', '2017-02-02', '53.6');
INSERT INTO `fee` VALUES ('7', '2', '20170002', '0', '20', '1', '2016-02-02', '20');
INSERT INTO `fee` VALUES ('8', '1', '20170002', '0', '20', '1', '2017-02-22', '20');
INSERT INTO `fee` VALUES ('9', '3', '20170002', '0', '20', '1', '2017-02-22', '20');
INSERT INTO `fee` VALUES ('10', '4', '20170002', '0', '20', '1', '2017-02-22', '20');
INSERT INTO `fee` VALUES ('11', '5', '20170002', '0', '20', '1', '2017-02-22', '20');
INSERT INTO `fee` VALUES ('12', '6', '20170002', '0', '20', '1', '2017-02-22', '20');
INSERT INTO `fee` VALUES ('13', '7', '20170002', '0', '20', '1', '2017-02-22', '20');
INSERT INTO `fee` VALUES ('14', '8', '20170002', '0', '20', '1', '2017-02-22', '20');
INSERT INTO `fee` VALUES ('15', '1', '20170001', '4', '150.5', '10', '2017-02-03', '1505');
INSERT INTO `fee` VALUES ('16', '1', '20170001', '1', '26.8', '2', '2017-02-01', '53.6');
INSERT INTO `fee` VALUES ('17', '9', '20170001', '0', '20', '1', '2017-02-22', '20');
INSERT INTO `fee` VALUES ('18', '10', '20170002', '0', '20', '1', '2017-02-22', '20');
INSERT INTO `fee` VALUES ('19', '6', '20170001', '10', '265.8', '5', '2017-02-23', '1329');
INSERT INTO `fee` VALUES ('20', '6', '20170001', '1', '26.8', '2', '2017-02-23', '53.6');
INSERT INTO `fee` VALUES ('21', '1', '20170001', '2', '56.9', '3', '2017-02-23', '170.7');
INSERT INTO `fee` VALUES ('22', '1', '20170001', '3', '78.5', '2', '2017-02-23', '157');
INSERT INTO `fee` VALUES ('23', '2', '20170001', '3', '78.5', '3', '2017-02-23', '235.5');
INSERT INTO `fee` VALUES ('24', '2', '20170001', '4', '150.5', '2', '2017-02-23', '301');
INSERT INTO `fee` VALUES ('25', '5', '20170001', '5', '268', '2', '2017-02-23', '536');
INSERT INTO `fee` VALUES ('26', '5', '20170001', '6', '135.6', '3', '2017-02-23', '406.79999999999995');
INSERT INTO `fee` VALUES ('27', '7', '20170001', '8', '350', '2', '2017-02-23', '700');
INSERT INTO `fee` VALUES ('28', '7', '20170001', '9', '458', '1', '2017-02-23', '458');
INSERT INTO `fee` VALUES ('29', '8', '20170001', '5', '268', '3', '2017-02-23', '804');
INSERT INTO `fee` VALUES ('30', '8', '20170001', '10', '265.8', '3', '2017-02-23', '797.4000000000001');
INSERT INTO `fee` VALUES ('31', '1', '20170001', '1', '26.8', '2', '2017-02-24', '53.6');
INSERT INTO `fee` VALUES ('32', '1', '20170001', '2', '56.9', '3', '2017-02-24', '170.7');
INSERT INTO `fee` VALUES ('33', '1', '20170001', '3', '78.5', '2', '2017-02-24', '157');
INSERT INTO `fee` VALUES ('34', '2', '20170001', '2', '56.9', '2', '2017-02-24', '113.8');
INSERT INTO `fee` VALUES ('35', '2', '20170001', '5', '268', '3', '2017-02-24', '804');
INSERT INTO `fee` VALUES ('36', '2', '20170001', '6', '135.6', '5', '2017-02-24', '678');
INSERT INTO `fee` VALUES ('37', '2', '20170001', '10', '265.8', '2', '2017-02-24', '531.6');
INSERT INTO `fee` VALUES ('38', '5', '20170001', '5', '268', '2', '2017-02-24', '536');
INSERT INTO `fee` VALUES ('39', '5', '20170001', '14', '800', '2', '2017-02-24', '1600');
INSERT INTO `fee` VALUES ('40', '5', '20170001', '11', '98.5', '3', '2017-02-24', '295.5');
INSERT INTO `fee` VALUES ('41', '6', '20170001', '1', '26.8', '1', '2017-02-24', '26.8');
INSERT INTO `fee` VALUES ('42', '6', '20170001', '3', '78.5', '3', '2017-02-24', '235.5');
INSERT INTO `fee` VALUES ('43', '6', '20170001', '5', '268', '2', '2017-02-24', '536');
INSERT INTO `fee` VALUES ('44', '7', '20170001', '7', '186.5', '2', '2017-02-24', '373');
INSERT INTO `fee` VALUES ('45', '7', '20170001', '8', '350', '2', '2017-02-24', '700');
INSERT INTO `fee` VALUES ('46', '7', '20170001', '9', '458', '3', '2017-02-24', '1374');
INSERT INTO `fee` VALUES ('47', '7', '20170001', '12', '600', '2', '2017-02-24', '1200');
INSERT INTO `job` VALUES ('1', '1001', '院长', 'A');
INSERT INTO `job` VALUES ('2', '2001', '主治医师', 'B');
INSERT INTO `job` VALUES ('3', '3001', '医生', 'C');
INSERT INTO `job` VALUES ('4', '4001', '护士长', 'D1');
INSERT INTO `job` VALUES ('5', '4002', '护士', 'D2');
INSERT INTO `job` VALUES ('6', '5001', '药房处', 'E');
INSERT INTO `job` VALUES ('7', '6001', '财务处', 'F');
INSERT INTO `job` VALUES ('8', '7001', '病案室', 'G');
INSERT INTO `makedrug` VALUES ('1', '4', '1', '20170001', '1', '2017-02-03', '2017-02-04', '是');
INSERT INTO `makedrug` VALUES ('2', '7', '1', '20170001', '2', '2017-02-03', '2017-02-04', '是');
INSERT INTO `makedrug` VALUES ('3', '7', '2', '20170001', '3', '2017-02-03', '2017-02-04', '是');
INSERT INTO `makedrug` VALUES ('4', '7', '3', '20170001', '2', '2017-02-03', '2017-02-04', '是');
INSERT INTO `makedrug` VALUES ('5', '7', '4', '20170001', '10', '2017-02-03', '2017-02-04', '是');
INSERT INTO `makedrug` VALUES ('6', '1', '1', '20170001', '2', '2017-02-01', '2017-02-02', '是');
INSERT INTO `makedrug` VALUES ('7', '6', '10', '20170001', '5', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('8', '6', '1', '20170001', '2', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('9', '1', '2', '20170001', '3', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('10', '1', '3', '20170001', '2', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('11', '2', '3', '20170001', '3', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('12', '2', '4', '20170001', '2', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('13', '5', '5', '20170001', '2', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('14', '5', '6', '20170001', '3', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('15', '7', '8', '20170001', '2', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('16', '7', '9', '20170001', '1', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('17', '8', '5', '20170001', '3', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('18', '8', '10', '20170001', '3', '2017-02-23', '2017-02-24', '是');
INSERT INTO `makedrug` VALUES ('19', '1', '1', '20170001', '2', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('20', '1', '2', '20170001', '3', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('21', '1', '3', '20170001', '2', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('22', '2', '2', '20170001', '2', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('23', '2', '5', '20170001', '3', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('24', '2', '6', '20170001', '5', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('25', '2', '10', '20170001', '2', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('26', '5', '5', '20170001', '2', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('27', '5', '14', '20170001', '2', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('28', '5', '11', '20170001', '3', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('29', '6', '1', '20170001', '1', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('30', '6', '3', '20170001', '3', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('31', '6', '5', '20170001', '2', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('32', '7', '7', '20170001', '2', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('33', '7', '8', '20170001', '2', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('34', '7', '9', '20170001', '3', '2017-02-24', '2017-02-25', '否');
INSERT INTO `makedrug` VALUES ('35', '7', '12', '20170001', '2', '2017-02-24', '2017-02-25', '否');
INSERT INTO `money` VALUES ('1', '1', '住院', '2016-01-01', '1000');
INSERT INTO `money` VALUES ('2', '2', '住院', '2016-02-02', '3000');
INSERT INTO `money` VALUES ('3', '3', '住院', '2016-03-03', '4000');
INSERT INTO `money` VALUES ('4', '4', '住院', '2016-04-04', '1000');
INSERT INTO `money` VALUES ('5', '5', '住院', '2016-05-05', '1000');
INSERT INTO `money` VALUES ('6', '6', '住院', '2016-06-06', '1000');
INSERT INTO `money` VALUES ('7', '7', '住院', '2016-07-07', '2000');
INSERT INTO `money` VALUES ('8', '8', '住院', '2017-02-20', '1000');
INSERT INTO `money` VALUES ('9', '9', '住院', '2017-02-22', '1000');
INSERT INTO `money` VALUES ('10', '10', '住院', '2017-02-22', '1000');
INSERT INTO `money` VALUES ('11', '1', '住院', '2017-02-24', '1000');
INSERT INTO `money` VALUES ('12', '6', '住院', '2017-02-24', '300');
INSERT INTO `money` VALUES ('13', '5', '住院', '2017-02-25', '3000');
INSERT INTO `money` VALUES ('14', '7', '住院', '2017-02-26', '5000');
INSERT INTO `money` VALUES ('15', '1', '住院', '2017-02-26', '1000');
INSERT INTO `money` VALUES ('16', '6', '住院', '2017-02-26', '500');
INSERT INTO `money` VALUES ('17', '2', '住院', '2017-02-26', '-316.1');
INSERT INTO `money` VALUES ('18', '10', '住院', '2017-02-26', '-980');
INSERT INTO `money` VALUES ('19', '1', '住院', '2017-02-26', '-658.8');
INSERT INTO `money` VALUES ('20', '5', '住院', '2017-02-26', '-605.7');
INSERT INTO `patient` VALUES ('1', '病人1', '男', '50', '武汉', '15612345678', '胃病', '2016-01-01', '1', 'XXXXXXXXX医院　　　　　\r\n姓名：病人1　　　　性别：男　　　　年龄：50　　　　　\r\n诊断结果：　　　　　\r\n医嘱及建议：　　　　　\r\n注：1、未加盖本院公章无效 2、涂改无效 3、疾病证明，他用无效　　　　　\r\n医师签名（公章）：　　　　　\r\n2017年02月26日　　　　　\r\n-------------------剪----------切----------线-----------------------------\r\n');
INSERT INTO `patient` VALUES ('2', '病人2', '女', '58', '武汉', '15612345678', '骨病', '2016-02-02', '4', 'XXXXXXXXX医院　　　　　\r\n姓名：病人2　　　　性别：女　　　　年龄：58　　　　　\r\n诊断结果：　　　　　\r\n医嘱及建议：　　　　　\r\n注：1、未加盖本院公章无效 2、涂改无效 3、疾病证明，他用无效　　　　　\r\n医师签名（公章）：　　　　　\r\n2017年02月26日　　　　　\r\n-------------------剪----------切----------线-----------------------------\r\n');
INSERT INTO `patient` VALUES ('3', '病人3', '男', '35', '河南', '15612345678', '脊椎', '2016-03-03', '3', 'XXXXXXXXX医院　　　　　\r\n姓名：病人3　　　　性别：男　　　　年龄：35　　　　　\r\n诊断结果：　　　　　\r\n医嘱及建议：　　　　　\r\n注：1、未加盖本院公章无效 2、涂改无效 3、疾病证明，他用无效　　　　　\r\n医师签名（公章）：　　　　　\r\n2017年02月26日　　　　　\r\n-------------------剪----------切----------线-----------------------------\r\n');
INSERT INTO `patient` VALUES ('4', '病人4', '男', '35', '河南', '15612345678', '脊椎', '2016-04-04', '2', 'XXXXXXXXX医院　　　　　\r\n姓名：病人4　　　　性别：男　　　　年龄：35　　　　　\r\n诊断结果：　　　　　\r\n医嘱及建议：　　　　　\r\n注：1、未加盖本院公章无效 2、涂改无效 3、疾病证明，他用无效　　　　　\r\n医师签名（公章）：　　　　　\r\n2017年02月26日　　　　　\r\n-------------------剪----------切----------线-----------------------------\r\n');
INSERT INTO `patient` VALUES ('5', '病人5', '女', '60', '武汉', '15612345678', '骨病', '2016-05-05', '5', 'XXXXXXXXX医院　　　　　\r\n姓名：病人5　　　　性别：女　　　　年龄：60　　　　　\r\n诊断结果：　　　　　\r\n医嘱及建议：　　　　　\r\n注：1、未加盖本院公章无效 2、涂改无效 3、疾病证明，他用无效　　　　　\r\n医师签名（公章）：　　　　　\r\n2017年02月26日　　　　　\r\n-------------------剪----------切----------线-----------------------------\r\n');
INSERT INTO `patient` VALUES ('6', '病人6', '男', '70', '武汉', '15612345678', '胃病', '2016-06-06', '6', 'XXXXXXXXX医院　　　　　\r\n姓名：病人6　　　　性别：男　　　　年龄：70　　　　　\r\n诊断结果：　　　　　\r\n医嘱及建议：　　　　　\r\n注：1、未加盖本院公章无效 2、涂改无效 3、疾病证明，他用无效　　　　　\r\n医师签名（公章）：　　　　　\r\n2017年02月26日　　　　　\r\n-------------------剪----------切----------线-----------------------------\r\n');
INSERT INTO `patient` VALUES ('7', '病人7', '男', '75', '武汉', '15612345678', '胃病', '2016-07-07', '7', null);
INSERT INTO `patient` VALUES ('8', '病人8', '女', '68', '武汉', '15612345678', '手臂', '2016-08-08', '8', null);
INSERT INTO `patient` VALUES ('9', '病人9', '女', '39', '汉口', '15612345678', '腰部', '2017-02-22', '9', null);
INSERT INTO `patient` VALUES ('10', '病人10', '女', '65', '武昌', '15612345678', '手臂', '2017-02-22', '29', null);
INSERT INTO `staff` VALUES ('1', '20160001', '院长', '123456', '男', '15612345678', '12345678', '1001');
INSERT INTO `staff` VALUES ('2', '20160002', '主治医师1', '123456', '男', '15612345678', '12345678', '2001');
INSERT INTO `staff` VALUES ('3', '20170001', '李医生', '123456', '男', '15612345678', '12345678', '3001');
INSERT INTO `staff` VALUES ('4', '20170002', '护士长', '123456', '女', '15612345678', '12345678', '4001');
INSERT INTO `staff` VALUES ('5', '20170003', '护士', '123456', '女', '15612345678', '12345678', '4002');
INSERT INTO `staff` VALUES ('6', '20160003', '药房管理员', '123456', '男', '15612345678', '12345678', '5001');
INSERT INTO `staff` VALUES ('7', '20160004', '费用管理员', '123456', '男', '15612345678', '12345678', '6001');
INSERT INTO `staff` VALUES ('8', '20160005', '病案室管理员', '123456', '男', '15612345678', '12345678', '7001');
INSERT INTO `staff` VALUES ('9', '20170011', '王医生', '123456', '女', '15612345678', '12345678', '3001');
INSERT INTO `staff` VALUES ('10', '20170012', '陈医生', '123456', '女', '15612345678', '12345678', '3001');

-- ----------------------------
-- Trigger structure for tr_fee
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `tr_fee` AFTER INSERT ON `makedrug` FOR EACH ROW begin
select pno,sno,dno,cout,makeDrugDate into @pno,@sno,@dno,@cout,@makeDrugDate from makedrug order by id desc limit 0,1;
select price into @price from drug where dno=@dno;
#select @pno,@sno,@dno,@price,@cout,@makeDrugDate,@price*@cout;
insert into fee values(null,@pno,@sno,@dno,@price,@cout,@makeDrugDate,@price*@cout);
end;;
DELIMITER ;

-- ----------------------------
-- Trigger structure for tr_money
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `tr_money` AFTER INSERT ON `patient` FOR EACH ROW begin
#sql
select max(pno) into @pno from patient;
select bed into @bno from patient where pno=@pno;
select sno into @sno from doctor order by id desc limit 0,1;
insert into fee values(null,@pno,@sno,0,20,1,now(),20);
insert into money values(null,@pno,'住院',now(),1000);
update bed set pno=@pno where bno=@bno;
end;;
DELIMITER ;
