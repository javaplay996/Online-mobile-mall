/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - shoujishangcheng
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shoujishangcheng` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shoujishangcheng`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `name` varchar(200) NOT NULL COMMENT '收货人',
  `phone` varchar(200) NOT NULL COMMENT '电话',
  `isdefault` varchar(200) NOT NULL COMMENT '是否默认地址[是/否]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616569644111 DEFAULT CHARSET=utf8 COMMENT='地址';

/*Data for the table `address` */

insert  into `address`(`id`,`addtime`,`userid`,`address`,`name`,`phone`,`isdefault`) values (1616569644110,'2021-03-24 15:07:23',1616569276545,'河南省郑州市二七区解放路街道西太康路丹尼斯·大卫城','zhang 1','17703786961','是');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(200) DEFAULT 'shangpinxinxi' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` varchar(200) DEFAULT NULL COMMENT '图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` float DEFAULT NULL COMMENT '单价',
  `discountprice` float DEFAULT NULL COMMENT '会员价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616569970946 DEFAULT CHARSET=utf8 COMMENT='购物车表';

/*Data for the table `cart` */

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (22,'picture2','http://localhost:8080/shoujishangcheng/upload/1616569470926.jpg'),(23,'picture2','http://localhost:8080/shoujishangcheng/upload/1616569582826.jpg');

/*Table structure for table `discussshangpinxinxi` */

DROP TABLE IF EXISTS `discussshangpinxinxi`;

CREATE TABLE `discussshangpinxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616569538860 DEFAULT CHARSET=utf8 COMMENT='商品评论表';

/*Data for the table `discussshangpinxinxi` */

insert  into `discussshangpinxinxi`(`id`,`addtime`,`refid`,`userid`,`content`,`reply`) values (1616569538859,'2021-03-24 15:05:37',1616569363075,1614430386281,'好用不','11111');

/*Table structure for table `jifenjilu` */

DROP TABLE IF EXISTS `jifenjilu`;

CREATE TABLE `jifenjilu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` bigint(20) NOT NULL COMMENT '用户id',
  `shangpinxinxi_id` bigint(20) NOT NULL COMMENT '商品id',
  `jifenjilu_types` varchar(200) DEFAULT NULL COMMENT '积分类型',
  `buynumber` int(11) NOT NULL COMMENT '积分数量',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='积分';

/*Data for the table `jifenjilu` */

insert  into `jifenjilu`(`id`,`yonghu_id`,`shangpinxinxi_id`,`jifenjilu_types`,`buynumber`,`insert_time`,`create_time`) values (47,1616569276545,1616568900992,'添加',20,'2021-03-24 15:08:31','2021-03-24 15:08:31'),(48,1616569276545,1616568900992,'添加',20,'2021-03-24 15:08:59','2021-03-24 15:08:59'),(49,1616569276545,1616568956677,'使用',40,'2021-03-24 15:09:20','2021-03-24 15:09:21'),(50,1616569276545,1616568956677,'添加',9,'2021-03-24 15:09:20','2021-03-24 15:09:21'),(51,1616569276545,1616568900992,'添加',30,'2021-03-24 15:13:11','2021-03-24 15:13:11'),(52,1616569276545,1616569189294,'添加',22,'2021-03-24 15:13:11','2021-03-24 15:13:11');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='新闻资讯';

/*Data for the table `news` */

insert  into `news`(`id`,`addtime`,`title`,`picture`,`content`) values (81,'2021-03-24 22:39:58','新闻标题1','http://localhost:8080/shoujishangcheng/upload/news_picture1.jpg','内容1'),(82,'2021-03-24 22:39:58','新闻标题2','http://localhost:8080/shoujishangcheng/upload/news_picture2.jpg','内容2'),(83,'2021-03-24 22:39:58','新闻标题3','http://localhost:8080/shoujishangcheng/upload/news_picture3.jpg','内容3'),(84,'2021-03-24 22:39:58','新闻标题4','http://localhost:8080/shoujishangcheng/upload/news_picture4.jpg','内容4'),(85,'2021-03-24 22:39:58','新闻标题5','http://localhost:8080/shoujishangcheng/upload/news_picture5.jpg','内容5');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) NOT NULL COMMENT '订单编号',
  `tablename` varchar(200) DEFAULT 'shangpinxinxi' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` varchar(200) DEFAULT NULL COMMENT '商品图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` float NOT NULL DEFAULT '0' COMMENT '价格/积分',
  `discountprice` float DEFAULT '0' COMMENT '折扣价格',
  `total` float NOT NULL DEFAULT '0' COMMENT '总价格/总积分',
  `discounttotal` float DEFAULT '0' COMMENT '折扣总价格',
  `type` int(11) DEFAULT '1' COMMENT '支付类型',
  `status` varchar(200) DEFAULT NULL COMMENT '状态',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=1616569992340 DEFAULT CHARSET=utf8 COMMENT='订单';

/*Data for the table `orders` */

insert  into `orders`(`id`,`addtime`,`orderid`,`tablename`,`userid`,`goodid`,`goodname`,`picture`,`buynumber`,`price`,`discountprice`,`total`,`discounttotal`,`type`,`status`,`address`) values (1616569665648,'2021-03-24 15:07:44','20213241574461428392','shangpinxinxi',1616569276545,1616568851195,'redmi k40 pro','http://localhost:8080/shoujishangcheng/upload/1616568813766.webp',1,2000,1988,2000,1988,1,'未支付','河南省郑州市二七区解放路街道西太康路丹尼斯·大卫城'),(1616569711990,'2021-03-24 15:08:31','20213241583118655159','shangpinxinxi',1616569276545,1616568900992,'华为 mate30 pro','http://localhost:8080/shoujishangcheng/upload/1616568863804.png',2,3999,3300,7998,6600,1,'已完成','河南省郑州市二七区解放路街道西太康路丹尼斯·大卫城'),(1616569740109,'2021-03-24 15:08:59','2021324158598754532','shangpinxinxi',1616569276545,1616568900992,'华为 mate30 pro','http://localhost:8080/shoujishangcheng/upload/1616568863804.png',2,3999,3300,7998,6600,1,'已发货','河南省郑州市二七区解放路街道西太康路丹尼斯·大卫城'),(1616569760884,'2021-03-24 15:09:20','20213241592074058254','shangpinxinxi',1616569276545,1616568956677,'华为mate X2','http://localhost:8080/shoujishangcheng/upload/1616568914175.png',1,1999,1899,1999,1899,1,'已退款','河南省郑州市二七区解放路街道西太康路丹尼斯·大卫城'),(1616569991464,'2021-03-24 15:13:11','20213241513119014754','shangpinxinxi',1616569276545,1616568900992,'华为 mate30 pro','http://localhost:8080/shoujishangcheng/upload/1616568863804.png',3,3999,3300,11997,9900,1,'已支付','河南省郑州市二七区解放路街道西太康路丹尼斯·大卫城'),(1616569992339,'2021-03-24 15:13:11','202132415131120157628','shangpinxinxi',1616569276545,1616569189294,'小米10s','http://localhost:8080/shoujishangcheng/upload/1616569129479.webp',2,1000,988,2000,1976,1,'已支付','河南省郑州市二七区解放路街道西太康路丹尼斯·大卫城');

/*Table structure for table `shangpinfenlei` */

DROP TABLE IF EXISTS `shangpinfenlei`;

CREATE TABLE `shangpinfenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangpinfenlei` varchar(200) DEFAULT NULL COMMENT '商品分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616569304307 DEFAULT CHARSET=utf8 COMMENT='商品分类';

/*Data for the table `shangpinfenlei` */

insert  into `shangpinfenlei`(`id`,`addtime`,`shangpinfenlei`) values (21,'2021-03-24 22:39:58','手机'),(22,'2021-03-24 22:39:58','耳机'),(23,'2021-03-24 22:39:58','充电器'),(24,'2021-03-24 22:39:58','手机卡'),(1616569304306,'2021-03-24 15:01:43','分类1');

/*Table structure for table `shangpinxinxi` */

DROP TABLE IF EXISTS `shangpinxinxi`;

CREATE TABLE `shangpinxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangpinbianhao` varchar(200) DEFAULT NULL COMMENT '商品编号',
  `shangpinmingcheng` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `shangpinfenlei` varchar(200) DEFAULT NULL COMMENT '商品分类',
  `shuliang` varchar(200) DEFAULT NULL COMMENT '数量',
  `pinpai` varchar(200) DEFAULT NULL COMMENT '品牌',
  `guige` varchar(200) DEFAULT NULL COMMENT '规格',
  `xiangqing` longtext COMMENT '详情',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `clicknum` int(11) DEFAULT '0' COMMENT '点击次数',
  `price` float NOT NULL COMMENT '原价',
  `discountprice` float DEFAULT NULL COMMENT '折扣价',
  `jifen` float DEFAULT NULL,
  `flag` int(11) DEFAULT NULL COMMENT '是否上架(1:上架,2:下架)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shangpinbianhao` (`shangpinbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1616569363076 DEFAULT CHARSET=utf8 COMMENT='商品信息';

/*Data for the table `shangpinxinxi` */

insert  into `shangpinxinxi`(`id`,`addtime`,`shangpinbianhao`,`shangpinmingcheng`,`shangpinfenlei`,`shuliang`,`pinpai`,`guige`,`xiangqing`,`fengmian`,`clicktime`,`clicknum`,`price`,`discountprice`,`jifen`,`flag`) values (1616568851195,'2021-03-24 14:54:10','1616568806','redmi k40 pro','手机','99','redmi','128G','redmi k40 pro的详情\r\n','http://localhost:8080/shoujishangcheng/upload/1616568813766.webp','2021-03-24 15:07:44',3,2000,1988,10,1),(1616568900992,'2021-03-24 14:55:00','1616568856','华为 mate30 pro','手机','9993','华为','128G','华为 mate30 pro的详情\r\n','http://localhost:8080/shoujishangcheng/upload/1616568863804.png','2021-03-24 15:13:27',9,3999,3300,10,1),(1616568956677,'2021-03-24 14:55:56','1616568906','华为mate X2','手机','99','华为','54G','华为mate X2的详情\r\n','http://localhost:8080/shoujishangcheng/upload/1616568914175.png','2021-03-24 15:11:24',3,1999,1899,9,1),(1616569035616,'2021-03-24 14:57:14','1616568960','华为p40 pro','手机','100','华为','64G','华为p40 pro的详情\r\n','http://localhost:8080/shoujishangcheng/upload/1616568968555.png','2021-03-24 14:57:20',2,1999,1599,20,1),(1616569111348,'2021-03-24 14:58:31','1616569071','小米10','手机','100','小米','128G','小米10的详情\r\n','http://localhost:8080/shoujishangcheng/upload/1616569077513.webp','2021-03-24 15:13:32',1,3000,2599,10,1),(1616569189294,'2021-03-24 14:59:48','1616569115','小米10s','手机','8','小米','128G','小米10s的详情\r\n','http://localhost:8080/shoujishangcheng/upload/1616569129479.webp','2021-03-24 15:13:11',2,1000,988,11,1),(1616569363075,'2021-03-24 15:02:42','1616569311','小米11','分类1','1100','小米','128G','小米11的详情\r\n','http://localhost:8080/shoujishangcheng/upload/1616569315327.webp','2021-03-24 15:06:02',5,3999,3599,19,1);

/*Table structure for table `shouhou` */

DROP TABLE IF EXISTS `shouhou`;

CREATE TABLE `shouhou` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderid` varchar(200) NOT NULL COMMENT '订单id',
  `suqiu` varchar(200) NOT NULL COMMENT '诉求内容',
  `suqiutime` timestamp NULL DEFAULT NULL COMMENT '诉求时间',
  `shouhoutype` int(11) NOT NULL COMMENT '售后类型 1:已处理  2 未处理',
  `chulitype` int(11) DEFAULT NULL COMMENT '处理结果  1:已解决  2:未解决',
  `chulicontent` varchar(200) DEFAULT NULL,
  `chulitime` timestamp NULL DEFAULT NULL COMMENT '处理时间',
  `addtime` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1374619992390942722 DEFAULT CHARSET=utf8 COMMENT='售后表';

/*Data for the table `shouhou` */

insert  into `shouhou`(`id`,`orderid`,`suqiu`,`suqiutime`,`shouhoutype`,`chulitype`,`chulicontent`,`chulitime`,`addtime`) values (1374619992390942721,'20213241583118655159','质量不好','2021-03-24 15:12:00',1,1,'换货处理','2021-03-24 15:12:27','2021-03-24 15:12:00');

/*Table structure for table `storeup` */

DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1616570013679 DEFAULT CHARSET=utf8 COMMENT='收藏表';

/*Data for the table `storeup` */

insert  into `storeup`(`id`,`addtime`,`userid`,`refid`,`tablename`,`name`,`picture`) values (1616570008348,'2021-03-24 15:13:28',1616569276545,1616568900992,'shangpinxinxi','华为 mate30 pro','http://localhost:8080/shoujishangcheng/upload/1616568863804.png'),(1616570013678,'2021-03-24 15:13:32',1616569276545,1616569111348,'shangpinxinxi','小米10','http://localhost:8080/shoujishangcheng/upload/1616569077513.webp');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (15,1,'admin','users','管理员','ebu1cq4m8jlbpe2aoal218hscvw93qky','2021-03-24 14:50:52','2021-03-24 16:00:42'),(16,1614430386281,'a2','yonghu','用户','exp9wv4l4owef7pt8umh51im2qwy9ruo','2021-03-24 15:00:13','2021-03-24 16:00:14'),(17,1616569276545,'a1','yonghu','用户','w6p5a4mobnnilpw200qmsw7zj3bhv6fr','2021-03-24 15:06:48','2021-03-24 16:06:49');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','123456','管理员','2021-03-09 22:39:58');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `dianziyouxiang` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `money` float DEFAULT '0' COMMENT '余额',
  `jifen` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1616569276546 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`addtime`,`yonghuzhanghao`,`yonghuxingming`,`mima`,`xingbie`,`lianxidianhua`,`dianziyouxiang`,`money`,`jifen`) values (1614430386281,'2021-02-27 20:53:06','a2','a2','123456','男','13823888883','229992@qq.ccom',1286,112),(1614431342348,'2021-02-27 21:09:02','a4','a4','123456','男','a41','22850@qq.com',98,52),(1615339905628,'2021-03-10 09:31:45','a3','a3','123456','男','13823888883','77389000222@qq.com',1926,3),(1615605788598,'2021-03-13 11:23:08','a5','张5','123456','女','17703786969','2@qq.ccom',0,0),(1616569276545,'2021-03-24 15:01:16','a1','张11','123456','男','17703786931','1@qq.ccom',961189,61);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
