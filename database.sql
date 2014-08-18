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