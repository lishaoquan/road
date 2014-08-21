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