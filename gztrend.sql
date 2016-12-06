-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2016 at 08:56 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.22

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
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spec` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `unit` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` float(9,2) DEFAULT '0.00',
  `comments` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`material_id`, `name`, `type`, `spec`, `brand`, `unit`, `unit_price`, `comments`, `status`) VALUES
(1, '304不锈钢过滤器(2400)', NULL, 'Ф2400', '广州潮流', '台', 69500.00, '', 1),
(2, '水泵', NULL, '15kw', '上海或广东', '台', 9600.00, '', 1),
(3, '水泵', '', 'KQW125/125-15/2', '凯泉（上海）', '台', 9600.00, '15kw', 1),
(4, '水泵', '', 'SLW125-125', '连成（上海）', '台', 9600.00, '15kw', 1),
(5, '水泵', NULL, 'GD125-20', '肯富来（广东）', '台', 9600.00, '15kw', 1),
(6, '毛发收集器', NULL, 'XF4', '广州潮流', '台', 6200.00, '304不锈钢材质', 1),
(7, '絮凝系统', NULL, 'P066-Y', '米顿罗', '台', 2850.00, '', 1),
(8, '絮凝系统', NULL, 'C-660P', '蓝白', '台', 2850.00, '', 1),
(9, '絮凝系统', NULL, 'AKL-800', '赛高', '台', 2850.00, '', 1),
(10, '消毒系统', NULL, 'P066-Y', '米顿罗', '台', 2850.00, '', 1),
(11, '消毒系统', NULL, 'C-660P', '蓝白', '台', 2850.00, '', 1),
(12, '消毒系统', NULL, 'AKL-800', '赛高', '台', 2850.00, '', 1),
(13, '投药架', NULL, NULL, '广州潮流', '个', 250.00, '', 1),
(14, '药桶', NULL, NULL, '国产优质', '个', 80.00, '', 1),
(15, '过滤材料(I)', NULL, NULL, '国产优质', '套', 5300.00, '', 1),
(16, '机房排污泵', NULL, '1.5kw', '上海或广东', '台', 4230.00, '1.5kw', 1),
(17, '机房排污泵', NULL, '50WQ/D242-1.5', NULL, '台', 4230.00, '1.5kw', 1),
(18, '机房排污泵', NULL, '50WQ15-16-1.5', NULL, '台', 4230.00, '1.5kw', 1),
(19, '机房排污泵', NULL, '50QW18-15-1.5', NULL, '台', 4230.00, '1.5kw', 1),
(20, '池体配件(I)', NULL, NULL, '国产优质', '批', 5300.00, '给水口、回水口、池底隔栅', 1),
(21, '机房内配套的管路、阀门(I)', NULL, NULL, '台塑', '套', 31000.00, 'UPVC、铸铁阀门', 1),
(22, '控制装置(I)', NULL, NULL, '广州潮流', '套', 7800.00, '', 1),
(23, '机房内配套电线、线槽等(I)', NULL, NULL, '广东', '批', 5300.00, '水泵至控制装置之间', 1),
(24, '304不锈钢过滤器(1800)', NULL, 'Ф1800', '广州潮流', '台', 40500.00, '', 1),
(25, '水泵', NULL, '7.5kw', '上海或广东', '台', 5100.00, 'Q=89m3/Hr,H=16M,N=7.5KW', 1),
(26, '水泵', NULL, 'KQW100/110-7.5/2', '凯泉（上海）', '台', 5100.00, '7.5kw', 1),
(27, '水泵', NULL, 'SLW100-125A', '连成（上海）', '台', 5100.00, '7.5kw', 1),
(28, '水泵', NULL, 'GD100-19', '肯富来（广东）', '台', 5100.00, '7.5kw', 1),
(29, '毛发收集器', NULL, 'XF3', '广州潮流', '台', 4200.00, '304不锈钢材质', 1),
(30, '过滤材料(II)', NULL, NULL, '国产优质', '套', 2800.00, '', 1),
(31, '池体配件(II)', NULL, NULL, '国产优质', '批', 2800.00, '给水口、回水口、池底隔栅', 1),
(32, '机房内配套的管路、阀门(II)', NULL, NULL, '台塑', '套', 17000.00, 'UPVC、铸铁阀门', 1),
(33, '机房内配套电线、线槽等(II)', NULL, NULL, '广东', '批', 1800.00, '水泵至控制装置之间', 1),
(34, '池体配件(III)', NULL, NULL, '国产优质', '批', 5800.00, '给水口、回水口、池底隔栅', 1),
(35, '机房内配套的管路、阀门(III)', NULL, NULL, '台塑', '套', 34000.00, 'UPVC、铸铁阀门', 1),
(36, '控制装置(II)', NULL, NULL, '广州潮流', '套', 9800.00, '', 1),
(37, '机房内配套电线、线槽等(III)', NULL, NULL, '广东', '批', 3600.00, '水泵至控制装置之间', 1),
(38, '不锈钢过滤器(1600)', NULL, 'B1600', '广州潮流', '台', 36500.00, '', 1),
(39, '水泵', NULL, '5.5kw', '上海或广东', '台', 5600.00, 'Q=50m3/Hr,H=20M,N=5.5KW', 1),
(40, '水泵', NULL, 'KQW100/250-5.5/4', '凯泉（上海）', '台', 5600.00, '5.5kw', 1),
(41, '水泵', NULL, 'SLWD100-250', '连成（上海）', '台', 5600.00, '5.5kw', 1),
(42, '水泵', NULL, 'GD100-21', '肯富来（广东）', '台', 5600.00, '5.5kw', 1),
(43, '过滤材料(III)', NULL, NULL, '国产优质', '套', 2400.00, '', 1),
(44, '池体配件(IV)', NULL, NULL, '国产优质', '批', 2500.00, '', 1),
(45, '机房内配套的管路、阀门(IV)', NULL, NULL, '台塑', '套', 14500.00, 'UPVC、铸铁阀门', 1),
(46, '控制装置(III)', NULL, NULL, '广州潮流', '套', 6800.00, '', 1),
(47, '机房内配套电线、线槽等(IV)', NULL, NULL, '广东', '批', 1500.00, '水泵至控制装置之间', 1),
(48, '玻璃纤维过滤器(1200)', NULL, 'Ф1200', '广州潮流', '台', 5800.00, '', 1),
(49, '水泵', NULL, '4.0kw', '上海或广东', '台', 3800.00, 'Q=45m3/Hr,H=16M,N=4.0KW', 1),
(50, '水泵', NULL, 'KQW80/110-4/2', '凯泉（上海）', '台', 3800.00, '4.0kw', 1),
(51, '水泵', NULL, 'SLW80-125A', '连成（上海）', '台', 3800.00, '4.0kw', 1),
(52, '水泵', NULL, 'GD80-21', '肯富来（广东）', '台', 3800.00, '4.0kw', 1),
(53, '水泵', NULL, '5.0HP（380V）', '蒲力德', '台', 3800.00, '4.0kw', 1),
(54, '毛发收集器', NULL, 'XF2', '广州潮流', '台', 3500.00, '304不锈钢材质，采用蒲力德时则不需要', 1),
(55, '过滤材料(IV)', NULL, NULL, '国产优质', '套', 1800.00, '', 1),
(56, '池体配件(V)', NULL, NULL, '国产优质', '批', 1500.00, '给水口、回水口、池底隔栅', 1),
(57, '机房内配套的管路、阀门(V)', NULL, NULL, '台塑', '套', 8800.00, 'UPVC、铸铁阀门', 1),
(58, '控制装置(IV)', NULL, NULL, '广州潮流', '套', 6500.00, '', 1),
(59, '机房内配套电线、线槽等(V)', NULL, NULL, '广东', '批', 1200.00, '水泵至控制装置之间', 1),
(60, '玻璃钢过滤器(1000)', NULL, 'Ф1000', '广州潮流', '台', 4500.00, '', 1),
(61, '水泵', NULL, '3.0kw', '上海或广东', '台', 3200.00, 'Q=25m3/Hr,H=20M,N=3.0KW', 1),
(62, '水泵', NULL, 'KQW65/125-3/2', '凯泉（上海）', '台', 3200.00, '3.0kw', 1),
(63, '水泵', NULL, 'SLW65-125', '连成（上海）', '台', 3200.00, '3.0kw', 1),
(64, '水泵', NULL, 'GD65-19', '肯富来（广东）', '台', 3200.00, '3.0kw', 1),
(65, '水泵', NULL, '3.0HP（380V）', '蒲力德', '台', 3200.00, '3.0kw', 1),
(66, '毛发收集器', NULL, 'XF1', '广州潮流', '台', 2800.00, '2.2kw', 1),
(67, '过滤材料(V)', NULL, '石英砂', '国产优质', '套', 1500.00, '', 1),
(68, '池体配件(VI)', NULL, NULL, '国产优质', '批', 1200.00, '给水口、回水口、池底隔栅', 1),
(69, '机房内配套的管路、阀门(VI)', NULL, NULL, '台塑', '套', 6500.00, 'UPVC、铸铁阀门', 1),
(70, '控制装置(V)', NULL, NULL, '广州潮流', '套', 5200.00, '', 1),
(71, '机房内配套电线、线槽等(VI)', NULL, NULL, '广东', '批', 800.00, '水泵至控制装置之间', 1),
(77, '冲天大白鲨滑道本体', NULL, '', '广州潮流', '套', 3300000.00, '滑道展开长度202m，滑板宽度：3.5m～8.8m', 1),
(78, '滑梯连接材料', NULL, '', '配套', '套', 108000.00, '紧固件，密封胶条，西卡胶', 1),
(79, '水泵', NULL, '37KW', '上海或广东Q=280M3/HR,H=28M,N=37KW', '台', 20250.00, '', 1),
(80, '水泵', NULL, '18.5KW', '上海或广东Q=160M3/HR,H=27M,N=18.5KW', '台', 8670.00, '', 1),
(81, '水泵', NULL, '11KW', '上海或广东Q=160M3/HR,H=12.5M,N=11KW', '台', 7720.00, '', 1),
(82, '水泵', NULL, '30KW', '上海或广东Q=262M3/HR,H=24M,N=30KW', '台', 16700.00, '', 1),
(83, '毛发收集器', NULL, 'XF4B', '"304不锈钢材质   广州潮流"', '台', 8650.00, '', 1),
(84, '毛发收集器', NULL, 'XF4', '"304不锈钢材质   广州潮流"', '台', 6200.00, '', 1),
(85, '机房内配套的管路、阀门', NULL, 'UPVC，铸铁阀门', '台塑UPVC', '批', 80460.00, '', 1),
(86, '机房控制装置', NULL, '', '广州潮流', '套', 38600.00, '施耐德或ABB电气元件', 1),
(87, '机房内电线、线槽等', NULL, '', '广东', '批', 15500.00, '水泵至控制装置之间', 1),
(88, '现场控制装置', NULL, '', '广州潮流', '套', 18800.00, '施耐德或ABB电气元件', 1),
(89, '机房到现场控制装置的配套电缆及线管', NULL, '', '广东', '批', 25600.00, '', 1),
(90, '设备主体', NULL, 'PS25', '广州', '套', 38950.00, '', 1),
(91, '水泵', NULL, '15KW', '上海或广东 Q=43.3M³/HR,H=60M,N=15KW', '台', 8150.00, '', 1),
(92, '毛发收集器', NULL, 'XF2', '"304不锈钢材质   广州潮流"', '台', 3600.00, '', 1),
(93, '机房内配套的管路、阀门', NULL, '', '台塑UPVC', '套', 12500.00, 'UPVC管路，铸铁阀门', 1),
(94, '水泵', NULL, '凯泉KQW80/220-15/2', '', '台', 8150.00, '', 1),
(95, '水泵', NULL, '连成SLW80-250B', '', '台', 8150.00, '', 1),
(96, '控制装置', NULL, '', '广州潮流', '套', 6300.00, '施耐德或ABB电气元件', 1),
(97, '机房内配套电线、线槽等', NULL, '', '广东', '批', 2500.00, '水泵至控制装置之间', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `content`, `created_at`) VALUES
(1, '{"plan_id":"1","description":"设备概况：\\r\\n1、304不锈钢过滤器（B2400，B1800，B1600）；\\r\\n2、304不锈钢毛发收集器；\\r\\n3、美国米顿罗消毒投药泵；\\r\\n4、水处理是我公司的起家本业，我公司也是全国第一家专业水处理注册公司，已有二十几年行业经验，过滤器设备是公司专利技术产品，专业的品质和服务足以保证水质达到并优于《人工游泳池水质卫生标准》的检验要求。","name":"水处理设备","footer":"小计（不含机房外的管道、阀门）","final_price":235790,"sections":[{"section_id":4,"name":"_池（Ф1600，5.5kw）","sequence":4,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":196070,"materials":[{"material_id":38,"sequence":1,"unit":"台","type":null,"quantity":"4","is_fixed_amount":false,"unit_price":36500,"name":"不锈钢过滤器(1600)","brand":"广州潮流","spec":"B1600","comments":null,"original_price":"146000.00","discount":"1","final_price":"146000.00"},{"material_id":39,"sequence":2,"unit":"台","type":"Q=50m3/Hr,H=20M,N=5.5KW","quantity":1,"is_fixed_amount":false,"unit_price":5600,"name":"水泵","brand":"上海或广东","spec":"5.5kw","comments":"Q=50m3/Hr,H=20M,N=5.5KW","original_price":"5600.00","discount":1,"final_price":"5600.00"},{"material_id":29,"sequence":3,"unit":"台","type":"304不锈钢材质","quantity":1,"is_fixed_amount":false,"unit_price":4200,"name":"毛发收集器","brand":"广州潮流","spec":"XF3","comments":"304不锈钢材质","original_price":"4200.00","discount":1,"final_price":"4200.00"},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":"500.00","discount":1,"final_price":"500.00"},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":"160.00","discount":1,"final_price":"160.00"},{"material_id":43,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2400,"name":"过滤材料(III)","brand":"国产优质","spec":null,"comments":null,"original_price":"2400.00","discount":1,"final_price":"2400.00"},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":"8460.00","discount":1,"final_price":"8460.00"},{"material_id":44,"sequence":10,"unit":"批","type":"","quantity":1,"is_fixed_amount":false,"unit_price":2500,"name":"池体配件(IV)","brand":"国产优质","spec":null,"comments":"","original_price":"2500.00","discount":"0.7","final_price":"1750.00"},{"material_id":45,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":14500,"name":"机房内配套的管路、阀门(IV)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":"14500.00","discount":1,"final_price":"14500.00"},{"material_id":46,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":6800,"name":"控制装置(III)","brand":"广州潮流","spec":null,"comments":null,"original_price":"6800.00","discount":1,"final_price":"6800.00"}]},{"section_id":6,"name":"_落水池（Ф1000，3.0kw）","sequence":6,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":39720,"materials":[{"material_id":60,"sequence":1,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":4500,"name":"玻璃钢过滤器(1000)","brand":"广州潮流","spec":"Ф1000","comments":null,"original_price":"4500.00","discount":1,"final_price":"4500.00"},{"material_id":61,"sequence":2,"unit":"台","type":"Q=25m3/Hr,H=20M,N=3.0KW","quantity":1,"is_fixed_amount":false,"unit_price":3200,"name":"水泵","brand":"上海或广东","spec":"3.0kw","comments":"Q=25m3/Hr,H=20M,N=3.0KW","original_price":"3200.00","discount":1,"final_price":"3200.00"},{"material_id":66,"sequence":3,"unit":"台","type":"2.2kw","quantity":1,"is_fixed_amount":false,"unit_price":2800,"name":"毛发收集器","brand":"广州潮流","spec":"XF1","comments":"2.2kw","original_price":"2800.00","discount":1,"final_price":"2800.00"},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":"500.00","discount":1,"final_price":"500.00"},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":"160.00","discount":1,"final_price":"160.00"},{"material_id":67,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":1500,"name":"过滤材料(V)","brand":"国产优质","spec":"石英砂","comments":null,"original_price":"1500.00","discount":1,"final_price":"1500.00"},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":"8460.00","discount":1,"final_price":"8460.00"},{"material_id":68,"sequence":10,"unit":"批","type":"给水口、回水口、池底隔栅","quantity":1,"is_fixed_amount":false,"unit_price":1200,"name":"池体配件(VI)","brand":"国产优质","spec":null,"comments":"给水口、回水口、池底隔栅","original_price":"1200.00","discount":1,"final_price":"1200.00"},{"material_id":69,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":6500,"name":"机房内配套的管路、阀门(VI)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":"6500.00","discount":1,"final_price":"6500.00"},{"material_id":70,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":5200,"name":"控制装置(V)","brand":"广州潮流","spec":null,"comments":null,"original_price":"5200.00","discount":1,"final_price":"5200.00"}]}]}', '2016-02-24 23:06:41'),
(2, '{"plan_id":"1","description":"设备概况：\\r\\n1、304不锈钢过滤器（B2400，B1800，B1600）；\\r\\n2、304不锈钢毛发收集器；\\r\\n3、美国米顿罗消毒投药泵；\\r\\n4、水处理是我公司的起家本业，我公司也是全国第一家专业水处理注册公司，已有二十几年行业经验，过滤器设备是公司专利技术产品，专业的品质和服务足以保证水质达到并优于《人工游泳池水质卫生标准》的检验要求。","name":"水处理设备","footer":"小计（不含机房外的管道、阀门）","final_price":175980,"sections":[{"section_id":3,"name":"_池（Ф1800，7.5kw，2个泵）","sequence":3,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":175980,"materials":[{"material_id":24,"sequence":1,"unit":"台","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":40500,"name":"304不锈钢过滤器(1800)","brand":"广州潮流","spec":"Ф1800","comments":null,"original_price":"81000.00","discount":1,"final_price":"81000.00"},{"material_id":25,"sequence":2,"unit":"台","type":"Q=89m3/Hr,H=16M,N=7.5KW","quantity":2,"is_fixed_amount":false,"unit_price":5100,"name":"水泵","brand":"上海或广东","spec":"7.5kw","comments":"Q=89m3/Hr,H=16M,N=7.5KW","original_price":"10200.00","discount":1,"final_price":"10200.00"},{"material_id":29,"sequence":3,"unit":"台","type":"304不锈钢材质","quantity":2,"is_fixed_amount":false,"unit_price":4200,"name":"毛发收集器","brand":"广州潮流","spec":"XF3","comments":"304不锈钢材质","original_price":"8400.00","discount":1,"final_price":"8400.00"},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"5700.00","discount":1,"final_price":"5700.00"},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"5700.00","discount":1,"final_price":"5700.00"},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":4,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":"1000.00","discount":1,"final_price":"1000.00"},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":4,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":"320.00","discount":1,"final_price":"320.00"},{"material_id":30,"sequence":8,"unit":"套","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":2800,"name":"过滤材料(II)","brand":"国产优质","spec":null,"comments":null,"original_price":"5600.00","discount":1,"final_price":"5600.00"},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":"8460.00","discount":1,"final_price":"8460.00"},{"material_id":34,"sequence":10,"unit":"批","type":"给水口、回水口、池底隔栅","quantity":1,"is_fixed_amount":false,"unit_price":5800,"name":"池体配件(III)","brand":"国产优质","spec":null,"comments":"给水口、回水口、池底隔栅","original_price":"5800.00","discount":1,"final_price":"5800.00"},{"material_id":35,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":34000,"name":"机房内配套的管路、阀门(III)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":"34000.00","discount":1,"final_price":"34000.00"},{"material_id":36,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":9800,"name":"控制装置(II)","brand":"广州潮流","spec":null,"comments":null,"original_price":"9800.00","discount":1,"final_price":"9800.00"}]}]}', '2016-02-24 23:10:51'),
(3, '{"plan_id":"1","description":"设备概况：\\r\\n1、304不锈钢过滤器（B2400，B1800，B1600）；\\r\\n2、304不锈钢毛发收集器；\\r\\n3、美国米顿罗消毒投药泵；\\r\\n4、水处理是我公司的起家本业，我公司也是全国第一家专业水处理注册公司，已有二十几年行业经验，过滤器设备是公司专利技术产品，专业的品质和服务足以保证水质达到并优于《人工游泳池水质卫生标准》的检验要求。","name":"水处理设备","footer":"小计（不含机房外的管道、阀门）","final_price":175980,"sections":[{"section_id":3,"name":"_池（Ф1800，7.5kw，2个泵）","sequence":3,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":175980,"materials":[{"material_id":24,"sequence":1,"unit":"台","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":40500,"name":"304不锈钢过滤器(1800)","brand":"广州潮流","spec":"Ф1800","comments":null,"original_price":"81000.00","discount":1,"final_price":"81000.00"},{"material_id":25,"sequence":2,"unit":"台","type":"Q=89m3/Hr,H=16M,N=7.5KW","quantity":2,"is_fixed_amount":false,"unit_price":5100,"name":"水泵","brand":"上海或广东","spec":"7.5kw","comments":"Q=89m3/Hr,H=16M,N=7.5KW","original_price":"10200.00","discount":1,"final_price":"10200.00"},{"material_id":29,"sequence":3,"unit":"台","type":"304不锈钢材质","quantity":2,"is_fixed_amount":false,"unit_price":4200,"name":"毛发收集器","brand":"广州潮流","spec":"XF3","comments":"304不锈钢材质","original_price":"8400.00","discount":1,"final_price":"8400.00"},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"5700.00","discount":1,"final_price":"5700.00"},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"5700.00","discount":1,"final_price":"5700.00"},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":4,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":"1000.00","discount":1,"final_price":"1000.00"},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":4,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":"320.00","discount":1,"final_price":"320.00"},{"material_id":30,"sequence":8,"unit":"套","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":2800,"name":"过滤材料(II)","brand":"国产优质","spec":null,"comments":null,"original_price":"5600.00","discount":1,"final_price":"5600.00"},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":"8460.00","discount":1,"final_price":"8460.00"},{"material_id":34,"sequence":10,"unit":"批","type":"给水口、回水口、池底隔栅","quantity":1,"is_fixed_amount":false,"unit_price":5800,"name":"池体配件(III)","brand":"国产优质","spec":null,"comments":"给水口、回水口、池底隔栅","original_price":"5800.00","discount":1,"final_price":"5800.00"},{"material_id":35,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":34000,"name":"机房内配套的管路、阀门(III)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":"34000.00","discount":1,"final_price":"34000.00"},{"material_id":36,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":9800,"name":"控制装置(II)","brand":"广州潮流","spec":null,"comments":null,"original_price":"9800.00","discount":1,"final_price":"9800.00"}]}]}', '2016-02-24 23:11:03'),
(4, '{"plan_id":"1","description":"设备概况：\\r\\n1、304不锈钢过滤器（B2400，B1800，B1600）；\\r\\n2、304不锈钢毛发收集器；\\r\\n3、美国米顿罗消毒投药泵；\\r\\n4、水处理是我公司的起家本业，我公司也是全国第一家专业水处理注册公司，已有二十几年行业经验，过滤器设备是公司专利技术产品，专业的品质和服务足以保证水质达到并优于《人工游泳池水质卫生标准》的检验要求。","name":"水处理设备","footer":"小计（不含机房外的管道、阀门）","final_price":173560,"sections":[{"section_id":4,"name":"_池（Ф1600，5.5kw）","sequence":4,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":87320,"materials":[{"material_id":38,"sequence":1,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":36500,"name":"不锈钢过滤器(1600)","brand":"广州潮流","spec":"B1600","comments":null,"original_price":"36500.00","discount":1,"final_price":"36500.00"},{"material_id":39,"sequence":2,"unit":"台","type":"Q=50m3/Hr,H=20M,N=5.5KW","quantity":1,"is_fixed_amount":false,"unit_price":5600,"name":"水泵","brand":"上海或广东","spec":"5.5kw","comments":"Q=50m3/Hr,H=20M,N=5.5KW","original_price":"5600.00","discount":1,"final_price":"5600.00"},{"material_id":29,"sequence":3,"unit":"台","type":"304不锈钢材质","quantity":1,"is_fixed_amount":false,"unit_price":4200,"name":"毛发收集器","brand":"广州潮流","spec":"XF3","comments":"304不锈钢材质","original_price":"4200.00","discount":1,"final_price":"4200.00"},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":"500.00","discount":1,"final_price":"500.00"},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":"160.00","discount":1,"final_price":"160.00"},{"material_id":43,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2400,"name":"过滤材料(III)","brand":"国产优质","spec":null,"comments":null,"original_price":"2400.00","discount":1,"final_price":"2400.00"},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":"8460.00","discount":1,"final_price":"8460.00"},{"material_id":44,"sequence":10,"unit":"批","type":"","quantity":1,"is_fixed_amount":false,"unit_price":2500,"name":"池体配件(IV)","brand":"国产优质","spec":null,"comments":"","original_price":"2500.00","discount":1,"final_price":"2500.00"},{"material_id":45,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":14500,"name":"机房内配套的管路、阀门(IV)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":"14500.00","discount":1,"final_price":"14500.00"},{"material_id":46,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":6800,"name":"控制装置(III)","brand":"广州潮流","spec":null,"comments":null,"original_price":"6800.00","discount":1,"final_price":"6800.00"}]},{"section_id":5,"name":"_落水池（Ф1200，4.0kw）","sequence":5,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":46520,"materials":[{"material_id":48,"sequence":1,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":5800,"name":"玻璃纤维过滤器(1200)","brand":"广州潮流","spec":"Ф1200","comments":null,"original_price":"5800.00","discount":1,"final_price":"5800.00"},{"material_id":49,"sequence":2,"unit":"台","type":"Q=45m3/Hr,H=16M,N=4.0KW","quantity":1,"is_fixed_amount":false,"unit_price":3800,"name":"水泵","brand":"上海或广东","spec":"4.0kw","comments":"Q=45m3/Hr,H=16M,N=4.0KW","original_price":"3800.00","discount":1,"final_price":"3800.00"},{"material_id":54,"sequence":3,"unit":"台","type":"304不锈钢材质，采用蒲力德时则不需要","quantity":1,"is_fixed_amount":false,"unit_price":3500,"name":"毛发收集器","brand":"广州潮流","spec":"XF2","comments":"304不锈钢材质，采用蒲力德时则不需要","original_price":"3500.00","discount":1,"final_price":"3500.00"},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":"500.00","discount":1,"final_price":"500.00"},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":"160.00","discount":1,"final_price":"160.00"},{"material_id":55,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":1800,"name":"过滤材料(IV)","brand":"国产优质","spec":null,"comments":null,"original_price":"1800.00","discount":1,"final_price":"1800.00"},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":"8460.00","discount":1,"final_price":"8460.00"},{"material_id":56,"sequence":10,"unit":"批","type":"给水口、回水口、池底隔栅","quantity":1,"is_fixed_amount":false,"unit_price":1500,"name":"池体配件(V)","brand":"国产优质","spec":null,"comments":"给水口、回水口、池底隔栅","original_price":"1500.00","discount":1,"final_price":"1500.00"},{"material_id":57,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":8800,"name":"机房内配套的管路、阀门(V)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":"8800.00","discount":1,"final_price":"8800.00"},{"material_id":58,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":6500,"name":"控制装置(IV)","brand":"广州潮流","spec":null,"comments":null,"original_price":"6500.00","discount":1,"final_price":"6500.00"}]},{"section_id":6,"name":"_落水池（Ф1000，3.0kw）","sequence":6,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":39720,"materials":[{"material_id":60,"sequence":1,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":4500,"name":"玻璃钢过滤器(1000)","brand":"广州潮流","spec":"Ф1000","comments":null,"original_price":"4500.00","discount":1,"final_price":"4500.00"},{"material_id":61,"sequence":2,"unit":"台","type":"Q=25m3/Hr,H=20M,N=3.0KW","quantity":1,"is_fixed_amount":false,"unit_price":3200,"name":"水泵","brand":"上海或广东","spec":"3.0kw","comments":"Q=25m3/Hr,H=20M,N=3.0KW","original_price":"3200.00","discount":1,"final_price":"3200.00"},{"material_id":66,"sequence":3,"unit":"台","type":"2.2kw","quantity":1,"is_fixed_amount":false,"unit_price":2800,"name":"毛发收集器","brand":"广州潮流","spec":"XF1","comments":"2.2kw","original_price":"2800.00","discount":1,"final_price":"2800.00"},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":"500.00","discount":1,"final_price":"500.00"},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":"160.00","discount":1,"final_price":"160.00"},{"material_id":67,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":1500,"name":"过滤材料(V)","brand":"国产优质","spec":"石英砂","comments":null,"original_price":"1500.00","discount":1,"final_price":"1500.00"},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":"8460.00","discount":1,"final_price":"8460.00"},{"material_id":68,"sequence":10,"unit":"批","type":"给水口、回水口、池底隔栅","quantity":1,"is_fixed_amount":false,"unit_price":1200,"name":"池体配件(VI)","brand":"国产优质","spec":null,"comments":"给水口、回水口、池底隔栅","original_price":"1200.00","discount":1,"final_price":"1200.00"},{"material_id":69,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":6500,"name":"机房内配套的管路、阀门(VI)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":"6500.00","discount":1,"final_price":"6500.00"},{"material_id":70,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":5200,"name":"控制装置(V)","brand":"广州潮流","spec":null,"comments":null,"original_price":"5200.00","discount":1,"final_price":"5200.00"}]}]}', '2016-03-05 00:01:09'),
(5, '{"plan_id":"1","description":"设备概况：\\r\\n1、304不锈钢过滤器（B2400，B1800，B1600）；\\r\\n2、304不锈钢毛发收集器；\\r\\n3、美国米顿罗消毒投药泵；\\r\\n4、水处理是我公司的起家本业，我公司也是全国第一家专业水处理注册公司，已有二十几年行业经验，过滤器设备是公司专利技术产品，专业的品质和服务足以保证水质达到并优于《人工游泳池水质卫生标准》的检验要求。","name":"水处理设备","footer":"小计（不含机房外的管道、阀门）","final_price":272360,"sections":[{"section_id":4,"name":"_池（Ф1600，5.5kw）","sequence":4,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":87320,"materials":[{"material_id":38,"sequence":1,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":36500,"name":"不锈钢过滤器(1600)","brand":"广州潮流","spec":"B1600","comments":null,"original_price":"36500.00","discount":1,"final_price":"36500.00"},{"material_id":39,"sequence":2,"unit":"台","type":"Q=50m3/Hr,H=20M,N=5.5KW","quantity":1,"is_fixed_amount":false,"unit_price":5600,"name":"水泵","brand":"上海或广东","spec":"5.5kw","comments":"Q=50m3/Hr,H=20M,N=5.5KW","original_price":"5600.00","discount":1,"final_price":"5600.00"},{"material_id":29,"sequence":3,"unit":"台","type":"304不锈钢材质","quantity":1,"is_fixed_amount":false,"unit_price":4200,"name":"毛发收集器","brand":"广州潮流","spec":"XF3","comments":"304不锈钢材质","original_price":"4200.00","discount":1,"final_price":"4200.00"},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":"500.00","discount":1,"final_price":"500.00"},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":"160.00","discount":1,"final_price":"160.00"},{"material_id":43,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2400,"name":"过滤材料(III)","brand":"国产优质","spec":null,"comments":null,"original_price":"2400.00","discount":1,"final_price":"2400.00"},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":"8460.00","discount":1,"final_price":"8460.00"},{"material_id":44,"sequence":10,"unit":"批","type":"","quantity":1,"is_fixed_amount":false,"unit_price":2500,"name":"池体配件(IV)","brand":"国产优质","spec":null,"comments":"","original_price":"2500.00","discount":1,"final_price":"2500.00"},{"material_id":45,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":14500,"name":"机房内配套的管路、阀门(IV)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":"14500.00","discount":1,"final_price":"14500.00"},{"material_id":46,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":6800,"name":"控制装置(III)","brand":"广州潮流","spec":null,"comments":null,"original_price":"6800.00","discount":1,"final_price":"6800.00"}]},{"section_id":5,"name":"_落水池（Ф1200，4.0kw）","sequence":5,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":46520,"materials":[{"material_id":48,"sequence":1,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":5800,"name":"玻璃纤维过滤器(1200)","brand":"广州潮流","spec":"Ф1200","comments":null,"original_price":"5800.00","discount":1,"final_price":"5800.00"},{"material_id":49,"sequence":2,"unit":"台","type":"Q=45m3/Hr,H=16M,N=4.0KW","quantity":1,"is_fixed_amount":false,"unit_price":3800,"name":"水泵","brand":"上海或广东","spec":"4.0kw","comments":"Q=45m3/Hr,H=16M,N=4.0KW","original_price":"3800.00","discount":1,"final_price":"3800.00"},{"material_id":54,"sequence":3,"unit":"台","type":"304不锈钢材质，采用蒲力德时则不需要","quantity":1,"is_fixed_amount":false,"unit_price":3500,"name":"毛发收集器","brand":"广州潮流","spec":"XF2","comments":"304不锈钢材质，采用蒲力德时则不需要","original_price":"3500.00","discount":1,"final_price":"3500.00"},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":"500.00","discount":1,"final_price":"500.00"},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":"160.00","discount":1,"final_price":"160.00"},{"material_id":55,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":1800,"name":"过滤材料(IV)","brand":"国产优质","spec":null,"comments":null,"original_price":"1800.00","discount":1,"final_price":"1800.00"},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":"8460.00","discount":1,"final_price":"8460.00"},{"material_id":56,"sequence":10,"unit":"批","type":"给水口、回水口、池底隔栅","quantity":1,"is_fixed_amount":false,"unit_price":1500,"name":"池体配件(V)","brand":"国产优质","spec":null,"comments":"给水口、回水口、池底隔栅","original_price":"1500.00","discount":1,"final_price":"1500.00"},{"material_id":57,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":8800,"name":"机房内配套的管路、阀门(V)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":"8800.00","discount":1,"final_price":"8800.00"},{"material_id":58,"sequence":12,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":6500,"name":"控制装置(IV)","brand":"广州潮流","spec":null,"comments":null,"original_price":"6500.00","discount":1,"final_price":"6500.00"}]},{"section_id":6,"name":"_落水池（Ф1000，3.0kw）","sequence":6,"layer":1,"description":"水面积_平方米，水深_米，体积_立方米，循环周期约_H","final_price":138520,"materials":[{"material_id":60,"sequence":1,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":4500,"name":"玻璃钢过滤器(1000)","brand":"广州潮流","spec":"Ф1000","comments":null,"original_price":"4500.00","discount":1,"final_price":"4500.00"},{"material_id":61,"sequence":2,"unit":"台","type":"Q=25m3/Hr,H=20M,N=3.0KW","quantity":1,"is_fixed_amount":false,"unit_price":3200,"name":"水泵","brand":"上海或广东","spec":"3.0kw","comments":"Q=25m3/Hr,H=20M,N=3.0KW","original_price":"3200.00","discount":1,"final_price":"3200.00"},{"material_id":66,"sequence":3,"unit":"台","type":"2.2kw","quantity":1,"is_fixed_amount":false,"unit_price":2800,"name":"毛发收集器","brand":"广州潮流","spec":"XF1","comments":"2.2kw","original_price":"2800.00","discount":1,"final_price":"2800.00"},{"material_id":7,"sequence":4,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"絮凝系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":10,"sequence":5,"unit":"台","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":2850,"name":"消毒系统","brand":"米顿罗","spec":"P066-Y","comments":null,"original_price":"2850.00","discount":1,"final_price":"2850.00"},{"material_id":13,"sequence":6,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":250,"name":"投药架","brand":"广州潮流","spec":null,"comments":null,"original_price":"500.00","discount":1,"final_price":"500.00"},{"material_id":14,"sequence":7,"unit":"个","type":null,"quantity":2,"is_fixed_amount":false,"unit_price":80,"name":"药桶","brand":"国产优质","spec":null,"comments":null,"original_price":"160.00","discount":1,"final_price":"160.00"},{"material_id":67,"sequence":8,"unit":"套","type":null,"quantity":1,"is_fixed_amount":false,"unit_price":1500,"name":"过滤材料(V)","brand":"国产优质","spec":"石英砂","comments":null,"original_price":"1500.00","discount":1,"final_price":"1500.00"},{"material_id":16,"sequence":9,"unit":"台","type":"1.5kw","quantity":2,"is_fixed_amount":false,"unit_price":4230,"name":"机房排污泵","brand":"上海或广东","spec":"1.5kw","comments":"1.5kw","original_price":"8460.00","discount":1,"final_price":"8460.00"},{"material_id":68,"sequence":10,"unit":"批","type":"给水口、回水口、池底隔栅","quantity":1,"is_fixed_amount":false,"unit_price":1200,"name":"池体配件(VI)","brand":"国产优质","spec":null,"comments":"给水口、回水口、池底隔栅","original_price":"1200.00","discount":1,"final_price":"1200.00"},{"material_id":69,"sequence":11,"unit":"套","type":"UPVC、铸铁阀门","quantity":1,"is_fixed_amount":false,"unit_price":6500,"name":"机房内配套的管路、阀门(VI)","brand":"台塑","spec":null,"comments":"UPVC、铸铁阀门","original_price":"6500.00","discount":1,"final_price":"6500.00"},{"material_id":70,"sequence":12,"unit":"套","type":null,"quantity":"20","is_fixed_amount":false,"unit_price":5200,"name":"控制装置(V)","brand":"广州潮流","spec":null,"comments":null,"original_price":"104000.00","discount":1,"final_price":"104000.00"}]}]}', '2016-03-05 00:02:14'),
(6, '{"plan_id":"9","description":"\\"设备概况：\\n1、平台高度：28m；\\n2、滑板宽度：3.5m～8.8m；\\n3、乘筏规格：6人乘筏； 3、占地 83m×54m\\n4、总功率：96.5kw。\\"","name":"A、冲天大白鲨滑梯","footer":"小计（不含机房外的管路、阀门，不含滑梯平台）","final_price":3682360,"sections":[{"section_id":16,"name":"a、玻璃钢滑道","sequence":1,"layer":1,"description":"","final_price":3408000,"materials":[{"material_id":77,"sequence":1,"unit":"套","type":"滑道展开长度202m，滑板宽度：3.5m～8.8m","quantity":1,"is_fixed_amount":false,"unit_price":3300000,"name":"冲天大白鲨滑道本体","brand":"广州潮流","spec":"","comments":"滑道展开长度202m，滑板宽度：3.5m～8.8m","original_price":"3300000.00","discount":1,"final_price":"3300000.00"},{"material_id":78,"sequence":2,"unit":"套","type":"紧固件，密封胶条，西卡胶","quantity":1,"is_fixed_amount":false,"unit_price":108000,"name":"滑梯连接材料","brand":"配套","spec":"","comments":"紧固件，密封胶条，西卡胶","original_price":"108000.00","discount":1,"final_price":"108000.00"}]},{"section_id":17,"name":"c、滑梯的供水系统（机房内）","sequence":1,"layer":1,"description":"","final_price":138260,"materials":[{"material_id":79,"sequence":1,"unit":"台","type":"","quantity":"2","is_fixed_amount":false,"unit_price":20250,"name":"水泵","brand":"上海或广东Q=280M3/HR,H=28M,N=37KW","spec":"18.5KW","comments":"","original_price":"40500.00","discount":1,"final_price":"40500.00"},{"material_id":83,"sequence":2,"unit":"台","type":"","quantity":2,"is_fixed_amount":false,"unit_price":8650,"name":"毛发收集器","brand":"\\"304不锈钢材质   广州潮流\\"","spec":"XF4","comments":"","original_price":"17300.00","discount":1,"final_price":"17300.00"},{"material_id":85,"sequence":3,"unit":"批","type":"","quantity":1,"is_fixed_amount":false,"unit_price":80460,"name":"机房内配套的管路、阀门","brand":"台塑UPVC","spec":"UPVC，铸铁阀门","comments":"","original_price":"80460.00","discount":1,"final_price":"80460.00"}]},{"section_id":18,"name":"d、控制系统","sequence":1,"layer":1,"description":"","final_price":136100,"materials":[{"material_id":86,"sequence":1,"unit":"套","type":"施耐德或ABB电气元件","quantity":1,"is_fixed_amount":false,"unit_price":38600,"name":"机房控制装置","brand":"广州潮流","spec":"","comments":"施耐德或ABB电气元件","original_price":"38600.00","discount":1,"final_price":"38600.00"},{"material_id":87,"sequence":2,"unit":"批","type":"水泵至控制装置之间","quantity":1,"is_fixed_amount":false,"unit_price":15500,"name":"机房内电线、线槽等","brand":"广东","spec":"","comments":"水泵至控制装置之间","original_price":"15500.00","discount":1,"final_price":"15500.00"},{"material_id":88,"sequence":3,"unit":"套","type":"施耐德或ABB电气元件","quantity":"3","is_fixed_amount":false,"unit_price":18800,"name":"现场控制装置","brand":"广州潮流","spec":"","comments":"施耐德或ABB电气元件","original_price":"56400.00","discount":1,"final_price":"56400.00"},{"material_id":89,"sequence":4,"unit":"批","type":"","quantity":1,"is_fixed_amount":false,"unit_price":25600,"name":"机房到现场控制装置的配套电缆及线管","brand":"广东","spec":"","comments":"","original_price":"25600.00","discount":1,"final_price":"25600.00"}]}]}', '2016-06-19 21:36:57'),
(7, '{"plan_id":"9","description":"\\"设备概况：\\n1、平台高度：28m；\\n2、滑板宽度：3.5m～8.8m；\\n3、乘筏规格：6人乘筏； 3、占地 83m×54m\\n4、总功率：96.5kw。\\"","name":"A、冲天大白鲨滑梯","footer":"小计（不含机房外的管路、阀门，不含滑梯平台）","final_price":3655510,"sections":[{"section_id":16,"name":"a、玻璃钢滑道","sequence":1,"layer":1,"description":"","final_price":3408000,"materials":[{"material_id":77,"sequence":1,"unit":"套","type":"滑道展开长度202m，滑板宽度：3.5m～8.8m","quantity":1,"is_fixed_amount":false,"unit_price":3300000,"name":"冲天大白鲨滑道本体","brand":"广州潮流","spec":"","comments":"滑道展开长度202m，滑板宽度：3.5m～8.8m","original_price":"3300000.00","discount":1,"final_price":"3300000.00"},{"material_id":78,"sequence":2,"unit":"套","type":"紧固件，密封胶条，西卡胶","quantity":1,"is_fixed_amount":false,"unit_price":108000,"name":"滑梯连接材料","brand":"配套","spec":"","comments":"紧固件，密封胶条，西卡胶","original_price":"108000.00","discount":1,"final_price":"108000.00"}]},{"section_id":17,"name":"c、滑梯的供水系统（机房内）","sequence":1,"layer":1,"description":"","final_price":118010,"materials":[{"material_id":79,"sequence":1,"unit":"台","type":"","quantity":1,"is_fixed_amount":false,"unit_price":20250,"name":"水泵","brand":"上海或广东Q=280M3/HR,H=28M,N=37KW","spec":"37KW","comments":"","original_price":"20250.00","discount":1,"final_price":"20250.00"},{"material_id":83,"sequence":2,"unit":"台","type":"","quantity":2,"is_fixed_amount":false,"unit_price":8650,"name":"毛发收集器","brand":"\\"304不锈钢材质   广州潮流\\"","spec":"XF4B","comments":"","original_price":"17300.00","discount":1,"final_price":"17300.00"},{"material_id":85,"sequence":3,"unit":"批","type":"","quantity":1,"is_fixed_amount":false,"unit_price":80460,"name":"机房内配套的管路、阀门","brand":"台塑UPVC","spec":"UPVC，铸铁阀门","comments":"","original_price":"80460.00","discount":1,"final_price":"80460.00"}]},{"section_id":18,"name":"d、控制系统","sequence":1,"layer":1,"description":"","final_price":129500,"materials":[{"material_id":86,"sequence":1,"unit":"套","type":"施耐德或ABB电气元件","quantity":1,"is_fixed_amount":false,"unit_price":38600,"name":"机房控制装置","brand":"广州潮流","spec":"","comments":"施耐德或ABB电气元件","original_price":"38600.00","discount":1,"final_price":"38600.00"},{"material_id":87,"sequence":2,"unit":"批","type":"水泵至控制装置之间","quantity":"3","is_fixed_amount":false,"unit_price":15500,"name":"机房内电线、线槽等","brand":"广东","spec":"","comments":"水泵至控制装置之间","original_price":"46500.00","discount":1,"final_price":"46500.00"},{"material_id":88,"sequence":3,"unit":"套","type":"施耐德或ABB电气元件","quantity":1,"is_fixed_amount":false,"unit_price":18800,"name":"现场控制装置","brand":"广州潮流","spec":"","comments":"施耐德或ABB电气元件","original_price":"18800.00","discount":1,"final_price":"18800.00"},{"material_id":89,"sequence":4,"unit":"批","type":"","quantity":1,"is_fixed_amount":false,"unit_price":25600,"name":"机房到现场控制装置的配套电缆及线管","brand":"广东","spec":"","comments":"","original_price":"25600.00","discount":1,"final_price":"25600.00"}]}]}', '2016-06-19 22:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `section_relation` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`plan_id`, `name`, `type`, `section_relation`, `description`, `footer`, `comments`, `status`) VALUES
(1, '水处理设备', '水处理设备', 'pick_one', '设备概况：\n1、304不锈钢过滤器（B2400，B1800，B1600）；\n2、304不锈钢毛发收集器；\n3、美国米顿罗消毒投药泵；\n4、水处理是我公司的起家本业，我公司也是全国第一家专业水处理注册公司，已有二十几年行业经验，过滤器设备是公司专利技术产品，专业的品质和服务足以保证水质达到并优于《人工游泳池水质卫生标准》的检验要求。', '小计（不含机房外的管道、阀门）', '', 1),
(9, 'A、冲天大白鲨滑梯', NULL, NULL, '"设备概况：\n1、平台高度：28m；\n2、滑板宽度：3.5m～8.8m；\n3、乘筏规格：6人乘筏； 3、占地 83m×54m\n4、总功率：96.5kw。"', '小计（不含机房外的管路、阀门，不含滑梯平台）', '', 1),
(10, 'B、大水炮', NULL, NULL, '设备概况：                                     \n用于增强景观效果，主要用在造浪池或舞台边上。', '小计（不含机房外的管路、阀门）', '', 1),
(11, '', '', NULL, '', '', '', 1),
(12, '', '', NULL, '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
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
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `name`, `description`, `plan_id`, `layer`, `sequence`, `status`) VALUES
(1, '_池（Ф2400，15kw）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 1, 1),
(2, '_池（Ф1800，7.5kw，1个泵）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 2, 1),
(3, '_池（Ф1800，7.5kw，2个泵）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 3, 1),
(4, '_池（Ф1600，5.5kw）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 4, 1),
(5, '_落水池（Ф1200，4.0kw）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 5, 1),
(6, '_落水池（Ф1000，3.0kw）', '水面积_平方米，水深_米，体积_立方米，循环周期约_H', 1, 1, 6, 1),
(16, 'a、玻璃钢滑道', '', 9, 1, 1, 1),
(17, 'c、滑梯的供水系统（机房内）', '', 9, 1, 1, 1),
(18, 'd、控制系统', '', 9, 1, 1, 1),
(19, 'a、设备本体', '', 10, 1, 1, 1),
(20, 'b、供水系统（机房内）', '', 10, 1, 1, 1),
(21, 'c、控制系统', '', 10, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `section_materials`
--

CREATE TABLE `section_materials` (
  `section_material_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `sequence` int(11) NOT NULL,
  `default_quantity` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '数字越小，优先级越高。0为最高优先级。',
  `is_fixed_amount` tinyint(1) NOT NULL DEFAULT '0',
  `is_fixed_price` tinyint(1) NOT NULL,
  `price_formula` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_materials`
--

INSERT INTO `section_materials` (`section_material_id`, `section_id`, `material_id`, `sequence`, `default_quantity`, `priority`, `is_fixed_amount`, `is_fixed_price`, `price_formula`, `status`) VALUES
(1, 1, 1, 1, 1, 0, 0, 0, NULL, 1),
(2, 1, 2, 2, 1, 0, 0, 0, NULL, 1),
(3, 1, 3, 2, 1, 1, 0, 0, NULL, 1),
(4, 1, 4, 2, 1, 2, 0, 0, NULL, 1),
(5, 1, 5, 2, 1, 3, 0, 0, NULL, 1),
(6, 1, 6, 3, 1, 0, 0, 0, NULL, 1),
(7, 1, 7, 4, 1, 0, 0, 0, NULL, 1),
(8, 1, 8, 4, 1, 1, 0, 0, NULL, 1),
(9, 1, 9, 4, 1, 2, 0, 0, NULL, 1),
(10, 1, 10, 5, 1, 0, 0, 0, NULL, 1),
(11, 1, 11, 5, 1, 1, 0, 0, NULL, 1),
(12, 1, 12, 5, 1, 2, 0, 0, NULL, 1),
(13, 1, 13, 6, 2, 0, 0, 0, NULL, 1),
(14, 1, 14, 7, 2, 0, 0, 0, NULL, 1),
(15, 1, 15, 8, 1, 0, 0, 0, NULL, 1),
(16, 1, 16, 9, 2, 0, 0, 0, NULL, 1),
(17, 1, 17, 9, 2, 1, 0, 0, NULL, 1),
(18, 1, 18, 9, 2, 2, 0, 0, NULL, 1),
(19, 1, 19, 9, 2, 3, 0, 0, NULL, 1),
(20, 1, 20, 10, 1, 0, 0, 0, NULL, 1),
(21, 1, 21, 11, 1, 0, 0, 0, NULL, 1),
(22, 1, 22, 12, 1, 0, 0, 0, NULL, 1),
(23, 1, 23, 13, 1, 0, 0, 0, NULL, 1),
(24, 2, 24, 1, 1, 0, 0, 0, NULL, 1),
(25, 2, 25, 2, 1, 0, 0, 0, NULL, 1),
(26, 2, 26, 2, 1, 1, 0, 0, NULL, 1),
(27, 2, 27, 2, 1, 2, 0, 0, NULL, 1),
(28, 2, 28, 2, 1, 3, 0, 0, NULL, 1),
(29, 2, 29, 3, 1, 0, 0, 0, NULL, 1),
(30, 2, 7, 4, 1, 0, 0, 0, NULL, 1),
(31, 2, 8, 4, 1, 1, 0, 0, NULL, 1),
(32, 2, 9, 4, 1, 2, 0, 0, NULL, 1),
(33, 2, 10, 5, 1, 0, 0, 0, NULL, 1),
(34, 2, 11, 5, 1, 1, 0, 0, NULL, 1),
(35, 2, 12, 5, 1, 2, 0, 0, NULL, 1),
(36, 2, 13, 6, 2, 0, 0, 0, NULL, 1),
(37, 2, 14, 7, 2, 0, 0, 0, NULL, 1),
(38, 2, 30, 8, 1, 0, 0, 0, NULL, 1),
(39, 2, 16, 9, 1, 0, 0, 0, NULL, 1),
(40, 2, 17, 9, 1, 1, 0, 0, NULL, 1),
(41, 2, 18, 9, 1, 2, 0, 0, NULL, 1),
(42, 2, 19, 9, 1, 3, 0, 0, NULL, 1),
(43, 2, 31, 10, 1, 0, 0, 0, NULL, 1),
(44, 2, 32, 11, 1, 0, 0, 0, NULL, 1),
(45, 2, 22, 12, 1, 0, 0, 0, NULL, 1),
(46, 2, 33, 13, 1, 0, 0, 0, NULL, 1),
(47, 3, 24, 1, 2, 0, 0, 0, NULL, 1),
(48, 3, 25, 2, 2, 0, 0, 0, NULL, 1),
(49, 3, 26, 2, 2, 1, 0, 0, NULL, 1),
(50, 3, 27, 2, 2, 2, 0, 0, NULL, 1),
(51, 3, 28, 2, 2, 3, 0, 0, NULL, 1),
(52, 3, 29, 3, 2, 0, 0, 0, NULL, 1),
(53, 3, 7, 4, 2, 0, 0, 0, NULL, 1),
(54, 3, 8, 4, 2, 1, 0, 0, NULL, 1),
(55, 3, 9, 4, 2, 2, 0, 0, NULL, 1),
(56, 3, 10, 5, 2, 0, 0, 0, NULL, 1),
(57, 3, 11, 5, 2, 1, 0, 0, NULL, 1),
(58, 3, 12, 5, 2, 2, 0, 0, NULL, 1),
(59, 3, 13, 6, 4, 0, 0, 0, NULL, 1),
(60, 3, 14, 7, 4, 0, 0, 0, NULL, 1),
(61, 3, 30, 8, 2, 0, 0, 0, NULL, 1),
(62, 3, 16, 9, 2, 0, 0, 0, NULL, 1),
(63, 3, 17, 9, 2, 1, 0, 0, NULL, 1),
(64, 3, 18, 9, 2, 2, 0, 0, NULL, 1),
(65, 3, 19, 9, 2, 3, 0, 0, NULL, 1),
(66, 3, 34, 10, 1, 0, 0, 0, NULL, 1),
(67, 3, 35, 11, 1, 0, 0, 0, NULL, 1),
(68, 3, 36, 12, 1, 0, 0, 0, NULL, 1),
(69, 3, 37, 13, 1, 0, 0, 0, NULL, 1),
(70, 4, 38, 1, 1, 0, 0, 0, NULL, 1),
(71, 4, 39, 2, 1, 0, 0, 0, NULL, 1),
(72, 4, 40, 2, 1, 1, 0, 0, NULL, 1),
(73, 4, 41, 2, 1, 2, 0, 0, NULL, 1),
(74, 4, 42, 2, 1, 3, 0, 0, NULL, 1),
(75, 4, 29, 3, 1, 0, 0, 0, NULL, 1),
(76, 4, 7, 4, 1, 0, 0, 0, NULL, 1),
(77, 4, 8, 4, 1, 1, 0, 0, NULL, 1),
(78, 4, 9, 4, 1, 2, 0, 0, NULL, 1),
(79, 4, 10, 5, 1, 0, 0, 0, NULL, 1),
(80, 4, 11, 5, 1, 1, 0, 0, NULL, 1),
(81, 4, 12, 5, 1, 2, 0, 0, NULL, 1),
(82, 4, 13, 6, 2, 0, 0, 0, NULL, 1),
(83, 4, 14, 7, 2, 0, 0, 0, NULL, 1),
(84, 4, 43, 8, 1, 0, 0, 0, NULL, 1),
(85, 4, 16, 9, 2, 0, 0, 0, NULL, 1),
(86, 4, 17, 9, 2, 1, 0, 0, NULL, 1),
(87, 4, 18, 9, 2, 2, 0, 0, NULL, 1),
(88, 4, 19, 9, 2, 3, 0, 0, NULL, 1),
(89, 4, 44, 10, 1, 0, 0, 0, NULL, 1),
(90, 4, 45, 11, 1, 0, 0, 0, NULL, 1),
(91, 4, 46, 12, 1, 0, 0, 0, NULL, 1),
(92, 4, 47, 13, 1, 0, 0, 0, NULL, 1),
(93, 5, 48, 1, 1, 0, 0, 0, NULL, 1),
(94, 5, 49, 2, 1, 0, 0, 0, NULL, 1),
(95, 5, 50, 2, 1, 1, 0, 0, NULL, 1),
(96, 5, 51, 2, 1, 2, 0, 0, NULL, 1),
(97, 5, 52, 2, 1, 3, 0, 0, NULL, 1),
(98, 5, 53, 2, 1, 4, 0, 0, NULL, 1),
(99, 5, 54, 3, 1, 0, 0, 0, NULL, 1),
(100, 5, 7, 4, 1, 0, 0, 0, NULL, 1),
(101, 5, 8, 4, 1, 1, 0, 0, NULL, 1),
(102, 5, 9, 4, 1, 2, 0, 0, NULL, 1),
(103, 5, 10, 5, 1, 0, 0, 0, NULL, 1),
(104, 5, 11, 5, 1, 1, 0, 0, NULL, 1),
(105, 5, 12, 5, 1, 2, 0, 0, NULL, 1),
(106, 5, 13, 6, 2, 0, 0, 0, NULL, 1),
(107, 5, 14, 7, 2, 0, 0, 0, NULL, 1),
(108, 5, 55, 8, 1, 0, 0, 0, NULL, 1),
(109, 5, 16, 9, 2, 0, 0, 0, NULL, 1),
(110, 5, 17, 9, 2, 1, 0, 0, NULL, 1),
(111, 5, 18, 9, 2, 2, 0, 0, NULL, 1),
(112, 5, 19, 9, 2, 3, 0, 0, NULL, 1),
(113, 5, 56, 10, 1, 0, 0, 0, NULL, 1),
(114, 5, 57, 11, 1, 0, 0, 0, NULL, 1),
(115, 5, 58, 12, 1, 0, 0, 0, NULL, 1),
(116, 5, 59, 13, 1, 0, 0, 0, NULL, 1),
(117, 6, 60, 1, 1, 0, 0, 0, NULL, 1),
(118, 6, 61, 2, 1, 0, 0, 0, NULL, 1),
(119, 6, 62, 2, 1, 1, 0, 0, NULL, 1),
(120, 6, 63, 2, 1, 2, 0, 0, NULL, 1),
(121, 6, 64, 2, 1, 3, 0, 0, NULL, 1),
(122, 6, 65, 2, 1, 4, 0, 0, NULL, 1),
(123, 6, 66, 3, 1, 0, 0, 0, NULL, 1),
(124, 6, 7, 4, 1, 0, 0, 0, NULL, 1),
(125, 6, 8, 4, 1, 1, 0, 0, NULL, 1),
(126, 6, 9, 4, 1, 2, 0, 0, NULL, 1),
(127, 6, 10, 5, 1, 0, 0, 0, NULL, 1),
(128, 6, 11, 5, 1, 1, 0, 0, NULL, 1),
(129, 6, 12, 5, 1, 2, 0, 0, NULL, 1),
(130, 6, 13, 6, 2, 0, 0, 0, NULL, 1),
(131, 6, 14, 7, 2, 0, 0, 0, NULL, 1),
(132, 6, 67, 8, 1, 0, 0, 0, NULL, 1),
(133, 6, 16, 9, 2, 0, 0, 0, NULL, 1),
(134, 6, 17, 9, 2, 1, 0, 0, NULL, 1),
(135, 6, 18, 9, 2, 2, 0, 0, NULL, 1),
(136, 6, 19, 9, 2, 3, 0, 0, NULL, 1),
(137, 6, 68, 10, 1, 0, 0, 0, NULL, 1),
(138, 6, 69, 11, 1, 0, 0, 0, NULL, 1),
(139, 6, 70, 12, 1, 0, 0, 0, NULL, 1),
(140, 6, 71, 13, 1, 0, 0, 0, NULL, 1),
(145, 16, 77, 1, 1, 0, 0, 0, NULL, 1),
(146, 16, 78, 2, 1, 0, 0, 0, NULL, 1),
(147, 17, 79, 1, 1, 0, 0, 0, NULL, 1),
(148, 17, 80, 1, 1, 1, 0, 0, NULL, 1),
(149, 17, 81, 1, 1, 2, 0, 0, NULL, 1),
(150, 17, 82, 1, 1, 3, 0, 0, NULL, 1),
(151, 17, 83, 2, 2, 0, 0, 0, NULL, 1),
(152, 17, 84, 2, 2, 1, 0, 0, NULL, 1),
(153, 17, 85, 3, 1, 0, 0, 0, NULL, 1),
(154, 18, 86, 1, 1, 0, 0, 0, NULL, 1),
(155, 18, 87, 2, 1, 0, 0, 0, NULL, 1),
(156, 18, 88, 3, 1, 0, 0, 0, NULL, 1),
(157, 18, 89, 4, 1, 0, 0, 0, NULL, 1),
(158, 19, 90, 1, 1, 0, 0, 0, NULL, 1),
(159, 20, 91, 1, 1, 0, 0, 0, NULL, 1),
(160, 20, 92, 2, 1, 0, 0, 0, NULL, 1),
(161, 20, 93, 3, 1, 0, 0, 0, NULL, 1),
(162, 20, 94, 1, 1, 1, 0, 0, NULL, 1),
(163, 20, 95, 1, 1, 2, 0, 0, NULL, 1),
(164, 21, 96, 1, 1, 0, 0, 0, NULL, 1),
(165, 21, 97, 2, 1, 0, 0, 0, NULL, 1);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `material_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `plan_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `section_materials`
--
ALTER TABLE `section_materials`
  MODIFY `section_material_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
