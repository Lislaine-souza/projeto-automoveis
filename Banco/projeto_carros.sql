-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30-Nov-2020 às 03:11
-- Versão do servidor: 5.7.17
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projeto_carros`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `COD_MARCA` int(11) NOT NULL,
  `DESCRICAO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `marca`
--

INSERT INTO `marca` (`COD_MARCA`, `DESCRICAO`) VALUES
(1, 'CHEVROLET'),
(2, 'PEUGEOT 2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo`
--

CREATE TABLE `modelo` (
  `COD_MODELO` int(11) NOT NULL,
  `DESCRICAO` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `modelo`
--

INSERT INTO `modelo` (`COD_MODELO`, `DESCRICAO`) VALUES
(1, 'Utilitario'),
(2, 'SUV');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(5) NOT NULL,
  `nome` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `sobrenome` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `usuario` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `senha` varchar(32) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `info` text COLLATE latin1_general_ci NOT NULL,
  `nivel_usuario` enum('0','1','2') COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `dta_cadastro` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dta_ultimo_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ativado` enum('0','1') COLLATE latin1_general_ci NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `nome`, `sobrenome`, `email`, `usuario`, `senha`, `info`, `nivel_usuario`, `dta_cadastro`, `dta_ultimo_login`, `ativado`) VALUES
(1, 'Lislaine', 'de souza lima', 'lislaine@gmail.com', 'lis', '123', 'sadasdasdas', '0', '2020-11-16 00:00:00', '2020-11-16 00:00:00', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `COD_VEICULO` int(11) NOT NULL,
  `NOME` varchar(50) DEFAULT NULL,
  `NUMERO` int(11) DEFAULT NULL,
  `ANO_FABRICACAO` date DEFAULT NULL,
  `ANO_MODELO` date DEFAULT NULL,
  `PRECO_TABELA` decimal(10,2) DEFAULT NULL,
  `PRECO_VENDA` decimal(10,2) DEFAULT NULL,
  `COD_MARCA` int(11) NOT NULL,
  `COD_MODELO` int(11) NOT NULL,
  `FOTO_VEICULO` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `veiculos`
--

INSERT INTO `veiculos` (`COD_VEICULO`, `NOME`, `NUMERO`, `ANO_FABRICACAO`, `ANO_MODELO`, `PRECO_TABELA`, `PRECO_VENDA`, `COD_MARCA`, `COD_MODELO`, `FOTO_VEICULO`) VALUES
(1, 'vectra', 123, '2000-11-03', '2020-01-17', '25.00', '25.00', 1, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`COD_MARCA`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`COD_MODELO`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indexes for table `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`COD_VEICULO`),
  ADD KEY `COD_MARCA` (`COD_MARCA`),
  ADD KEY `COD_MODELO` (`COD_MODELO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD CONSTRAINT `VEICULOS_ibfk_1` FOREIGN KEY (`COD_MARCA`) REFERENCES `marca` (`COD_MARCA`),
  ADD CONSTRAINT `VEICULOS_ibfk_2` FOREIGN KEY (`COD_MODELO`) REFERENCES `modelo` (`COD_MODELO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
