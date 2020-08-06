-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th8 06, 2020 lúc 02:16 AM
-- Phiên bản máy phục vụ: 8.0.18
-- Phiên bản PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `food_court`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `thanhtoangiohang` (`name` VARCHAR(20), `tongtien` INT)  BEGIN
declare gh int;
declare dh int;
select max(idgiohang)  into gh from giohang where username = name;
-- insert into donhang(idgiohang) values(gh);
insert into giohang(username) values(name);
select (idgiohang) into dh from donhang where idgiohang = gh;
update user set balance = balance - tongtien where username = name;
-- insert into xacnhan(idgiohang) values(dh);

    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `themspvaogiohang` (`id` INT, `amount` INT, `usrname` VARCHAR(45))  BEGIN
declare ht int;
declare giohang int;

select max(idgiohang)  into giohang from giohang where username = usrname;
 select soluong into ht from chonhang where idmon = id and idgiohang = giohang;
if (ht > 0) then update chonhang set soluong = soluong + amount where idmon = id and idgiohang = giohang;
else insert into chonhang(idmon, soluong, time, idgiohang)values( id, amount,DATE(NOW()), giohang);
end if;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baotri`
--

CREATE TABLE `baotri` (
  `idbaotri` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `thoigian` varchar(100) DEFAULT NULL,
  `trangthai` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `card`
--

CREATE TABLE `card` (
  `idcart` int(11) NOT NULL,
  `namecard` varchar(45) DEFAULT NULL,
  `bankname` varchar(45) DEFAULT NULL,
  `usernameowner` varchar(45) DEFAULT NULL,
  `timecreate` varchar(100) DEFAULT NULL,
  `idbankcard` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chonhang`
--

CREATE TABLE `chonhang` (
  `id` int(11) NOT NULL,
  `idmon` int(11) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `idgiohang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

CREATE TABLE `danhgia` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `donhang` varchar(45) DEFAULT NULL,
  `vendorname` varchar(45) DEFAULT NULL,
  `rate` varchar(45) DEFAULT NULL,
  `nhanxet` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `daubep`
--

CREATE TABLE `daubep` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `ngayvaolam` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trangthai` varchar(45) NOT NULL DEFAULT 'active',
  `ngaynghiviec` datetime DEFAULT NULL,
  `vendorowner` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) NOT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `time` varchar(100) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `idcard` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `idgiohang` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `in_menu` int(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL,
  `trash` int(11) NOT NULL DEFAULT '0',
  `vendorowner` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `idgiohang` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoantien`
--

CREATE TABLE `hoantien` (
  `id` int(11) NOT NULL,
  `tenvendor` varchar(45) NOT NULL,
  `iddonhang` int(11) NOT NULL,
  `vendorxacnhan` varchar(45) DEFAULT NULL,
  `lydo` varchar(100) DEFAULT NULL,
  `idfood` int(11) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lichsunaptienvendor`
--

CREATE TABLE `lichsunaptienvendor` (
  `id` int(11) NOT NULL,
  `tenquay` varchar(45) NOT NULL,
  `iddonhang` varchar(45) NOT NULL,
  `sotien` int(11) NOT NULL,
  `idfood` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu_foods`
--

CREATE TABLE `menu_foods` (
  `id` int(11) NOT NULL,
  `menuID` int(11) NOT NULL,
  `foodID` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `trash` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `ngayvaolam` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngaynghiviec` datetime DEFAULT NULL,
  `trangthai` varchar(45) NOT NULL DEFAULT 'active',
  `vendorowner` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thungan`
--

CREATE TABLE `thungan` (
  `idthungan` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `ngayvaolam` datetime NOT NULL,
  `ngaynghiviec` datetime DEFAULT NULL,
  `trangthai` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` text,
  `role` text,
  `phone` int(11) DEFAULT NULL,
  `ngaydk` text,
  `balance` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `tenquay` varchar(45) NOT NULL,
  `ngaytao` datetime NOT NULL,
  `ngaydong` datetime DEFAULT NULL,
  `trangthai` varchar(10) NOT NULL DEFAULT 'active',
  `adminthuchien` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vnpay`
--

CREATE TABLE `vnpay` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `transNo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `xacnhan`
--

CREATE TABLE `xacnhan` (
  `id` int(11) NOT NULL,
  `daubepxacnhan` varchar(45) DEFAULT NULL,
  `quayhangxacnhan` varchar(45) DEFAULT NULL,
  `timedaubepxacnhan` varchar(45) DEFAULT NULL,
  `timequayhangxacnhan` varchar(45) DEFAULT NULL,
  `idgiohang` varchar(45) DEFAULT NULL,
  `vendorname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `baotri`
--
ALTER TABLE `baotri`
  ADD PRIMARY KEY (`idbaotri`);

--
-- Chỉ mục cho bảng `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`idcart`);

--
-- Chỉ mục cho bảng `chonhang`
--
ALTER TABLE `chonhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `daubep`
--
ALTER TABLE `daubep`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Chỉ mục cho bảng `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`idgiohang`);

--
-- Chỉ mục cho bảng `hoantien`
--
ALTER TABLE `hoantien`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `lichsunaptienvendor`
--
ALTER TABLE `lichsunaptienvendor`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menu_foods`
--
ALTER TABLE `menu_foods`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Chỉ mục cho bảng `thungan`
--
ALTER TABLE `thungan`
  ADD PRIMARY KEY (`idthungan`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- Chỉ mục cho bảng `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `tenquay_UNIQUE` (`tenquay`);

--
-- Chỉ mục cho bảng `vnpay`
--
ALTER TABLE `vnpay`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `xacnhan`
--
ALTER TABLE `xacnhan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `baotri`
--
ALTER TABLE `baotri`
  MODIFY `idbaotri` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `card`
--
ALTER TABLE `card`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chonhang`
--
ALTER TABLE `chonhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `daubep`
--
ALTER TABLE `daubep`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `idgiohang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hoantien`
--
ALTER TABLE `hoantien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lichsunaptienvendor`
--
ALTER TABLE `lichsunaptienvendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menu_foods`
--
ALTER TABLE `menu_foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `thungan`
--
ALTER TABLE `thungan`
  MODIFY `idthungan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `vnpay`
--
ALTER TABLE `vnpay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `xacnhan`
--
ALTER TABLE `xacnhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

DELIMITER $$
--
-- Sự kiện
--
CREATE DEFINER=`root`@`localhost` EVENT `xxxEVENTxxx` ON SCHEDULE EVERY 1 DAY STARTS '2020-08-05 23:59:59' ON COMPLETION NOT PRESERVE ENABLE DO SET SQL_SAFE_UPDATES = 0$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
