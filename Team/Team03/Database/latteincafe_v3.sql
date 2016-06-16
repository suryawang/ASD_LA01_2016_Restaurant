-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16 Jun 2016 pada 15.17
-- Versi Server: 10.1.10-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `latteincafe_v3`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredients_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `expire_date` datetime NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `status_order` varchar(45) DEFAULT NULL,
  `order_datetime` datetime DEFAULT NULL,
  `user_user_id` int(11) NOT NULL,
  `print_bill` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `order`
--

INSERT INTO `order` (`order_id`, `status_order`, `order_datetime`, `user_user_id`, `print_bill`) VALUES
(1, 'Transaction Completed', '2016-06-16 10:34:55', 7, 1),
(2, 'Transaction Completed', '2016-06-16 10:35:28', 8, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_order_id` int(11) NOT NULL,
  `product_product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_order_id`, `product_product_id`, `qty`) VALUES
(1, 1, 3, 3),
(2, 2, 4, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `type` varchar(45) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `qty` int(11) NOT NULL,
  `img` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`product_id`, `name`, `price`, `type`, `availability`, `qty`, `img`, `duration`) VALUES
(1, 'Luwak Coffe', 48000, 'Drink', 1, 15, 'LuwakCoffe.jpg', '3 minutes'),
(2, 'Cappucino', 46000, 'Drink', 1, 40, 'Cappucino.jpg', '3 minutes'),
(3, 'Mochacino', 60000, 'Drink', 1, 30, 'Mochacino.jpg', '4 minutes'),
(4, 'Blended Capucino with Oreo', 55000, 'Drink', 1, 10, 'BlendedCapucino withOreo.jpg', '5 minutes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `recipe`
--

CREATE TABLE `recipe` (
  `recipe_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `product_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `recipe`
--

INSERT INTO `recipe` (`recipe_id`, `name`, `product_product_id`) VALUES
(1, 'Luwak Coffe', 1),
(2, 'Cappucino', 2),
(3, 'Mochacino', 3),
(4, 'Blended Cappucino with Oreo', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `recipe_detail`
--

CREATE TABLE `recipe_detail` (
  `recipe_detail_id` int(11) NOT NULL,
  `recipe_recipe_id` int(11) NOT NULL,
  `ingredients_ingredients_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `request_bill`
--

CREATE TABLE `request_bill` (
  `request_bill_id` int(11) NOT NULL,
  `order_order_id` int(11) NOT NULL,
  `order_user_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_item`
--

CREATE TABLE `review_item` (
  `review_item_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `message` text NOT NULL,
  `user_user_id` int(11) NOT NULL,
  `product_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `review_item`
--

INSERT INTO `review_item` (`review_item_id`, `rating`, `message`, `user_user_id`, `product_product_id`) VALUES
(1, 5, 'Rasanya enak, perpaduannya juga pas...', 7, 3),
(2, 5, 'Rasanya enak juga ya, unik juga ini menunya jarang ada di tempat lain.', 8, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_restaurant`
--

CREATE TABLE `review_restaurant` (
  `review_restaurant_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `message` text NOT NULL,
  `user_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `review_restaurant`
--

INSERT INTO `review_restaurant` (`review_restaurant_id`, `rating`, `message`, `user_user_id`) VALUES
(1, 5, 'Mantap nih tempatnya, nyaman dan suasananya tenang.', 7),
(2, 4, 'Suasananya udah enak sih, cuman ACnya kedinginan nih hahaha...', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`role_id`, `name`) VALUES
(1, 'owner'),
(2, 'custommer'),
(3, 'cheff'),
(4, 'cashier');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `role_role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `email`, `role_role_id`) VALUES
(1, 'RezaArinanda', 'e030239b362a785b419792f7ee1d6d58', 'arinanda.reza@yahoo.co.id', 1),
(2, 'Owner', 'b6f4a2ec6356bbd56d49f2096bf9d3d3', 'owner@latteincafe.com', 1),
(3, 'Cashier', 'e7f85ad205399503a678592df8aadeb1', 'cashier@latteincafe.conm', 4),
(4, 'Cheff', '20e6a110c54372381d785c3eb27f62bc', 'cheff@latteincafe.com', 3),
(5, 'Custommer', 'cdd3c7be1273de8c59d2f2a0842545e5', 'custommer@latteincafe.com', 2),
(6, 'Edmundus', '34516f09305d960cdada459feca6d3be', 'valinedmundus@gmail.com', 2),
(7, 'JessicaVania', 'c3c8f7a7e604a7e602cd4e8f0a8d31b9', 'jeje@jkt48.com', 2),
(8, 'MariaDesy', 'b4c025e028aa1f3617990e910cca29dc', 'desy@jkt48.com', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredients_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`,`user_user_id`),
  ADD KEY `fk_order_user1_idx` (`user_user_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_id_2` (`order_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`,`order_order_id`,`product_product_id`),
  ADD KEY `fk_order_detail_order1_idx` (`order_order_id`),
  ADD KEY `fk_order_detail_product1_idx` (`product_product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipe_id`,`product_product_id`),
  ADD KEY `fk_recipe_product1_idx` (`product_product_id`);

--
-- Indexes for table `recipe_detail`
--
ALTER TABLE `recipe_detail`
  ADD PRIMARY KEY (`recipe_detail_id`,`recipe_recipe_id`,`ingredients_ingredients_id`),
  ADD KEY `fk_recipe_detail_recipe1_idx` (`recipe_recipe_id`),
  ADD KEY `fk_recipe_detail_ingredients1_idx` (`ingredients_ingredients_id`);

--
-- Indexes for table `request_bill`
--
ALTER TABLE `request_bill`
  ADD PRIMARY KEY (`request_bill_id`,`order_order_id`,`order_user_user_id`),
  ADD KEY `fk_request_bill_order1_idx` (`order_order_id`,`order_user_user_id`);

--
-- Indexes for table `review_item`
--
ALTER TABLE `review_item`
  ADD PRIMARY KEY (`review_item_id`,`user_user_id`,`product_product_id`),
  ADD KEY `fk_review_item_user1_idx` (`user_user_id`),
  ADD KEY `fk_review_item_product1_idx` (`product_product_id`);

--
-- Indexes for table `review_restaurant`
--
ALTER TABLE `review_restaurant`
  ADD PRIMARY KEY (`review_restaurant_id`,`user_user_id`),
  ADD KEY `fk_review_restaurant_user1_idx` (`user_user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`,`role_role_id`),
  ADD KEY `fk_user_role1_idx` (`role_role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredients_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `recipe_detail`
--
ALTER TABLE `recipe_detail`
  MODIFY `recipe_detail_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `request_bill`
--
ALTER TABLE `request_bill`
  MODIFY `request_bill_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `review_item`
--
ALTER TABLE `review_item`
  MODIFY `review_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `review_restaurant`
--
ALTER TABLE `review_restaurant`
  MODIFY `review_restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `fk_order_detail_order1` FOREIGN KEY (`order_order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_detail_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `fk_recipe_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `recipe_detail`
--
ALTER TABLE `recipe_detail`
  ADD CONSTRAINT `fk_recipe_detail_ingredients1` FOREIGN KEY (`ingredients_ingredients_id`) REFERENCES `ingredients` (`ingredients_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_recipe_detail_recipe1` FOREIGN KEY (`recipe_recipe_id`) REFERENCES `recipe` (`recipe_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `request_bill`
--
ALTER TABLE `request_bill`
  ADD CONSTRAINT `fk_request_bill_order1` FOREIGN KEY (`order_order_id`,`order_user_user_id`) REFERENCES `order` (`order_id`, `user_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `review_item`
--
ALTER TABLE `review_item`
  ADD CONSTRAINT `fk_review_item_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_review_item_user1` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `review_restaurant`
--
ALTER TABLE `review_restaurant`
  ADD CONSTRAINT `fk_review_restaurant_user1` FOREIGN KEY (`user_user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
