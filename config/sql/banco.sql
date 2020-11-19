-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Nov-2020 às 03:59
-- Versão do servidor: 10.1.35-MariaDB
-- versão do PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trabalho_labbd`
--
CREATE DATABASE IF NOT EXISTS `trabalho_labbd` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `trabalho_labbd`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `descricao`) VALUES
(1, 'Eletrônicos', 'Produtos eletrônicos no geral'),
(2, 'Celulares', 'Smartphones em geral');

--
-- Acionadores `categorias`
--
DROP TRIGGER IF EXISTS `logs_delete_categorias`;
DELIMITER $$
CREATE TRIGGER `logs_delete_categorias` AFTER DELETE ON `categorias` FOR EACH ROW BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '"}'));
	SET @new_data = NULL;

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'categorias'
    	AND id_item_modif = OLD.id AND action = 'delete' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'categorias', @old_data, @new_data, now());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `logs_update_categorias`;
DELIMITER $$
CREATE TRIGGER `logs_update_categorias` AFTER UPDATE ON `categorias` FOR EACH ROW BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '"}'));
	SET @new_data = (CONCAT('{"id":', NEW.id, ',"nome":"', NEW.nome, '",', '"descricao":"', NEW.descricao, '"}'));

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'categorias'
    	AND id_item_modif = OLD.id AND action = 'update' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'categorias', @old_data, @new_data, now());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias_produtos`
--

DROP TABLE IF EXISTS `categorias_produtos`;
CREATE TABLE `categorias_produtos` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `categorias_produtos`
--

INSERT INTO `categorias_produtos` (`id`, `categoria_id`, `produto_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 1, 4),
(8, 2, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `table_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `old_data` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new_data` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `logs`
--

INSERT INTO `logs` (`id`, `usuario_id`, `table_name`, `old_data`, `new_data`, `created`) VALUES
(1, 2, 'categorias', '{\"id\":1,\"nome\":\"Eletrônico\",\"descricao\":\"Produtos eletrônicos n geral\"}', '{\"id\":1,\"nome\":\"Eletrônicos\",\"descricao\":\"Produtos eletrônicos no geral\"}', '2020-11-17 02:51:49'),
(2, 2, 'categorias', '{\"id\":1,\"nome\":\"Eletrônicos\",\"descricao\":\"Produtos eletrônicos no geral\"}', '{\"id\":1,\"nome\":\"Eletrônicos\",\"descricao\":\"Produtos eletrônicos em geral\"}', '2020-11-17 02:53:25'),
(3, 2, 'categorias', '{\"id\":1,\"nome\":\"Eletrônicos\",\"descricao\":\"Produtos eletrônicos em geral\"}', '{\"id\":1,\"nome\":\"Eletrônico\",\"descricao\":\"Produtos eletrônicos em geral\"}', '2020-11-17 20:52:01'),
(4, 2, 'categorias', '{\"id\":1,\"nome\":\"Eletrônico\",\"descricao\":\"Produtos eletrônicos em geral\"}', NULL, '2020-11-17 21:13:12'),
(5, 2, 'produtos', '{\"id\":1,\"nome\":\"J7\",\"descricao\":\"Samsung J7 Prime\",\"imagem\":\"j7.png\",\"preco\":950,\"loja_id\":2}', '{\"id\":1,\"nome\":\"J7\",\"descricao\":\"Samsung J7 Prime\",\"imagem\":\"j7.png\",\"preco\":980,\"loja_id\":2}', '2020-11-17 21:50:40'),
(6, 2, 'usuarios', '{\"id\":1,\"nome\":\"Felipe Soupinski\",\"email\":\"felipe@gmail.com\"}', '{\"id\":1,\"nome\":\"Felipe\",\"email\":\"felipe@gmail.com\"}', '2020-11-18 20:48:57'),
(7, 2, 'usuarios', '{\"id\":3,\"nome\":\"Ana\",\"email\":\"ana@gmail.com\"}', NULL, '2020-11-18 21:00:14'),
(8, 2, 'lojas', '{\"id\":1,\"nome\":\"Loja do Felipe\",\"descricao\":\"Esta é a loja do Felipe\",\"usuario_id\":1}', '{\"id\":1,\"nome\":\"Loja do Felipe\",\"descricao\":\"Esta é uma loja do Felipe\",\"usuario_id\":1}', '2020-11-18 21:05:48'),
(9, 2, 'pagamentos', '{\"id\":1,\"valor\":1000,\"forma\":\"dinheiro\",\"loja_id\":2}', '{\"id\":1,\"valor\":900,\"forma\":\"dinheiro\",\"loja_id\":2}', '2020-11-18 21:11:54'),
(10, 2, 'pagamentos', '{\"id\":1,\"valor\":900,\"forma\":\"dinheiro\",\"loja_id\":2}', '{\"id\":1,\"valor\":900,\"forma\":\"dinheiro\",\"loja_id\":1}', '2020-11-19 02:46:28'),
(11, 2, 'produtos', '{\"id\":3,\"nome\":\"6A\",\"descricao\":\"Xiaomi 6A\",\"imagem\":\"6a.png\",\"preco\":600,\"loja_id\":3}', '{\"id\":3,\"nome\":\"6A\",\"descricao\":\"Xiaomi 6A\",\"imagem\":\"6a.png\",\"preco\":600,\"loja_id\":2}', '2020-11-19 02:54:25'),
(12, 2, 'produtos', '{\"id\":4,\"nome\":\"iPhone X\",\"descricao\":\"Vendi minha casa e comprei um iPhone X\",\"imagem\":\"x.jpg\",\"preco\":50000,\"loja_id\":2}', '{\"id\":4,\"nome\":\"iPhone X\",\"descricao\":\"Vendi minha casa e comprei um iPhone X\",\"imagem\":\"x.jpg\",\"preco\":50000,\"loja_id\":1}', '2020-11-19 02:54:38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `lojas`
--

DROP TABLE IF EXISTS `lojas`;
CREATE TABLE `lojas` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `lojas`
--

INSERT INTO `lojas` (`id`, `nome`, `descricao`, `usuario_id`, `created`, `modified`) VALUES
(1, 'Loja do Felipe', 'Esta é uma loja do Felipe', 1, '2020-11-13 02:26:45', '2020-11-18 21:05:48'),
(2, 'Loja da Ana', 'Loja da Ana', 3, '2020-11-13 03:19:54', '2020-11-13 03:19:54'),
(3, 'Loja do Breno', 'Essa é a Loja do batman', 2, '2020-11-19 02:44:21', '2020-11-19 02:44:21'),
(4, 'Loja do Ryan', 'Esta é a Loja do Ryan', 4, '2020-11-19 02:44:56', '2020-11-19 02:44:56');

--
-- Acionadores `lojas`
--
DROP TRIGGER IF EXISTS `logs_delete_lojas`;
DELIMITER $$
CREATE TRIGGER `logs_delete_lojas` AFTER DELETE ON `lojas` FOR EACH ROW BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '",', '"usuario_id":', OLD.usuario_id, '}'));
	SET @new_data = NULL;

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'lojas'
    	AND id_item_modif = OLD.id AND action = 'delete' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'lojas', @old_data, @new_data, now());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `logs_update_lojas`;
DELIMITER $$
CREATE TRIGGER `logs_update_lojas` AFTER UPDATE ON `lojas` FOR EACH ROW BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '",', '"usuario_id":', OLD.usuario_id, '}'));
	SET @new_data = (CONCAT('{"id":', NEW.id, ',"nome":"', NEW.nome, '",', '"descricao":"', NEW.descricao, '",', '"usuario_id":', NEW.usuario_id, '}'));

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'lojas'
    	AND id_item_modif = OLD.id AND action = 'update' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'lojas', @old_data, @new_data, now());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
CREATE TABLE `pagamentos` (
  `id` int(11) NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `forma` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `loja_id` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `pagamentos`
--

INSERT INTO `pagamentos` (`id`, `valor`, `forma`, `loja_id`, `created`) VALUES
(1, '900', 'dinheiro', 1, '2020-11-18 21:11:27'),
(2, '500', 'débito', 3, '2020-11-19 02:48:41'),
(3, '1200', 'crédito', 4, '2020-11-19 02:49:10');

--
-- Acionadores `pagamentos`
--
DROP TRIGGER IF EXISTS `logs_delete_pagamentos`;
DELIMITER $$
CREATE TRIGGER `logs_delete_pagamentos` AFTER DELETE ON `pagamentos` FOR EACH ROW BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"valor":', OLD.valor, ',', '"forma":"', OLD.forma, '",', '"loja_id":', OLD.loja_id, '}'));
	SET @new_data = NULL;

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'pagamentos'
    	AND id_item_modif = OLD.id AND action = 'delete' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'pagamentos', @old_data, @new_data, now());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `logs_update_pagamentos`;
DELIMITER $$
CREATE TRIGGER `logs_update_pagamentos` AFTER UPDATE ON `pagamentos` FOR EACH ROW BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"valor":', OLD.valor, ',', '"forma":"', OLD.forma, '",', '"loja_id":', OLD.loja_id, '}'));
	SET @new_data = (CONCAT('{"id":', NEW.id, ',"valor":', NEW.valor, ',', '"forma":"', NEW.forma, '",', '"loja_id":', NEW.loja_id, '}'));

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'pagamentos'
    	AND id_item_modif = OLD.id AND action = 'update' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'pagamentos', @old_data, @new_data, now());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imagem` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preco` decimal(10,0) NOT NULL,
  `loja_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `imagem`, `preco`, `loja_id`, `created`, `modified`) VALUES
(1, 'J7', 'Samsung J7 Prime', 'j7.png', '980', 2, '2020-11-17 01:01:44', '2020-11-17 21:50:40'),
(2, 'J5', 'Samsung J5 Prime', 'j5.png', '500', NULL, '2020-11-19 02:25:21', '2020-11-19 02:25:21'),
(3, '6A', 'Xiaomi 6A', '6a.png', '600', 2, '2020-11-19 02:50:24', '2020-11-19 02:54:25'),
(4, 'iPhone X', 'Vendi minha casa e comprei um iPhone X', 'x.jpg', '50000', 1, '2020-11-19 02:53:50', '2020-11-19 02:54:38');

--
-- Acionadores `produtos`
--
DROP TRIGGER IF EXISTS `logs_delete_produtos`;
DELIMITER $$
CREATE TRIGGER `logs_delete_produtos` AFTER DELETE ON `produtos` FOR EACH ROW BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '",', '"imagem":"', OLD.imagem, '",', '"preco":', OLD.preco, ',', '"loja_id":', OLD.loja_id, '}'));
	SET @new_data = NULL;

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'produtos'
    	AND id_item_modif = OLD.id AND action = 'delete' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'produtos', @old_data, @new_data, now());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `logs_update_produtos`;
DELIMITER $$
CREATE TRIGGER `logs_update_produtos` AFTER UPDATE ON `produtos` FOR EACH ROW BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"descricao":"', OLD.descricao, '",', '"imagem":"', OLD.imagem, '",', '"preco":', OLD.preco, ',', '"loja_id":', OLD.loja_id, '}'));
	SET @new_data = (CONCAT('{"id":', NEW.id, ',"nome":"', NEW.nome, '",', '"descricao":"', NEW.descricao, '",', '"imagem":"', NEW.imagem, '",', '"preco":', NEW.preco, ',', '"loja_id":', NEW.loja_id, '}'));

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'produtos'
    	AND id_item_modif = OLD.id AND action = 'update' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'produtos', @old_data, @new_data, now());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `created`, `modified`) VALUES
(1, 'Felipe', 'felipe@gmail.com', '$2y$10$3prWSOZjvqRguuz4Vz7Gwup9IPaaybNpWpXqejZkfkdNOq2hHdADa', '2020-11-13 02:25:01', '2020-11-18 20:48:57'),
(2, 'Breno', 'batman@gmail.com', '$2y$10$ur2h2UMacQ.qtfIOVgPj6Oge7AQjLnRpyH4PfS0MdUD097yZgpX86', '2020-11-13 02:54:41', '2020-11-13 02:54:41'),
(4, 'Ryan', 'ryan@gmail.com', '$2y$10$L07tuBBZDzNIXkKZyIsY7uIohf5JV0DR/LF906d1yVXBVT9qtJwdu', '2020-11-19 02:43:27', '2020-11-19 02:43:27');

--
-- Acionadores `usuarios`
--
DROP TRIGGER IF EXISTS `logs_delete_usuarios`;
DELIMITER $$
CREATE TRIGGER `logs_delete_usuarios` AFTER DELETE ON `usuarios` FOR EACH ROW BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"email":"', OLD.email, '"}'));
	SET @new_data = NULL;

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'usuarios'
    	AND id_item_modif = OLD.id AND action = 'delete' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'usuarios', @old_data, @new_data, now());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `logs_update_usuarios`;
DELIMITER $$
CREATE TRIGGER `logs_update_usuarios` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
	SET @id = (select (max(id) + 1) from logs);
	SET @old_data = (CONCAT('{"id":', OLD.id, ',"nome":"', OLD.nome, '",', '"email":"', OLD.email, '"}'));
	SET @new_data = (CONCAT('{"id":', NEW.id, ',"nome":"', NEW.nome, '",', '"email":"', NEW.email, '"}'));

	SELECT usuario_id INTO @user_id FROM usuarios_actions u WHERE u.table_name = 'usuarios'
    	AND id_item_modif = OLD.id AND action = 'update' ORDER BY created DESC LIMIT 1;
		 
	INSERT INTO logs VALUES (@id, @user_id, 'usuarios', @old_data, @new_data, now());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_actions`
--

DROP TABLE IF EXISTS `usuarios_actions`;
CREATE TABLE `usuarios_actions` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `table_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_item_modif` int(11) NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `usuarios_actions`
--

INSERT INTO `usuarios_actions` (`id`, `usuario_id`, `table_name`, `id_item_modif`, `action`, `created`) VALUES
(1, 2, 'produtos', 0, 'update', '2020-11-17 01:06:19'),
(2, 2, 'produtos', 1, 'update', '2020-11-17 01:30:19'),
(3, 2, 'categorias', 1, 'update', '2020-11-17 02:15:48'),
(4, 2, 'categorias', 1, 'update', '2020-11-17 02:34:51'),
(5, 2, 'categorias', 1, 'update', '2020-11-17 02:37:38'),
(6, 2, 'categorias', 1, 'update', '2020-11-17 02:39:41'),
(7, 2, 'categorias', 1, 'update', '2020-11-17 02:41:32'),
(8, 2, 'categorias', 1, 'update', '2020-11-17 02:49:27'),
(9, 2, 'categorias', 1, 'update', '2020-11-17 02:51:48'),
(10, 2, 'categorias', 1, 'update', '2020-11-17 02:53:24'),
(11, 2, 'produtos', 1, 'update', '2020-11-17 20:51:13'),
(12, 2, 'categorias', 1, 'update', '2020-11-17 20:52:00'),
(13, 2, 'categorias', 1, 'delete', '2020-11-17 21:13:07'),
(14, 2, 'produtos', 1, 'update', '2020-11-17 21:41:55'),
(15, 2, 'produtos', 1, 'update', '2020-11-17 21:47:06'),
(16, 2, 'produtos', 1, 'update', '2020-11-17 21:50:39'),
(17, 2, 'usuarios', 1, 'update', '2020-11-18 20:48:56'),
(18, 2, 'usuarios', 3, 'delete', '2020-11-18 21:00:13'),
(19, 2, 'lojas', 1, 'update', '2020-11-18 21:04:57'),
(20, 2, 'lojas', 1, 'update', '2020-11-18 21:05:48'),
(21, 2, 'pagamentos', 1, 'update', '2020-11-18 21:11:53'),
(22, 2, 'pagamentos', 1, 'update', '2020-11-19 02:46:26'),
(23, 2, 'produtos', 3, 'update', '2020-11-19 02:54:25'),
(24, 2, 'produtos', 4, 'update', '2020-11-19 02:54:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorias_produtos`
--
ALTER TABLE `categorias_produtos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lojas`
--
ALTER TABLE `lojas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios_actions`
--
ALTER TABLE `usuarios_actions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categorias_produtos`
--
ALTER TABLE `categorias_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lojas`
--
ALTER TABLE `lojas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuarios_actions`
--
ALTER TABLE `usuarios_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
