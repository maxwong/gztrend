-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb1.precise~ppa.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-02-25 12:20:23
-- 服务器版本： 5.5.47-0ubuntu0.12.04.1
-- PHP Version: 5.6.18-1+deb.sury.org~precise+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gztrend`
--

-- --------------------------------------------------------

--
-- 表的结构 `materials`
--

CREATE TABLE `materials` (
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` float(9,2) NOT NULL,
  `comments` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `materials`
--

INSERT INTO `materials` (`material_id`, `name`, `type`, `spec`, `brand`, `unit`, `unit_price`, `comments`, `status`) VALUES
(1, '304不锈钢过滤器(2400)', NULL, 'Ф2400', '广州潮流', '台', 69500.00, NULL, 1),
(2, '水泵', NULL, '15kw', '上海或广东', '台', 9600.00, NULL, 1),
(3, '水泵', '', 'KQW125/125-15/2', '凯泉（上海）', '台', 9600.00, '15kw', 1),
(4, '水泵', '', 'SLW125-125', '连成（上海）', '台', 9600.00, '15kw', 1),
(5, '水泵', NULL, 'GD125-20', '肯富来（广东）', '台', 9600.00, '15kw', 1),
(6, '毛发收集器', NULL, 'XF4', '广州潮流', '台', 6200.00, '304不锈钢材质', 1),
(7, '絮凝系统', NULL, 'P066-Y', '米顿罗', '台', 2850.00, NULL, 1),
(8, '絮凝系统', NULL, 'C-660P', '蓝白', '台', 2850.00, NULL, 1),
(9, '絮凝系统', NULL, 'AKL-800', '赛高', '台', 2850.00, NULL, 1),
(10, '消毒系统', NULL, 'P066-Y', '米顿罗', '台', 2850.00, NULL, 1),
(11, '消毒系统', NULL, 'C-660P', '蓝白', '台', 2850.00, NULL, 1),
(12, '消毒系统', NULL, 'AKL-800', '赛高', '台', 2850.00, NULL, 1),
(13, '投药架', NULL, NULL, '广州潮流', '个', 250.00, NULL, 1),
(14, '药桶', NULL, NULL, '国产优质', '个', 80.00, NULL, 1),
(15, '过滤材料(I)', NULL, NULL, '国产优质', '套', 5300.00, NULL, 1),
(16, '机房排污泵', NULL, '1.5kw', '上海或广东', '台', 4230.00, '1.5kw', 1),
(17, '机房排污泵', NULL, '50WQ/D242-1.5', NULL, '台', 4230.00, '1.5kw', 1),
(18, '机房排污泵', NULL, '50WQ15-16-1.5', NULL, '台', 4230.00, '1.5kw', 1),
(19, '机房排污泵', NULL, '50QW18-15-1.5', NULL, '台', 4230.00, '1.5kw', 1),
(20, '池体配件(I)', NULL, NULL, '国产优质', '批', 5300.00, '给水口、回水口、池底隔栅', 1),
(21, '机房内配套的管路、阀门(I)', NULL, NULL, '台塑', '套', 31000.00, 'UPVC、铸铁阀门', 1),
(22, '控制装置(I)', NULL, NULL, '广州潮流', '套', 7800.00, NULL, 1),
(23, '机房内配套电线、线槽等(I)', NULL, NULL, '广东', '批', 5300.00, '水泵至控制装置之间', 1),
(24, '304不锈钢过滤器(1800)', NULL, 'Ф1800', '广州潮流', '台', 40500.00, NULL, 1),
(25, '水泵', NULL, '7.5kw', '上海或广东', '台', 5100.00, 'Q=89m3/Hr,H=16M,N=7.5KW', 1),
(26, '水泵', NULL, 'KQW100/110-7.5/2', '凯泉（上海）', '台', 5100.00, '7.5kw', 1),
(27, '水泵', NULL, 'SLW100-125A', '连成（上海）', '台', 5100.00, '7.5kw', 1),
(28, '水泵', NULL, 'GD100-19', '肯富来（广东）', '台', 5100.00, '7.5kw', 1),
(29, '毛发收集器', NULL, 'XF3', '广州潮流', '台', 4200.00, '304不锈钢材质', 1),
(30, '过滤材料(II)', NULL, NULL, '国产优质', '套', 2800.00, NULL, 1),
(31, '池体配件(II)', NULL, NULL, '国产优质', '批', 2800.00, '给水口、回水口、池底隔栅', 1),
(32, '机房内配套的管路、阀门(II)', NULL, NULL, '台塑', '套', 17000.00, 'UPVC、铸铁阀门', 1),
(33, '机房内配套电线、线槽等(II)', NULL, NULL, '广东', '批', 1800.00, '水泵至控制装置之间', 1),
(34, '池体配件(III)', NULL, NULL, '国产优质', '批', 5800.00, '给水口、回水口、池底隔栅', 1),
(35, '机房内配套的管路、阀门(III)', NULL, NULL, '台塑', '套', 34000.00, 'UPVC、铸铁阀门', 1),
(36, '控制装置(II)', NULL, NULL, '广州潮流', '套', 9800.00, NULL, 1),
(37, '机房内配套电线、线槽等(III)', NULL, NULL, '广东', '批', 3600.00, '水泵至控制装置之间', 1),
(38, '不锈钢过滤器(1600)', NULL, 'B1600', '广州潮流', '台', 36500.00, NULL, 1),
(39, '水泵', NULL, '5.5kw', '上海或广东', '台', 5600.00, 'Q=50m3/Hr,H=20M,N=5.5KW', 1),
(40, '水泵', NULL, 'KQW100/250-5.5/4', '凯泉（上海）', '台', 5600.00, '5.5kw', 1),
(41, '水泵', NULL, 'SLWD100-250', '连成（上海）', '台', 5600.00, '5.5kw', 1),
(42, '水泵', NULL, 'GD100-21', '肯富来（广东）', '台', 5600.00, '5.5kw', 1),
(43, '过滤材料(III)', NULL, NULL, '国产优质', '套', 2400.00, NULL, 1),
(44, '池体配件(IV)', NULL, NULL, '国产优质', '批', 2500.00, '', 1),
(45, '机房内配套的管路、阀门(IV)', NULL, NULL, '台塑', '套', 14500.00, 'UPVC、铸铁阀门', 1),
(46, '控制装置(III)', NULL, NULL, '广州潮流', '套', 6800.00, NULL, 1),
(47, '机房内配套电线、线槽等(IV)', NULL, NULL, '广东', '批', 1500.00, '水泵至控制装置之间', 1),
(48, '玻璃纤维过滤器(1200)', NULL, 'Ф1200', '广州潮流', '台', 5800.00, NULL, 1),
(49, '水泵', NULL, '4.0kw', '上海或广东', '台', 3800.00, 'Q=45m3/Hr,H=16M,N=4.0KW', 1),
(50, '水泵', NULL, 'KQW80/110-4/2', '凯泉（上海）', '台', 3800.00, '4.0kw', 1),
(51, '水泵', NULL, 'SLW80-125A', '连成（上海）', '台', 3800.00, '4.0kw', 1),
(52, '水泵', NULL, 'GD80-21', '肯富来（广东）', '台', 3800.00, '4.0kw', 1),
(53, '水泵', NULL, '5.0HP（380V）', '蒲力德', '台', 3800.00, '4.0kw', 1),
(54, '毛发收集器', NULL, 'XF2', '广州潮流', '台', 3500.00, '304不锈钢材质，采用蒲力德时则不需要', 1),
(55, '过滤材料(IV)', NULL, NULL, '国产优质', '套', 1800.00, NULL, 1),
(56, '池体配件(V)', NULL, NULL, '国产优质', '批', 1500.00, '给水口、回水口、池底隔栅', 1),
(57, '机房内配套的管路、阀门(V)', NULL, NULL, '台塑', '套', 8800.00, 'UPVC、铸铁阀门', 1),
(58, '控制装置(IV)', NULL, NULL, '广州潮流', '套', 6500.00, NULL, 1),
(59, '机房内配套电线、线槽等(V)', NULL, NULL, '广东', '批', 1200.00, '水泵至控制装置之间', 1),
(60, '玻璃钢过滤器(1000)', NULL, 'Ф1000', '广州潮流', '台', 4500.00, NULL, 1),
(61, '水泵', NULL, '3.0kw', '上海或广东', '台', 3200.00, 'Q=25m3/Hr,H=20M,N=3.0KW', 1),
(62, '水泵', NULL, 'KQW65/125-3/2', '凯泉（上海）', '台', 3200.00, '3.0kw', 1),
(63, '水泵', NULL, 'SLW65-125', '连成（上海）', '台', 3200.00, '3.0kw', 1),
(64, '水泵', NULL, 'GD65-19', '肯富来（广东）', '台', 3200.00, '3.0kw', 1),
(65, '水泵', NULL, '3.0HP（380V）', '蒲力德', '台', 3200.00, '3.0kw', 1),
(66, '毛发收集器', NULL, 'XF1', '广州潮流', '台', 2800.00, '2.2kw', 1),
(67, '过滤材料(V)', NULL, '石英砂', '国产优质', '套', 1500.00, NULL, 1),
(68, '池体配件(VI)', NULL, NULL, '国产优质', '批', 1200.00, '给水口、回水口、池底隔栅', 1),
(69, '机房内配套的管路、阀门(VI)', NULL, NULL, '台塑', '套', 6500.00, 'UPVC、铸铁阀门', 1),
(70, '控制装置(V)', NULL, NULL, '广州潮流', '套', 5200.00, NULL, 1),
(71, '机房内配套电线、线槽等(VI)', NULL, NULL, '广东', '批', 800.00, '水泵至控制装置之间', 1);

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `plans`
--

CREATE TABLE `plans` (
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `section_relation` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `plans`
--

INSERT INTO `plans` (`plan_id`, `name`, `section_relation`, `description`, `footer`, `comments`, `status`) VALUES
(1, '水处理设备', 'pick_one', '设备概况：\n1、304不锈钢过滤器（B2400，B1800，B1600）；\\r\\n2、304不锈钢毛发收集器；\\r\\n3、美国米顿罗消毒投药泵；\\r\\n4、水处理是我公司的起家本业，我公司也是全国第一家专业水处理注册公司，已有二十几年行业经验，过滤器设备是公司专利技术产品，专业的品质和服务足以保证水质达到并优于《人工游泳池水质卫生标准》的检验要求。', '（不含机房外的管道、阀门）', '', 1),
(2, '水处理设备-1', 'pick_one', '设备概况：\n1、304不锈钢过滤器（B2400，B1800，B1600）；\n2、304不锈钢毛发收集器；\n3、美国米顿罗消毒投药泵；\n4、水处理是我公司的起家本业，我公司也是全国第一家专业水处理注册公司，已有二十几年行业经验，过滤器设备是公司专利技术产品，专业的品质和服务足以保证水质达到并优于《人工游泳池水质卫生标准》的检验要求。', '（不含机房外的管道、阀门）', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sections`
--

CREATE TABLE `sections` (
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `layer` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `sections`
--

INSERT INTO `sections` (`section_id`, `name`, `description`, `plan_id`, `layer`, `sequence`, `status`) VALUES
(1, '_池（Ф2400，15kw）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 1, 1),
(2, '_池（Ф1800，7.5kw，1个泵）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 2, 1),
(3, '_池（Ф1800，7.5kw，2个泵）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 3, 1),
(4, '_池（Ф1600，5.5kw）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 4, 1),
(5, '_落水池（Ф1200，4.0kw）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 5, 1),
(6, '_落水池（Ф1000，3.0kw）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 6, 1);

-- --------------------------------------------------------

--
-- 表的结构 `section_materials`
--

CREATE TABLE `section_materials` (
  `section_material_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `sequence` int(11) NOT NULL,
  `default_quantity` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '数字越小，优先级越高。0为最高优先级。',
  `is_fixed_amount` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `section_materials`
--

INSERT INTO `section_materials` (`section_material_id`, `section_id`, `material_id`, `sequence`, `default_quantity`, `priority`, `is_fixed_amount`, `status`) VALUES
(1, 1, 1, 1, 1, 0, 0, 1),
(2, 1, 2, 2, 1, 0, 0, 1),
(3, 1, 3, 2, 1, 1, 0, 1),
(4, 1, 4, 2, 1, 2, 0, 1),
(5, 1, 5, 2, 1, 3, 0, 1),
(6, 1, 6, 3, 1, 0, 0, 1),
(7, 1, 7, 4, 1, 0, 0, 1),
(8, 1, 8, 4, 1, 1, 0, 1),
(9, 1, 9, 4, 1, 2, 0, 1),
(10, 1, 10, 5, 1, 0, 0, 1),
(11, 1, 11, 5, 1, 1, 0, 1),
(12, 1, 12, 5, 1, 2, 0, 1),
(13, 1, 13, 6, 2, 0, 0, 1),
(14, 1, 14, 7, 2, 0, 0, 1),
(15, 1, 15, 8, 1, 0, 0, 1),
(16, 1, 16, 9, 2, 0, 0, 1),
(17, 1, 17, 9, 2, 1, 0, 1),
(18, 1, 18, 9, 2, 2, 0, 1),
(19, 1, 19, 9, 2, 3, 0, 1),
(20, 1, 20, 10, 1, 0, 0, 1),
(21, 1, 21, 11, 1, 0, 0, 1),
(22, 1, 22, 12, 1, 0, 0, 1),
(23, 1, 23, 13, 1, 0, 0, 1),
(24, 2, 24, 1, 1, 0, 0, 1),
(25, 2, 25, 2, 1, 0, 0, 1),
(26, 2, 26, 2, 1, 1, 0, 1),
(27, 2, 27, 2, 1, 2, 0, 1),
(28, 2, 28, 2, 1, 3, 0, 1),
(29, 2, 29, 3, 1, 0, 0, 1),
(30, 2, 7, 4, 1, 0, 0, 1),
(31, 2, 8, 4, 1, 1, 0, 1),
(32, 2, 9, 4, 1, 2, 0, 1),
(33, 2, 10, 5, 1, 0, 0, 1),
(34, 2, 11, 5, 1, 1, 0, 1),
(35, 2, 12, 5, 1, 2, 0, 1),
(36, 2, 13, 6, 2, 0, 0, 1),
(37, 2, 14, 7, 2, 0, 0, 1),
(38, 2, 30, 8, 1, 0, 0, 1),
(39, 2, 16, 9, 1, 0, 0, 1),
(40, 2, 17, 9, 1, 1, 0, 1),
(41, 2, 18, 9, 1, 2, 0, 1),
(42, 2, 19, 9, 1, 3, 0, 1),
(43, 2, 31, 10, 1, 0, 0, 1),
(44, 2, 32, 11, 1, 0, 0, 1),
(45, 2, 22, 12, 1, 0, 0, 1),
(46, 2, 33, 13, 1, 0, 0, 1),
(47, 3, 24, 1, 2, 0, 0, 1),
(48, 3, 25, 2, 2, 0, 0, 1),
(49, 3, 26, 2, 2, 1, 0, 1),
(50, 3, 27, 2, 2, 2, 0, 1),
(51, 3, 28, 2, 2, 3, 0, 1),
(52, 3, 29, 3, 2, 0, 0, 1),
(53, 3, 7, 4, 2, 0, 0, 1),
(54, 3, 8, 4, 2, 1, 0, 1),
(55, 3, 9, 4, 2, 2, 0, 1),
(56, 3, 10, 5, 2, 0, 0, 1),
(57, 3, 11, 5, 2, 1, 0, 1),
(58, 3, 12, 5, 2, 2, 0, 1),
(59, 3, 13, 6, 4, 0, 0, 1),
(60, 3, 14, 7, 4, 0, 0, 1),
(61, 3, 30, 8, 2, 0, 0, 1),
(62, 3, 16, 9, 2, 0, 0, 1),
(63, 3, 17, 9, 2, 1, 0, 1),
(64, 3, 18, 9, 2, 2, 0, 1),
(65, 3, 19, 9, 2, 3, 0, 1),
(66, 3, 34, 10, 1, 0, 0, 1),
(67, 3, 35, 11, 1, 0, 0, 1),
(68, 3, 36, 12, 1, 0, 0, 1),
(69, 3, 37, 13, 1, 0, 0, 1),
(70, 4, 38, 1, 1, 0, 0, 1),
(71, 4, 39, 2, 1, 0, 0, 1),
(72, 4, 40, 2, 1, 1, 0, 1),
(73, 4, 41, 2, 1, 2, 0, 1),
(74, 4, 42, 2, 1, 3, 0, 1),
(75, 4, 29, 3, 1, 0, 0, 1),
(76, 4, 7, 4, 1, 0, 0, 1),
(77, 4, 8, 4, 1, 1, 0, 1),
(78, 4, 9, 4, 1, 2, 0, 1),
(79, 4, 10, 5, 1, 0, 0, 1),
(80, 4, 11, 5, 1, 1, 0, 1),
(81, 4, 12, 5, 1, 2, 0, 1),
(82, 4, 13, 6, 2, 0, 0, 1),
(83, 4, 14, 7, 2, 0, 0, 1),
(84, 4, 43, 8, 1, 0, 0, 1),
(85, 4, 16, 9, 2, 0, 0, 1),
(86, 4, 17, 9, 2, 1, 0, 1),
(87, 4, 18, 9, 2, 2, 0, 1),
(88, 4, 19, 9, 2, 3, 0, 1),
(89, 4, 44, 10, 1, 0, 0, 1),
(90, 4, 45, 11, 1, 0, 0, 1),
(91, 4, 46, 12, 1, 0, 0, 1),
(92, 4, 47, 13, 1, 0, 0, 1),
(93, 5, 48, 1, 1, 0, 0, 1),
(94, 5, 49, 2, 1, 0, 0, 1),
(95, 5, 50, 2, 1, 1, 0, 1),
(96, 5, 51, 2, 1, 2, 0, 1),
(97, 5, 52, 2, 1, 3, 0, 1),
(98, 5, 53, 2, 1, 4, 0, 1),
(99, 5, 54, 3, 1, 0, 0, 1),
(100, 5, 7, 4, 1, 0, 0, 1),
(101, 5, 8, 4, 1, 1, 0, 1),
(102, 5, 9, 4, 1, 2, 0, 1),
(103, 5, 10, 5, 1, 0, 0, 1),
(104, 5, 11, 5, 1, 1, 0, 1),
(105, 5, 12, 5, 1, 2, 0, 1),
(106, 5, 13, 6, 2, 0, 0, 1),
(107, 5, 14, 7, 2, 0, 0, 1),
(108, 5, 55, 8, 1, 0, 0, 1),
(109, 5, 16, 9, 2, 0, 0, 1),
(110, 5, 17, 9, 2, 1, 0, 1),
(111, 5, 18, 9, 2, 2, 0, 1),
(112, 5, 19, 9, 2, 3, 0, 1),
(113, 5, 56, 10, 1, 0, 0, 1),
(114, 5, 57, 11, 1, 0, 0, 1),
(115, 5, 58, 12, 1, 0, 0, 1),
(116, 5, 59, 13, 1, 0, 0, 1),
(117, 6, 60, 1, 1, 0, 0, 1),
(118, 6, 61, 2, 1, 0, 0, 1),
(119, 6, 62, 2, 1, 1, 0, 1),
(120, 6, 63, 2, 1, 2, 0, 1),
(121, 6, 64, 2, 1, 3, 0, 1),
(122, 6, 65, 2, 1, 4, 0, 1),
(123, 6, 66, 3, 1, 0, 0, 1),
(124, 6, 7, 4, 1, 0, 0, 1),
(125, 6, 8, 4, 1, 1, 0, 1),
(126, 6, 9, 4, 1, 2, 0, 1),
(127, 6, 10, 5, 1, 0, 0, 1),
(128, 6, 11, 5, 1, 1, 0, 1),
(129, 6, 12, 5, 1, 2, 0, 1),
(130, 6, 13, 6, 2, 0, 0, 1),
(131, 6, 14, 7, 2, 0, 0, 1),
(132, 6, 67, 8, 1, 0, 0, 1),
(133, 6, 16, 9, 2, 0, 0, 1),
(134, 6, 17, 9, 2, 1, 0, 1),
(135, 6, 18, 9, 2, 2, 0, 1),
(136, 6, 19, 9, 2, 3, 0, 1),
(137, 6, 68, 10, 1, 0, 0, 1),
(138, 6, 69, 11, 1, 0, 0, 1),
(139, 6, 70, 12, 1, 0, 0, 1),
(140, 6, 71, 13, 1, 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD UNIQUE KEY `material_id` (`material_id`),
  ADD KEY `name` (`name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD UNIQUE KEY `order` (`order_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD UNIQUE KEY `plan_id` (`plan_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD UNIQUE KEY `section_id` (`section_id`);

--
-- Indexes for table `section_materials`
--
ALTER TABLE `section_materials`
  ADD UNIQUE KEY `section_material_id` (`section_material_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `sequence` (`sequence`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `materials`
--
ALTER TABLE `materials`
  MODIFY `material_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;
--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `plans`
--
ALTER TABLE `plans`
  MODIFY `plan_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `section_materials`
--
ALTER TABLE `section_materials`
  MODIFY `section_material_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
