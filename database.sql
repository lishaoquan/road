--合同系统建表语句
--version1.0

CREATE DATABASE contact;
use contact;
--菜单表
CREATE TABLE `contact`.`menu` (
  `menuid` VARCHAR(32) NOT NULL,
  `menuName` VARCHAR(45) NULL,
  `sort` INT NULL,
  `parentId` VARCHAR(32) NULL,
  `url` VARCHAR(255) NULL,
  PRIMARY KEY (`menuid`))
ENGINE = InnoDB;


--用户表
CREATE TABLE `contact`.`user` (
  `id` VARCHAR(32) NOT NULL,
  `userName` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `userId` VARCHAR(32) NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

--角色用户表
CREATE TABLE `contact`.`roleuser` (
  `id` VARCHAR(32) NOT NULL,
  `roleId` VARCHAR(32) NULL,
  `userId` VARCHAR(32) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

--角色用户表
CREATE TABLE `contact`.`rolemenu` (
  `id` VARCHAR(32) NOT NULL,
  `roleId` VARCHAR(32) NULL,
  `menuid` VARCHAR(32) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

--角色表
CREATE TABLE `contact`.`role` (
  `id` VARCHAR(32) NOT NULL,
  `roleName` VARCHAR(45) NULL,
  `sort` INT NULL,
  `desc` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

--产品分类表
CREATE TABLE `contact`.`productcategory`(
    `id` VARCHAR(32) NOT NULL,
    `name`	VARCHAR(50) NULL,
	`description` VARCHAR(255) NULL,
	`imageurl` VARCHAR(255) NULL,
	`parentId` VARCHAR(32) NULL,
     PRIMARY KEY (`id`))
	 ENGINE = InnoDB;

--产品表
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
CREATE TABLE `contact`.`productcontract`(
     `id` VARCHAR(32) NOT NULL,
	 `productid` VARCHAR(32) NULL,
	 `contractid` VARCHAR(32) NULL,
	 `color` VARCHAR(50) NULL,
	 `qty` VARCHAR(50) NULL,
      PRIMARY KEY (`id`))
	 ENGINE = InnoDB;
		 
--方案表
CREATE TABLE `contact`.`schemes`(
     `id` VARCHAR(32) NOT NULL,
	 `name` VARCHAR(50) NULL,
	 `columnName` VARCHAR(32) NULL,
	 `columnValue` VARCHAR(50) NULL,
	 `contactId` VARCHAR(32) NULL,
      PRIMARY KEY (`id`))
	 ENGINE = InnoDB;
		 
		 
		 
----初始化数据库表数据
/*
-- Query: SELECT * FROM contact.user
LIMIT 0, 1000

-- Date: 2014-08-21 12:34
*/
INSERT INTO `contact`.`user` (`id`,`userName`,`email`,`userId`,`password`) VALUES ('1','系统管理员','admin@126.com','admin','123456');

/*
-- Query: SELECT * FROM contact.menu
LIMIT 0, 1000

-- Date: 2014-08-21 12:35
*/
INSERT INTO `contact`.`menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('1','系统菜单',-1,'-1','');
INSERT INTO `contact`.`menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('2','系统管理',1,'1','');
INSERT INTO `contact`.`menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('3','菜单管理',2,'2','/pages/menu/menu.jsp');
INSERT INTO `contact`.`menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('555540fa72d7408e9b4fcf95e3b999af','用户管理',4,'2','/pages/user/user.jsp');
INSERT INTO `contact`.`menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('a03f7a0c564d4259bd35bf533bd7b1e2','角色管理',5,'2','/pages/role/role.jsp');
INSERT INTO `contact`.`menu` (`menuid`,`menuName`,`sort`,`parentId`,`url`) VALUES ('fe4d065e248b4a59aae41750ebf3ff8a','权限管理',3,'2','/pages/auth/auth.jsp');