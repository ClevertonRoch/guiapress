-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.31 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando estrutura para tabela guiapress.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela guiapress.articles: ~9 rows (aproximadamente)
INSERT INTO `articles` (`id`, `title`, `slug`, `body`, `createdAt`, `updatedAt`, `categoryId`) VALUES
	(3, 'Node.js para programadores PHP', 'Node.js-para-programadores-PHP', '<p>Este artigo mostra as principais diferen&ccedil;as entre programar em Node.js e PHP para ingressar com o p&eacute; direito na plataforma do ponto de vista de quem est&aacute; acostumado a trabalhar com PHP.</p>', '2023-03-09 15:28:17', '2023-03-09 15:28:17', 15),
	(4, 'Como criar um chat com Node.js', 'Como-criar-um-chat-com-Node.js', '<p>Veja nesse artigo como criar um chat completo com Node.js usando somente tecnologias front-end como jQuery, Socket.IO e WebSockets.</p>', '2023-03-09 15:28:35', '2023-03-09 15:28:35', 17),
	(5, 'CSS3 Animations: Criando animações com CSS', 'CSS3-Animations:-Criando-animacoes-com-CSS', '<p>Veja nesse artigo como criar diferentes tipos de anima&ccedil;&otilde;es utilizando apenas html e css.<br><br>Read more:&nbsp;<a href="http://www.linhadecodigo.com.br/css.aspx#ixzz7vUULwOiz">http://www.linhadecodigo.com.br/css.aspx#ixzz7vUULwOiz</a></p>', '2023-03-09 15:29:21', '2023-03-09 15:29:21', 14),
	(6, 'Por que alguns navegadores são mais rápidos que outros?', 'Por-que-alguns-navegadores-sao-mais-rapidos-que-outros', '<p>Entenda o porqu&ecirc; de alguns navegadores serem mais r&aacute;pidos que outros. Por exemplo, quais as especifica&ccedil;&otilde;es t&eacute;cnicas que fazem o Google Chrome consegue ser mais r&aacute;pido que o internet explorer.</p>', '2023-03-09 15:30:11', '2023-03-09 15:30:11', 18),
	(8, 'Anímes', 'Animes', '<p>O presente trabalho teve como foco a influ&ecirc;ncia cultural do Jap&atilde;o sobre o processo de&nbsp;<br>consumo e identidade do p&uacute;blico jovem brasileiro. Para chegar a essa compreens&atilde;o foi&nbsp;<br>realizado um estudo sobre a cultura e seus segmentos, para depois apresentar um&nbsp;<br>breve hist&oacute;rico do surgimento dos quadrinhos, de forma geral, para ent&atilde;o chegar aos&nbsp;<br>mang&aacute;s e anim&ecirc;s. O trabalho procura contextualizar e distinguir o folclore das&nbsp;<br>manifesta&ccedil;&otilde;es da cultura pop, enfatizando a influ&ecirc;ncia dos desenhos japoneses no&nbsp;<br>Brasil. O estudo possibilita uma nova vis&atilde;o do desenho animado japon&ecirc;s n&atilde;o apenas&nbsp;<br>como forma de entretenimento, mas como agente cultural, que atua no comportamento&nbsp;<br>dos indiv&iacute;duos.</p>\r\n<p><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq5SdUql6KI_9m3N3mGkn2NUtOhzwUTnA0-Q&amp;usqp=CAU" alt="ZapGrupos - Grupo Anime para Whatsapp"></p>', '2023-03-09 16:27:49', '2023-03-09 16:27:49', 15),
	(13, 'Musicas e Ciência', 'Musicas-e-Ciencia', '<p>&nbsp;</p>\r\n<p>O presente artigo trata do uso da m&uacute;sica, do som, dos efeitos sonoros na constru&ccedil;&atilde;o c&ecirc;nica, destacando a import&acirc;ncia da composi&ccedil;&atilde;o sonora para criar climas</p>\r\n<p><a href="https://www.nucleodoconhecimento.com.br/arte/musica-como-elemento"><img class="attachment-large size-large wp-post-image" src="https://www.nucleodoconhecimento.com.br/wp-content/uploads/2019/06/01-4.png" sizes="(max-width: 522px) 100vw, 522px" srcset="https://www.nucleodoconhecimento.com.br/wp-content/uploads/2019/06/01-4.png 522w, https://www.nucleodoconhecimento.com.br/wp-content/uploads/2019/06/01-4-300x199.png 300w" alt="" width="522" height="346" loading="lazy"></a></p>', '2023-03-10 14:50:06', '2023-03-10 15:16:02', 17),
	(14, 'Como os aviões se mantêm no ar?', 'Como-os-avioes-se-mantem-no-ar', '<p>Em 1917, Albert Einstein explicou a rela&ccedil;&atilde;o entre o espa&ccedil;o e o tempo. Mas, naquele ano, ele projetou uma asa de avi&atilde;o falha. Sua tentativa era baseada numa teoria incompleta sobre o voo. De fato, explica&ccedil;&otilde;es fracas e incorretas ainda circulam por a&iacute;. Mas onde foi que Einstein errou? E como exatamente os avi&otilde;es voam?</p>\r\n<p><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn2dnLbDwy5w2-loLAJgqbqdy1cIBEbu85Pw&amp;usqp=CAU" alt="Setembro 2016 &ndash; Manuel Gavina"></p>', '2023-03-11 17:45:03', '2023-03-11 17:45:03', 20),
	(15, 'Por que gostamos de apertar coisinhas fofas?', 'Por-que-gostamos-de-apertar-coisinhas-fofas', '<p>Quando voc&ecirc; v&ecirc; um gatinho saracoteando por a&iacute;, pode ter a sensa&ccedil;&atilde;o de que nunca se deparou com algo t&atilde;o avassaladoramente ador&aacute;vel na vida. Voc&ecirc; pode querer acariciar seu pelo macio e beijar sua cabecinha, mas tamb&eacute;m pode sentir o desejo conflitante de... apertar ou esmagar o gatinho, e at&eacute;, talvez, de enfi&aacute;-lo na boca. Que estranho fen&ocirc;meno &eacute; esse? Joshua Paul Dale explora esse desejo, conhecido como "agress&atilde;o fofa".</p>', '2023-03-11 17:46:16', '2023-03-11 17:46:16', 21),
	(16, 'Como jogar vôlei', 'Como-jogar-volei', '<p>O jogo &eacute; iniciado por uma das equipes que d&atilde;o o saque, lan&ccedil;ando a bola para o lado da equipe advers&aacute;ria. Ap&oacute;s o saque, a bola deve ultrapassar a rede, onde os jogadores advers&aacute;rios evitam que caia em seu campo, utilizando no m&aacute;ximo tr&ecirc;s toques. O jogo &eacute; dividido em sets, quem vencer os tr&ecirc;s primeiros, ganha a partida.</p>', '2023-03-11 17:47:31', '2023-03-11 17:47:31', 21);

-- Copiando estrutura para tabela guiapress.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela guiapress.categories: ~7 rows (aproximadamente)
INSERT INTO `categories` (`id`, `title`, `slug`, `createdAt`, `updatedAt`) VALUES
	(14, 'Produtos Web', 'Produtos-Web', '2023-03-07 17:48:44', '2023-03-07 17:48:44'),
	(15, 'Web-bem', 'Web-bem', '2023-03-07 17:48:51', '2023-03-09 15:26:35'),
	(16, 'Sistemas nat 1', 'Sistemas-nat-1', '2023-03-07 17:48:58', '2023-03-07 22:53:44'),
	(17, 'Componentes', 'Componentes', '2023-03-07 17:49:10', '2023-03-07 17:49:10'),
	(18, 'Produtos Nativos js', 'Produtos-Nativos-js', '2023-03-07 18:32:02', '2023-03-07 19:24:12'),
	(20, 'Tecnologia e inovação', 'Tecnologia-e-inovacao', '2023-03-11 17:43:20', '2023-03-11 17:43:20'),
	(21, 'Passa tempo', 'Passa-tempo', '2023-03-11 17:43:37', '2023-03-11 17:43:37');

-- Copiando estrutura para tabela guiapress.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela guiapress.users: ~4 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
	(1, 'Cleverton', 'user1@gmail.com', '$2a$10$ypoTMm1IkV/M7L851CZHs.4fBbDdp8DKmikjCqT8za3tzP3Wne6WW', '2023-03-12 12:40:32', '2023-03-12 12:40:32'),
	(2, 'Maria teresa', 'user2@gmail.com', '$2a$10$Y7FrH5lh/g8psPQLFloLre6b52ebYlrmJWXtVYPW82RG0Z/vjiJjy', '2023-03-12 15:13:13', '2023-03-12 15:13:13'),
	(3, 'Renato PB', 'user3@gmail.com', '$2a$10$km8bVFGelkqSc7CxruOcOOhZ1Sfaz1xXACmVok/60yyuw6Zf6UkSK', '2023-03-12 15:13:56', '2023-03-12 15:13:56'),
	(4, 'Alison Mant', 'user4@gmail.com', '$2a$10$PnjQBCS.0iFXgx2Mff2Keerl8ruhfj0Y8pcvo1Yn5GxCWQjFim3bK', '2023-03-12 15:15:33', '2023-03-12 15:15:33');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
