--合同系统建表语句
--version1.0

CREATE DATABASE contact;
use contact;
--菜单表
DROP TABLE IF EXISTS `contact`.`menu`;
CREATE TABLE `contact`.`menu` (
  `menuid` VARCHAR(32) NOT NULL,
  `menuName` VARCHAR(45) NULL,
  `sort` INT NULL,
  `parentId` VARCHAR(32) NULL,
  `url` VARCHAR(255) NULL,
  PRIMARY KEY (`menuid`))
ENGINE = InnoDB;


--用户表
DROP TABLE IF EXISTS `contact`.`user`;
CREATE TABLE `contact`.`user` (
  `id` VARCHAR(32) NOT NULL,
  `userName` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `userId` VARCHAR(32) NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

--角色用户表
DROP TABLE IF EXISTS `contact`.`roleuser`;
CREATE TABLE `contact`.`roleuser` (
  `id` VARCHAR(32) NOT NULL,
  `roleId` VARCHAR(32) NULL,
  `userId` VARCHAR(32) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

--角色用户表
DROP TABLE IF EXISTS `contact`.`rolemenu`;
CREATE TABLE `contact`.`rolemenu` (
  `id` VARCHAR(32) NOT NULL,
  `roleId` VARCHAR(32) NULL,
  `menuid` VARCHAR(32) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

--角色表
DROP TABLE IF EXISTS `contact`.`role`;
CREATE TABLE `contact`.`role` (
  `id` VARCHAR(32) NOT NULL,
  `roleName` VARCHAR(45) NULL,
  `sort` INT NULL,
  `desc` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

--产品分类表
DROP TABLE IF EXISTS `contact`.`productcategory`;
CREATE TABLE `contact`.`productcategory`(
    `id` VARCHAR(32) NOT NULL,
    `name`	VARCHAR(50) NULL,
	`description` VARCHAR(255) NULL,
	`imageurl` VARCHAR(255) NULL,
	`parentId` VARCHAR(32) NULL,
     PRIMARY KEY (`id`))
	 ENGINE = InnoDB;

--产品表
DROP TABLE IF EXISTS `contact`.`product`;
CREATE TABLE `contact`.`product`(
    `id` VARCHAR(32) NOT NULL,
	`parentid` VARCHAR(32) NULL,
	`productcategory` VARCHAR(32) NULL,
    `sn` VARCHAR(100) NULL,
	`part` VARCHAR(100) NULL,
	`image` VARCHAR(255) NULL,
	`code` VARCHAR(255) NULL,
	`item` VARCHAR(255) NULL,
	`name` VARCHAR(255) NULL,
	`dimensions` VARCHAR(255) NULL,
	`descriptionen` VARCHAR(255) NULL,
	`descriptioncn` VARCHAR(255) NULL,
	`color` VARCHAR(50) NULL,
	`qty` VARCHAR(200) NULL,
	`amount` VARCHAR(200) NULL,
	`cbm1` VARCHAR(20) NULL,
	`cbm2` VARCHAR(20) NULL,
	`gw1` VARCHAR(20) NULL,
	`gw2` VARCHAR(20) NULL,
	`workshop` VARCHAR(20) NULL,
     PRIMARY KEY (`id`))
	 ENGINE = InnoDB;

--合同表
DROP TABLE IF EXISTS `contact`.`contract`;
CREATE TABLE `contact`.`contract`(
    `id` VARCHAR(32) NOT NULL,
    `name` VARCHAR(50) NULL,
	`customername` VARCHAR(50) NULL,
	`creatorid` VARCHAR(32) NULL,
	`customercontry` VARCHAR(50) NULL,
	`customeraddress` VARCHAR(255) NULL,
	`tel` VARCHAR(50) NULL,
	`mobile` VARCHAR(50) NULL,
	`fox` VARCHAR(50) NULL,
	`email` VARCHAR(50) NULL,
	`date` VARCHAR(50) NULL,
	`contractno` VARCHAR(50) NULL,
	`customerno` VARCHAR(50) NULL,
	`business` VARCHAR(50) NULL,
	`status` VARCHAR(10) NULL,
     PRIMARY KEY (`id`))
	 ENGINE = InnoDB;
	 
--产品合同表
DROP TABLE IF EXISTS `contact`.`productcontract`;
CREATE TABLE `contact`.`productcontract`(
     `id` VARCHAR(32) NOT NULL,
	 `productid` VARCHAR(32) NULL,
	 `contractid` VARCHAR(32) NULL,
	 `color` VARCHAR(50) NULL,
	 `qty` VARCHAR(50) NULL,
      PRIMARY KEY (`id`))
	 ENGINE = InnoDB;
		 
--方案表
DROP TABLE IF EXISTS `contact`.`schemes`;
CREATE TABLE `contact`.`schemes`(
     `id` VARCHAR(32) NOT NULL,
	 `name` VARCHAR(50) NULL,
	 `columnName` VARCHAR(32) NULL,
	 `columnValue` VARCHAR(50) NULL,
	 `contactId` VARCHAR(32) NULL,
	 `isShowPart` VARCHAR(32) NULL,
      PRIMARY KEY (`id`))
	 ENGINE = InnoDB;
		 
		 
		 
----初始化数据库表数据
/*
-- Query: SELECT * FROM contact.user
LIMIT 0, 1000

-- Date: 2014-08-21 12:34
*/
DELETE FROM `contact`.`user`;
INSERT INTO `user` (`id`,`userName`,`email`,`userId`,`password`) VALUES ('1','系统管理员','admin@126.com','admin','123456');
INSERT INTO `user` (`id`,`userName`,`email`,`userId`,`password`) VALUES ('f99d94f59b7e499fbe5812c4ea5e34f6','金武','king@126.com','jinwu','123456');


/*
-- Query: SELECT * FROM contact.menu
LIMIT 0, 1000

-- Date: 2014-08-24 19:49
*/
DELETE FROM `contact`.`menu`;
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('1','系统菜单',-1,'-1','');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('2','系统管理',1,'1','');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('229cbede3d0c407e9873bec290f94e4c','采购管理',5,'1','');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('24ff661701f94152b73c664f4c2840ff','新订单生产安排',1,'e4344e2fd4ee464da1988a3a28020922','/pages/production/production.jsp');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('3','菜单管理',2,'2','/pages/menu/menu.jsp');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('45726280f95e4e449a0d4c905590a480','产品管理',2,'1','');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('555540fa72d7408e9b4fcf95e3b999af','用户管理',4,'2','/pages/user/user.jsp');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('75990c366b874b219421d2a27b7032a3','从编码生成合同',2,'d7cb729f583940ac900d574aab331b03','/pages/contract/fromcode.jsp');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('8856968cfe674bcfb3d46da561da56e0','产品分类管理',1,'45726280f95e4e449a0d4c905590a480','/pages/productcategory/productcategory.jsp');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('a03f7a0c564d4259bd35bf533bd7b1e2','角色管理',5,'2','/pages/role/role.jsp');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('bd5b09b6ee1d48e2ad6522819aa09699','采购管理',1,'229cbede3d0c407e9873bec290f94e4c','/pages/purchase/purchase.jsp');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('d7cb729f583940ac900d574aab331b03','销售管理',3,'1','');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('de7cf5961cfb4fe49163e727a13ce45c','从列表生成合同',1,'d7cb729f583940ac900d574aab331b03','/pages/sale/listcontract/productlist.jsp');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('e4344e2fd4ee464da1988a3a28020922','生产管理',4,'1','');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('e8e4c1c52554474e9770915e8d35ec65','合同管理',3,'d7cb729f583940ac900d574aab331b03','/pages/contract/contractManager.jsp');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('ee200f60e1f340f8aad659515f0e8507','产品管理',2,'45726280f95e4e449a0d4c905590a480','/pages/product/product.jsp');
INSERT INTO `menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('fe4d065e248b4a59aae41750ebf3ff8a','权限管理',3,'2','/pages/auth/auth.jsp');


/*
-- Query: SELECT * FROM contact.role
LIMIT 0, 1000

-- Date: 2014-08-30 23:01
*/
DELETE FROM `contact`.`role`;
INSERT INTO `role` (`id`,`roleName`,`sort`,`desc`) VALUES ('4ee14522420941a6b9695dbbb7d029e2','超级管理员',1,'超级管理员');
INSERT INTO `role` (`id`,`roleName`,`sort`,`desc`) VALUES ('c1e3276341534c9ea39e6e9ed34730cb','普通管理员',6,'普通管理员');
INSERT INTO `role` (`id`,`roleName`,`sort`,`desc`) VALUES ('c45630a288df4971a38673dee6d351e4','业务员',2,'业务员');
INSERT INTO `role` (`id`,`roleName`,`sort`,`desc`) VALUES ('e0006d9ec66c43c28554765a9363b33c','测试角色',5,'测试角色');
INSERT INTO `role` (`id`,`roleName`,`sort`,`desc`) VALUES ('e9722500ea1e498aa1f282f1a3a95743','采购员',3,'采购员');
INSERT INTO `role` (`id`,`roleName`,`sort`,`desc`) VALUES ('ecd6adb5ef1c4fc9a348033f5d3b645d','客户',4,'客户');


/*
-- Query: SELECT * FROM contact.rolemenu
LIMIT 0, 1000

-- Date: 2014-08-31 20:20
*/
DELETE FROM `contact`.`rolemenu`;
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('1790276348e947d3a5bb930213baf439','c1e3276341534c9ea39e6e9ed34730cb','de7cf5961cfb4fe49163e727a13ce45c');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('24cb31e477c64c409a6ec1a1c917ea1f','4ee14522420941a6b9695dbbb7d029e2','d7cb729f583940ac900d574aab331b03');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('29d915b28f6f4e12a2e1f6810c3aa0f3','4ee14522420941a6b9695dbbb7d029e2','e8e4c1c52554474e9770915e8d35ec65');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('36cd4142e33643cfa2d8bc8442365f01','c1e3276341534c9ea39e6e9ed34730cb','555540fa72d7408e9b4fcf95e3b999af');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('3e4d6ef937c04e3492db7349fb49d486','4ee14522420941a6b9695dbbb7d029e2','2');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('50ea72c31d8a4cea98312dc4e86b9ecc','4ee14522420941a6b9695dbbb7d029e2','555540fa72d7408e9b4fcf95e3b999af');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('54ffcc47348e4cff868a5468a75beba4','4ee14522420941a6b9695dbbb7d029e2','ee200f60e1f340f8aad659515f0e8507');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('57c90948e5574f418a44bacc0622d390','4ee14522420941a6b9695dbbb7d029e2','de7cf5961cfb4fe49163e727a13ce45c');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('5a71d6d3e9254ae6999edceb6192fe82','4ee14522420941a6b9695dbbb7d029e2','229cbede3d0c407e9873bec290f94e4c');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('5cb08250b9b04eda8769f47aefb675c8','4ee14522420941a6b9695dbbb7d029e2','a03f7a0c564d4259bd35bf533bd7b1e2');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('708e499902f74644afc8e3504af79772','4ee14522420941a6b9695dbbb7d029e2','fe4d065e248b4a59aae41750ebf3ff8a');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('7f369b0f20014fa5a5047a755d6e1e7a','4ee14522420941a6b9695dbbb7d029e2','24ff661701f94152b73c664f4c2840ff');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('82434905b5ba496a8102da1df9ae98ab','c1e3276341534c9ea39e6e9ed34730cb','fe4d065e248b4a59aae41750ebf3ff8a');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('89ef05541e334dae92be91f6dd0387d4','4ee14522420941a6b9695dbbb7d029e2','8856968cfe674bcfb3d46da561da56e0');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('9bbc7308b7e64bf8836907dc4a1bd0c3','4ee14522420941a6b9695dbbb7d029e2','bd5b09b6ee1d48e2ad6522819aa09699');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('a6a9257e517e481593f2afeb00f85d61','4ee14522420941a6b9695dbbb7d029e2','45726280f95e4e449a0d4c905590a480');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('a85cf044904d44b08db3fdc7bdd38169','4ee14522420941a6b9695dbbb7d029e2','75990c366b874b219421d2a27b7032a3');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('ad4b1f00e12d45759e0b9275c1f78d96','4ee14522420941a6b9695dbbb7d029e2','1');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('b023780382664a8cb2e521367fa49c54','4ee14522420941a6b9695dbbb7d029e2','e4344e2fd4ee464da1988a3a28020922');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('c89c8454da794040bdc5f6e4bfb67d05','4ee14522420941a6b9695dbbb7d029e2','3');
INSERT INTO `rolemenu` (`id`,`roleId`,`menuid`) VALUES ('fb2536644c294ecca208f9a921eefb94','c1e3276341534c9ea39e6e9ed34730cb','75990c366b874b219421d2a27b7032a3');


/*
-- Query: SELECT * FROM contact.roleuser
LIMIT 0, 1000

-- Date: 2014-08-31 20:21
*/
DELETE FROM `contact`.`roleuser`;
INSERT INTO `roleuser` (`id`,`roleId`,`userId`) VALUES ('60f3d437f61d4c01ba2027585e43e750','4ee14522420941a6b9695dbbb7d029e2','f99d94f59b7e499fbe5812c4ea5e34f6');
INSERT INTO `roleuser` (`id`,`roleId`,`userId`) VALUES ('ae546b0b9da54c4eb6ad1a52f0650a43','c1e3276341534c9ea39e6e9ed34730cb','1');





