/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - bicycle
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bicycle` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `bicycle`;

/*Table structure for table `tab_bicycle` */

DROP TABLE IF EXISTS `tab_bicycle`;

CREATE TABLE `tab_bicycle` (
  `bicycleid` int(50) NOT NULL AUTO_INCREMENT COMMENT '自行车ID',
  `bianhao` varchar(255) DEFAULT NULL COMMENT '自行车编号',
  `pinpai` varchar(255) DEFAULT NULL COMMENT '自行车品牌',
  `cid` int(20) DEFAULT NULL COMMENT '自行车分类',
  `tianjiariqi` date DEFAULT NULL COMMENT '自行车添加日期',
  `beizhu` varchar(255) DEFAULT NULL COMMENT '自行车备注',
  `status` varchar(255) DEFAULT NULL COMMENT '自行车状态',
  PRIMARY KEY (`bicycleid`),
  KEY `FK_bicycle_category` (`cid`),
  CONSTRAINT `FK_bicycle_category` FOREIGN KEY (`cid`) REFERENCES `tab_category` (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tab_bicycle` */

insert  into `tab_bicycle`(`bicycleid`,`bianhao`,`pinpai`,`cid`,`tianjiariqi`,`beizhu`,`status`) values (1,'jieante0','捷安特',5,'2020-02-05','1','1'),(2,'fenghuang0','凤凰',5,'2020-02-05','1','2'),(3,'jiawo0','佳沃',1,'2020-02-05','1','1'),(4,'yongjiu0','永久',1,'2020-02-05','1','1'),(5,'meilida0','MERIDA美利达',2,'2020-02-05','1','1'),(6,'p','Phenix凤凰',2,'2020-02-05','1','1'),(7,'jipu0','Jeep吉普',2,'2020-02-04','1','1'),(8,'maibeier0','MBER麦贝尔',2,'2020-02-03','1','1'),(9,'feige0','FG飞鸽',2,'2020-02-03','1','1'),(10,'fushida0','BATTLE富士达',2,'2020-02-19','1','1'),(11,'jieante1','捷安特',8,'2020-02-12','1','2'),(12,'jieante2','捷安特',3,'2020-02-20','1','1'),(13,'fenghuang1','凤凰',1,'2020-02-20','1','1'),(14,'fenghuang2','凤凰',4,'2020-04-23','1','1'),(15,'fenghuang3','凤凰',2,'2020-02-21','1','1'),(16,'jiawo1','佳沃',2,'2020-02-27','1','1'),(17,'jiawo2','佳沃',8,'2020-02-21','1','1'),(18,'yongjiu1','永久',2,'2020-02-13','1','1'),(19,'yongjiu2','永久',3,'2020-02-19','1','1'),(20,'meilida1','美利达',4,'2020-02-27','1','1'),(21,'meilida2','美利达',5,'2020-02-19','1','1'),(22,'meilida3','美利达',4,'2020-02-23','1','1'),(23,'jipu1','吉普',2,'2020-02-20','1','1'),(24,'jipu2','吉普',3,'2020-02-28','1','1'),(25,'maibeier1','麦贝尔',4,'2020-02-12','1','1'),(26,'maibeier2','麦贝尔',6,'2020-02-27','1','1'),(27,'feige1','飞鸽',8,'2020-02-05','1','1'),(28,'feige2','飞鸽',8,'2020-02-20','1','1'),(29,'fushida1','富士达',6,'2020-02-19','1','1'),(30,'fushida2','富士达',6,'2020-02-19','1','1'),(31,'ertong0','儿童',7,'2020-02-19','1','1'),(32,'ertong1','儿童',7,'2020-02-13','1','1'),(33,'ertong2','儿童',7,'2020-02-19','1','1');

/*Table structure for table `tab_bicycleguishu` */

DROP TABLE IF EXISTS `tab_bicycleguishu`;

CREATE TABLE `tab_bicycleguishu` (
  `bzid` int(20) NOT NULL AUTO_INCREMENT COMMENT '自行车租赁点中间',
  `bid` int(20) NOT NULL COMMENT '自行车ID',
  `zid` int(20) NOT NULL COMMENT '租赁点ID',
  PRIMARY KEY (`bzid`),
  KEY `FK_bicycle_bicycle` (`bid`),
  KEY `FK_zld_zld` (`zid`),
  CONSTRAINT `FK_bicycle_bicycle` FOREIGN KEY (`bid`) REFERENCES `tab_bicycle` (`bicycleid`),
  CONSTRAINT `FK_zld_zld` FOREIGN KEY (`zid`) REFERENCES `tab_zld` (`zldid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tab_bicycleguishu` */

insert  into `tab_bicycleguishu`(`bzid`,`bid`,`zid`) values (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,2),(21,21,2),(22,22,2),(23,23,3),(24,24,5),(25,25,3),(26,26,5),(27,27,1),(28,28,4),(29,29,7),(30,30,6),(31,31,9),(32,32,5),(33,33,8);

/*Table structure for table `tab_bicycleimage` */

DROP TABLE IF EXISTS `tab_bicycleimage`;

CREATE TABLE `tab_bicycleimage` (
  `imageid` int(20) NOT NULL AUTO_INCREMENT COMMENT '自行车图片ID',
  `bid` int(20) NOT NULL COMMENT '自行车ID',
  `image` varchar(255) DEFAULT NULL COMMENT '自行车图片地址',
  PRIMARY KEY (`imageid`),
  KEY `FK_b_image` (`bid`),
  CONSTRAINT `FK_b_image` FOREIGN KEY (`bid`) REFERENCES `tab_bicycle` (`bicycleid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tab_bicycleimage` */

insert  into `tab_bicycleimage`(`imageid`,`bid`,`image`) values (1,1,'jieante0.jpg'),(2,11,'jieante1.jpg'),(3,12,'jieante2.jpg'),(4,2,'fenghuang0.jpg'),(5,13,'fenghuang1.jpg'),(20,14,'fenghuang2.jpg'),(21,15,'fenghuang3.jpg'),(22,3,'jiawo0.jpg'),(23,16,'jiawo1.jpg'),(24,17,'jiawo2.jpg'),(25,4,'yongjiu0.jpg'),(26,18,'yongjiu1.jpg'),(27,19,'yongjiu2.jpg'),(28,5,'meilida0.jpg'),(29,20,'meilida1.jpg'),(30,21,'meilida2.jpg'),(31,22,'meilida3.jpg'),(32,6,'phoenix0.jpg'),(33,7,'jipu0.jpg'),(42,28,'feige2.jpg'),(43,10,'fushida0.jpg'),(44,29,'fushida1.jpg'),(45,30,'fushida2.jpg'),(46,31,'ertongche0.jpg'),(47,32,'ertongche1.jpg'),(48,33,'ertongche2.jpg');

/*Table structure for table `tab_category` */

DROP TABLE IF EXISTS `tab_category`;

CREATE TABLE `tab_category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自行车分类',
  `cname` varchar(255) NOT NULL COMMENT '自行车分类名',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tab_category` */

insert  into `tab_category`(`categoryid`,`cname`) values (1,'山地自行车'),(2,'降速自行车'),(3,'林道自行车'),(4,'越野自行车'),(5,'竞赛自行车'),(6,'BMX小轮车'),(7,'少儿自行车'),(8,'学生自行车');

/*Table structure for table `tab_err` */

DROP TABLE IF EXISTS `tab_err`;

CREATE TABLE `tab_err` (
  `errid` int(20) NOT NULL AUTO_INCREMENT COMMENT '运维ID',
  `bid` int(20) NOT NULL COMMENT '自行车ID',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `date` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`errid`),
  KEY `FK_err` (`bid`),
  CONSTRAINT `FK_err` FOREIGN KEY (`bid`) REFERENCES `tab_bicycle` (`bicycleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tab_err` */

insert  into `tab_err`(`errid`,`bid`,`type`,`date`) values (1,2,'1111','2020-02-07'),(2,11,'5555','2020-02-01'),(3,1,'aaa','2020-02-01');

/*Table structure for table `tab_gly` */

DROP TABLE IF EXISTS `tab_gly`;

CREATE TABLE `tab_gly` (
  `adminid` int(20) NOT NULL AUTO_INCREMENT COMMENT '超级管理员ID',
  `adminusername` varchar(255) NOT NULL COMMENT '超级管理员用户名',
  `adminpassword` varchar(255) NOT NULL COMMENT '超级管理员密码',
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tab_gly` */

insert  into `tab_gly`(`adminid`,`adminusername`,`adminpassword`) values (1,'root','root');

/*Table structure for table `tab_jiehuan` */

DROP TABLE IF EXISTS `tab_jiehuan`;

CREATE TABLE `tab_jiehuan` (
  `jiehuanid` int(20) NOT NULL AUTO_INCREMENT COMMENT '借还表ID',
  `bid` int(20) NOT NULL COMMENT '自行车ID',
  `bzldid` int(20) DEFAULT NULL COMMENT '租赁点ID',
  `bdate` date DEFAULT NULL COMMENT '借车日期',
  `todate` date DEFAULT NULL COMMENT '还车日期',
  `jiehuanstatus` varchar(255) DEFAULT NULL COMMENT '借还状态',
  `userid` int(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`jiehuanid`),
  KEY `FK_bicy` (`bid`),
  KEY `FK_bzld` (`bzldid`),
  KEY `FK_yh` (`userid`),
  CONSTRAINT `FK_bicy` FOREIGN KEY (`bid`) REFERENCES `tab_bicycle` (`bicycleid`),
  CONSTRAINT `FK_bzld` FOREIGN KEY (`bzldid`) REFERENCES `tab_zld` (`zldid`),
  CONSTRAINT `FK_yh` FOREIGN KEY (`userid`) REFERENCES `tab_yh` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tab_jiehuan` */

insert  into `tab_jiehuan`(`jiehuanid`,`bid`,`bzldid`,`bdate`,`todate`,`jiehuanstatus`,`userid`) values (1,1,1,'2020-02-06','2020-02-21','0',1),(2,11,1,'2020-02-07','2020-02-07','0',1),(3,14,1,'2020-02-07','2020-02-08','0',1),(4,1,1,'2020-02-08','2020-02-08','0',1),(5,1,1,'2020-02-08','2020-02-08','0',1);

/*Table structure for table `tab_yh` */

DROP TABLE IF EXISTS `tab_yh`;

CREATE TABLE `tab_yh` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `uname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `sex` char(2) DEFAULT NULL COMMENT '性别',
  `telephone` varchar(11) DEFAULT NULL COMMENT '电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tab_yh` */

insert  into `tab_yh`(`uid`,`username`,`password`,`uname`,`birthday`,`sex`,`telephone`,`email`) values (1,'xiaoming','xiaoming','小明','2020-01-01','0','12345678901','123@qq.com'),(2,'yangfulin','yyyyyyy','杨扶林','2020-02-05','1','11111111111','2@qq.com');

/*Table structure for table `tab_zld` */

DROP TABLE IF EXISTS `tab_zld`;

CREATE TABLE `tab_zld` (
  `zldid` int(20) NOT NULL AUTO_INCREMENT COMMENT '租赁点ID',
  `bianhao` varchar(255) DEFAULT NULL COMMENT '租赁点编号',
  `mingcheng` varchar(255) NOT NULL COMMENT '租赁点名称',
  `didian` varchar(255) DEFAULT NULL COMMENT '租赁点地点',
  `zldimage` varchar(255) DEFAULT NULL COMMENT '租赁点图片',
  PRIMARY KEY (`zldid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tab_zld` */

insert  into `tab_zld`(`zldid`,`bianhao`,`mingcheng`,`didian`,`zldimage`) values (1,'xian001','莲湖租赁点','西安市莲湖区','lianhuqu.jpg'),(2,'xian002','碑林租赁点','西安市碑林区','beilinqu.jpg'),(3,'xian003','未央租赁点','西安市未央区','weiyangqu.jpg'),(4,'xian004','新城租赁点','西安市新城区','xinchengqu.jpg'),(5,'xian005','雁塔租赁点','西安市雁塔区','yantaqu.jpg'),(6,'xian006','灞桥租赁点','西安市灞桥区','baqiaoqu.jpg'),(7,'xian007','高陵租赁点','西安市高陵区','gaolingqu.jpg'),(8,'xian008','长安租赁点','西安市长安区','changanqu.jpg'),(9,'xian009','临潼租赁点','西安市临潼区','lintongqu.jpg'),(10,'xian010','鄠邑租赁点','西安市鄠邑区','huyiqu.jpg');

/*Table structure for table `tab_zldgly` */

DROP TABLE IF EXISTS `tab_zldgly`;

CREATE TABLE `tab_zldgly` (
  `zldglyid` int(20) NOT NULL AUTO_INCREMENT COMMENT '租赁点管理员ID',
  `username` varchar(255) NOT NULL COMMENT '租赁点管理员用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '租赁点管理员密码',
  `name` varchar(255) DEFAULT NULL COMMENT '租赁点管理员昵称',
  `birthday` date DEFAULT NULL COMMENT '租赁点管理员生日',
  `sex` char(2) DEFAULT NULL COMMENT '租赁点管理员性别',
  `telephone` varchar(11) DEFAULT NULL COMMENT '租赁点管理员电话',
  `email` varchar(100) DEFAULT NULL COMMENT '租赁点管理员邮箱',
  `zid` int(20) DEFAULT NULL COMMENT '租赁点ID',
  PRIMARY KEY (`zldglyid`),
  KEY `FK_zld_zldgly` (`zid`),
  CONSTRAINT `FK_zld_zldgly` FOREIGN KEY (`zid`) REFERENCES `tab_zld` (`zldid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tab_zldgly` */

insert  into `tab_zldgly`(`zldglyid`,`username`,`password`,`name`,`birthday`,`sex`,`telephone`,`email`,`zid`) values (1,'lianhu','lianhu','莲湖管理员','2019-09-10','0','12343545769','112@qq.com',1),(2,'beilin','beilin','碑林管理员','2020-02-25','0','12312125161','114@163.com',2),(3,'weiyang','weiyang','未央管理员','2019-06-05','1','11111111111','1@qq.com',3),(4,'xincheng','xincheng','新城管理员','2020-02-05','1','11111222222','122@123.com',4),(5,'yanta','yanta','雁塔管理员','2020-02-05','1','11222222341','1313@aa.com',5),(6,'baqiao','baqiao','灞桥管理员','2020-02-18','0','12151516216','1244@qq.com',6),(7,'gaoling','gaolling','高陵管理员','2020-02-20','1','12412515152','31215@qq.com',7),(8,'changan','changan','长安管理员','2020-02-26','1','14125151515','1111@qq.com',8),(9,'lintong','lintong','临潼管理员','2020-01-16','1','12312512515','1122@qq.com',9),(10,'huyi','huyi','鄠邑管理员','2019-12-11','0','12512612612','1512@qq.com',10);

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `testkey` varchar(255) NOT NULL COMMENT '测试表key',
  `testvalue` varchar(255) NOT NULL COMMENT '测试表value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `test` */

insert  into `test`(`testkey`,`testvalue`) values ('ceshi','OK');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
