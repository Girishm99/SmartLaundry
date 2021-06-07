-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 26, 2020 at 06:04 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `smartlaundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `admin_id` int(11) NOT NULL auto_increment,
  `admin_name` varchar(30) default NULL,
  `admin_email` varchar(30) default NULL,
  `admin_password` varchar(15) default NULL,
  PRIMARY KEY  (`admin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

--
-- Dumping data for table `admin_details`
--



-- --------------------------------------------------------

--
-- Table structure for table `cloth_category`
--

CREATE TABLE `cloth_category` (
  `cc_id` int(11) NOT NULL auto_increment,
  `cc_name` varchar(100) default NULL,
  `laundry_price` decimal(60,2) default NULL,
  `iron_rate` decimal(60,2) default NULL,
  PRIMARY KEY  (`cc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

--
-- Dumping data for table `cloth_category`
--



-- --------------------------------------------------------

--
-- Table structure for table `cloth_detail`
--

CREATE TABLE `cloth_detail` (
  `cloth_id` int(11) NOT NULL auto_increment,
  `cc_id` int(11) default NULL,
  `cloth_name` varchar(100) default NULL,
  PRIMARY KEY  (`cloth_id`),
  KEY `cc_id` (`cc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cloth_detail`
--



-- --------------------------------------------------------

--
-- Table structure for table `cust_detail`
--

CREATE TABLE `cust_detail` (
  `cust_id` int(11) NOT NULL auto_increment,
  `cust_name` varchar(50) default NULL,
  `cust_contact` varchar(10) default NULL,
  `cust_email` varchar(40) default NULL,
  `cust_location` varchar(40) default NULL,
  `cust_bldg_soc` varchar(100) default NULL,
  `room_flat_no` varchar(40) default NULL,
  `cust_password` varchar(40) default NULL,
  PRIMARY KEY  (`cust_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cust_detail`
--



-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `f_id` int(11) NOT NULL auto_increment,
  `f_name` varchar(100) default NULL,
  `f_email` varchar(100) default NULL,
  `f_message` varchar(500) default NULL,
  PRIMARY KEY  (`f_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `feedback`
--



-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL auto_increment,
  `cust_id` int(11) default NULL,
  `cc_id` int(11) default NULL,
  `order_date` varchar(100) default NULL,
  `cloth_qty` varchar(50) default NULL,
  `cloth_name` varchar(50) default NULL,
  `payment_mode` varchar(50) default NULL,
  `order_status` varchar(50) default 'Confirmed',
  `total_amount` decimal(65,2) default NULL,
  `pick_up_time` time default NULL,
  `delivery_time` time default NULL,
  `pick_up_date` date default NULL,
  `delivery_date` date default NULL,
  PRIMARY KEY  (`order_id`),
  KEY `cust_id` (`cust_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `orders`
--



-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `od_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL,
  `cloth_id` int(11) default NULL,
  PRIMARY KEY  (`od_id`),
  KEY `order_id` (`order_id`),
  KEY `cloth_id` (`cloth_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `order_detail`
--



--
-- Constraints for dumped tables
--

--
-- Constraints for table `cloth_detail`
--
ALTER TABLE `cloth_detail`
  ADD CONSTRAINT `cloth_detail_ibfk_1` FOREIGN KEY (`cc_id`) REFERENCES `cloth_category` (`cc_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `cust_detail` (`cust_id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`cloth_id`) REFERENCES `cloth_detail` (`cloth_id`);
