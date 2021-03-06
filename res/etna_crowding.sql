-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Lun 19 Février 2018 à 14:34
-- Version du serveur :  10.1.26-MariaDB-0+deb9u1
-- Version de PHP :  7.0.19-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `etna_crowding`
--

-- --------------------------------------------------------

--
-- Structure de la table `domain`
--

CREATE TABLE `domain` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `domain`
--

INSERT INTO `domain` (`id`, `user_id`, `name`, `description`, `slug`, `created_at`) VALUES
(1, 1, 'mailer', 'Liste des mails automatisé', 'mailer', '2018-01-27 00:00:00'),
(2, 2, 'documents', 'un petit teste de documents a traduire.', 'documents', '2018-02-17 15:20:34');

-- --------------------------------------------------------

--
-- Structure de la table `domain_lang`
--

CREATE TABLE `domain_lang` (
  `domain_id` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `domain_lang`
--

INSERT INTO `domain_lang` (`domain_id`, `lang_id`) VALUES
(1, 'EN'),
(1, 'FR'),
(1, 'PL');

-- --------------------------------------------------------

--
-- Structure de la table `lang`
--

CREATE TABLE `lang` (
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `lang`
--

INSERT INTO `lang` (`code`) VALUES
('EN'),
('ES'),
('FR'),
('IT'),
('PL');

-- --------------------------------------------------------

--
-- Structure de la table `translation`
--

CREATE TABLE `translation` (
  `id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `translation`
--

INSERT INTO `translation` (`id`, `domain_id`, `code`) VALUES
(2, 1, '__bye__'),
(1, 1, '__registration__'),
(7, 1, '_5a6fa30b80f0e__'),
(8, 1, '_5a6fa3383f24a__'),
(9, 1, '_5a6fa41ad8b1f__'),
(10, 1, '_5a6fa49a931f9__'),
(11, 1, '_5a6fa4aabf4f1__'),
(12, 1, '_5a6fa544038ff__'),
(13, 1, '_5a6fa55402acd__'),
(14, 1, '_5a6fa55f43e54_'),
(15, 1, '_5a6fa578428a9_'),
(16, 1, '_5a6fa59b9d06a_'),
(17, 1, '_5a6fa5c7840a4_'),
(18, 1, '_5a6fa5d005733_'),
(19, 1, '_5a6fa5d83a1c5_'),
(20, 1, '_5a6fa6035939d_'),
(21, 1, '_5a6fa62aeed0e_'),
(22, 1, '_5a6fa636b7ee5_'),
(23, 1, '_5a6fa64a2baae_'),
(24, 1, '_5a6fa689077d0_'),
(25, 1, '_5a6fa69b211e4_'),
(26, 1, '_5a70bd4fab06c_'),
(27, 1, '_5a70c8bb7034e_'),
(28, 1, '_5a70c8f364cfa_'),
(29, 1, '_5a70c8fea7988_'),
(30, 1, '_5a70cb9527fa2_'),
(31, 1, '_5a70ce5c5062c_'),
(32, 1, '_5a70ce5c971fa_'),
(33, 1, '_5a70ce7c221f5_'),
(34, 1, '_5a70ce7c5dd8b_'),
(35, 1, '_5a70cea866cdf_'),
(36, 1, '_5a70cea8a155c_'),
(37, 1, '_5a70ceb531909_'),
(38, 1, '_5a70ceb55745a_'),
(39, 1, '_5a70cec36a0c6_'),
(40, 1, '_5a70cec3af907_'),
(41, 1, '_5a70ced184461_'),
(42, 1, '_5a70ced1b0196_'),
(43, 1, '_5a70cee512f8f_'),
(44, 1, '_5a70cee552b8b_'),
(45, 1, '_5a70cf01bb7a1_'),
(46, 1, '_5a70cf01e12e0_'),
(47, 1, '_5a70cf0f599c2_'),
(48, 1, '_5a70cf0f91ebb_'),
(49, 1, '_5a70cf21cf978_'),
(50, 1, '_5a70cf22baf42_'),
(51, 1, '_5a70cf4bd2aa7_'),
(52, 1, '_5a70cf4c13d05_'),
(53, 1, '_5a70cf52be3b6_'),
(54, 1, '_5a70cf52ea2c7_'),
(55, 1, '_5a70d390da771_'),
(56, 1, '_5a70d3910c065_'),
(57, 1, '_5a70d5998b66a_'),
(58, 1, '_5a70d599d2f7a_'),
(59, 1, '_5a70d5abe6b6e_'),
(60, 1, '_5a70d5ac2a88f_'),
(61, 1, '_5a70d6a503e8f_'),
(62, 1, '_5a70d6a52d097_'),
(63, 1, '_5a70d6bab5f32_'),
(64, 1, '_5a70d6bb01060_'),
(65, 1, '_5a70d6c024c4e_'),
(66, 1, '_5a70d6c06796f_'),
(67, 1, '_5a70d71076163_'),
(68, 1, '_5a70d710da326_'),
(69, 1, '_5a70d73009a88_'),
(70, 1, '_5a70d7303f410_'),
(71, 1, '_5a70d73d7ee84_'),
(72, 1, '_5a70d73dbf689_'),
(73, 1, '_5a70d7bda468e_'),
(74, 1, '_5a70d7bdd0798_'),
(75, 1, '_5a70d96be487c_'),
(76, 1, '_5a70d96c25c13_'),
(77, 1, '_5a70d9decb802_'),
(78, 1, '_5a70d9df0563c_'),
(79, 1, '_5a71f90117dec_'),
(80, 1, '_5a71f90154176_'),
(81, 1, '_5a742e0eb6c6e_'),
(82, 1, '_5a742e0f239c6_'),
(83, 1, '_5a742e4cefd6f_'),
(84, 1, '_5a742e4d31ae1_'),
(85, 1, '_5a742ff38bc83_'),
(86, 1, '_5a742ff3b7f4e_'),
(87, 1, '_5a74301070cb6_'),
(88, 1, '_5a743010a41ea_'),
(89, 1, '_5a74301fa9df2_'),
(90, 1, '_5a74301fe7196_'),
(91, 1, '_5a74302bb94f7_'),
(92, 1, '_5a74302bedafe_'),
(93, 1, '_5a743035170d6_'),
(94, 1, '_5a7430354593c_'),
(95, 1, '_5a7430444619f_'),
(96, 1, '_5a7430447b550_'),
(97, 1, '_5a7434da047e3_'),
(98, 1, '_5a7434da62f61_'),
(99, 1, '_5a7434fa6223a_'),
(100, 1, '_5a7434fa91ad9_'),
(101, 1, '_5a7435b04c6b1_'),
(102, 1, '_5a7435b08af15_'),
(103, 1, '_5a7435c859bb3_'),
(104, 1, '_5a7435c896d48_'),
(105, 1, '_5a7435d27b547_'),
(106, 1, '_5a7435d2af272_'),
(107, 1, '_5a7435d8869c3_'),
(108, 1, '_5a7435d8ba594_'),
(109, 1, '_5a7439eedb872_'),
(110, 1, '_5a7439ef22f20_'),
(111, 1, '_5a7439fe3d5da_'),
(112, 1, '_5a7439fe76354_'),
(113, 1, '_5a743a218c19e_'),
(114, 1, '_5a743a21c875b_'),
(115, 1, '_5a743d2e21ba4_'),
(116, 1, '_5a743d2e598e5_'),
(117, 1, '_5a743e40ed868_'),
(118, 1, '_5a743e413ff34_'),
(119, 1, '_5a743e6da4c3b_'),
(120, 1, '_5a743e6df1294_'),
(121, 1, '_5a743e6e52c2c_'),
(122, 1, '_5a88234d888e5_'),
(123, 1, '_5a88234e27240_'),
(124, 1, '_5a88234e923ee_'),
(125, 1, '_5a8824064b463_'),
(126, 1, '_5a882406a0738_'),
(127, 1, '_5a882407166d9_'),
(128, 1, '_5a8824e915453_'),
(129, 1, '_5a8824e9b6724_'),
(130, 1, '_5a8824ea3548f_'),
(131, 1, '_5a8825154ba73_'),
(132, 1, '_5a882515b13eb_'),
(133, 1, '_5a8825163f5c9_'),
(134, 1, '_5a8825331a335_'),
(135, 1, '_5a8825337ee07_'),
(136, 1, '_5a882533e6aac_'),
(137, 1, '_5a8839850a8c4_'),
(138, 1, '_5a8839855d7da_'),
(139, 1, '_5a883985ce14c_'),
(140, 1, 'test');

-- --------------------------------------------------------

--
-- Structure de la table `translation_to_lang`
--

CREATE TABLE `translation_to_lang` (
  `translation_id` int(11) NOT NULL,
  `lang_id` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `trans` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `translation_to_lang`
--

INSERT INTO `translation_to_lang` (`translation_id`, `lang_id`, `trans`) VALUES
(1, 'EN', 'hello'),
(1, 'FR', 'bonjour'),
(2, 'EN', 'bye bye'),
(2, 'FR', 'au revoir'),
(7, 'EN', '5a6fa30b80f0e - EN'),
(7, 'FR', '5a6fa30b80f0e - FR'),
(8, 'EN', '5a6fa3383f24a - EN'),
(8, 'FR', '5a6fa3383f24a - FR'),
(9, 'EN', '5a6fa41ad8b1f - EN'),
(9, 'FR', '5a6fa41ad8b1f - FR'),
(10, 'EN', '5a6fa49a931f9 - EN'),
(10, 'FR', '5a6fa49a931f9 - FR'),
(11, 'EN', '5a6fa4aabf4f1 - EN'),
(11, 'FR', '5a6fa4aabf4f1 - FR'),
(12, 'EN', '5a6fa544038ff - EN'),
(12, 'FR', '5a6fa544038ff - FR'),
(13, 'EN', '5a6fa55402acd - EN'),
(13, 'FR', '5a6fa55402acd - FR'),
(14, 'EN', '5a6fa55f43e54 - EN'),
(14, 'FR', '5a6fa55f43e54 - FR'),
(15, 'EN', '5a6fa578428a9 - EN'),
(15, 'FR', '5a6fa578428a9 - FR'),
(16, 'EN', '5a6fa59b9d06a - EN'),
(16, 'FR', '5a6fa59b9d06a - FR'),
(17, 'EN', '5a6fa5c7840a4 - EN'),
(17, 'FR', '5a6fa5c7840a4 - FR'),
(18, 'EN', '5a6fa5d005733 - EN'),
(18, 'FR', '5a6fa5d005733 - FR'),
(19, 'EN', '5a6fa5d83a1c5 - EN'),
(19, 'FR', '5a6fa5d83a1c5 - FR'),
(20, 'EN', '5a6fa6035939d - EN'),
(20, 'FR', '5a6fa6035939d - FR'),
(21, 'EN', '5a6fa62aeed0e - EN'),
(21, 'FR', '5a6fa62aeed0e - FR'),
(22, 'EN', '5a6fa636b7ee5 - EN'),
(22, 'FR', '5a6fa636b7ee5 - FR'),
(23, 'EN', '5a6fa64a2baae - EN'),
(23, 'FR', '5a6fa64a2baae - FR'),
(24, 'EN', '5a6fa689077d0 - EN'),
(24, 'FR', '5a6fa689077d0 - FR'),
(25, 'EN', '5a6fa69b211e4 - EN'),
(25, 'FR', '5a6fa69b211e4 - FR'),
(26, 'EN', '5a70bd4fab06c - EN'),
(26, 'FR', '5a70bd4fab06c - FR'),
(27, 'EN', '5a70c8bb7034e - EN'),
(27, 'FR', '5a70c8bb7034e - FR'),
(28, 'EN', '5a70c8f364cfa - EN'),
(28, 'FR', '5a70c8f364cfa - FR'),
(29, 'EN', '5a70c8fea7988 - EN'),
(29, 'FR', '5a70c8fea7988 - FR'),
(30, 'EN', '5a70cb9527fa2 - EN'),
(30, 'FR', '5a70cb9527fa2 - FR'),
(31, 'EN', '5a70ce5c5062c - EN'),
(31, 'FR', '5a70ce5c5062c - FR'),
(32, 'EN', '5a70ce5c971fa - EN'),
(32, 'FR', '5a70ce5c971fa - FR'),
(33, 'EN', '5a70ce7c221f5 - EN'),
(33, 'FR', '5a70ce7c221f5 - FR'),
(34, 'EN', '5a70ce7c5dd8b - EN'),
(34, 'FR', '5a70ce7c5dd8b - FR'),
(35, 'EN', '5a70cea866cdf - EN'),
(35, 'FR', '5a70cea866cdf - FR'),
(36, 'EN', '5a70cea8a155c - EN'),
(36, 'FR', '5a70cea8a155c - FR'),
(37, 'EN', '5a70ceb531909 - EN'),
(37, 'FR', '5a70ceb531909 - FR'),
(38, 'EN', '5a70ceb55745a - EN'),
(38, 'FR', '5a70ceb55745a - FR'),
(39, 'EN', '5a70cec36a0c6 - EN'),
(39, 'FR', '5a70cec36a0c6 - FR'),
(40, 'EN', '5a70cec3af907 - EN'),
(40, 'FR', '5a70cec3af907 - FR'),
(41, 'EN', '5a70ced184461 - EN'),
(41, 'FR', '5a70ced184461 - FR'),
(42, 'EN', '5a70ced1b0196 - EN'),
(42, 'FR', '5a70ced1b0196 - FR'),
(43, 'EN', '5a70cee512f8f - EN'),
(43, 'FR', '5a70cee512f8f - FR'),
(44, 'EN', '5a70cee552b8b - EN'),
(44, 'FR', '5a70cee552b8b - FR'),
(45, 'EN', '5a70cf01bb7a1 - EN'),
(45, 'FR', '5a70cf01bb7a1 - FR'),
(46, 'EN', '5a70cf01e12e0 - EN'),
(46, 'FR', '5a70cf01e12e0 - FR'),
(47, 'EN', '5a70cf0f599c2 - EN'),
(47, 'FR', '5a70cf0f599c2 - FR'),
(48, 'EN', '5a70cf0f91ebb - EN'),
(48, 'FR', '5a70cf0f91ebb - FR'),
(49, 'EN', '5a70cf21cf978 - EN'),
(49, 'FR', '5a70cf21cf978 - FR'),
(50, 'EN', '5a70cf22baf42 - EN'),
(50, 'FR', '5a70cf22baf42 - FR'),
(51, 'EN', '5a70cf4bd2aa7 - EN'),
(51, 'FR', '5a70cf4bd2aa7 - FR'),
(52, 'EN', '5a70cf4c13d05 - EN'),
(52, 'FR', '5a70cf4c13d05 - FR'),
(53, 'EN', '5a70cf52be3b6 - EN'),
(53, 'FR', '5a70cf52be3b6 - FR'),
(54, 'EN', '5a70cf52ea2c7 - EN'),
(54, 'FR', '5a70cf52ea2c7 - FR'),
(55, 'EN', '5a70d390da771 - EN'),
(55, 'FR', '5a70d390da771 - FR'),
(56, 'EN', '5a70d3910c065 - EN'),
(56, 'FR', '5a70d3910c065 - FR'),
(57, 'EN', '5a70d5998b66a - EN'),
(57, 'FR', '5a70d5998b66a - FR'),
(58, 'EN', '5a70d599d2f7a - EN'),
(58, 'FR', '5a70d599d2f7a - FR'),
(59, 'EN', '5a70d5abe6b6e - EN'),
(59, 'FR', '5a70d5abe6b6e - FR'),
(60, 'EN', '5a70d5ac2a88f - EN'),
(60, 'FR', '5a70d5ac2a88f - FR'),
(61, 'EN', '5a70d6a503e8f - EN'),
(61, 'FR', '5a70d6a503e8f - FR'),
(62, 'EN', '5a70d6a52d097 - EN'),
(62, 'FR', '5a70d6a52d097 - FR'),
(63, 'EN', '5a70d6bab5f32 - EN'),
(63, 'FR', '5a70d6bab5f32 - FR'),
(64, 'EN', '5a70d6bb01060 - EN'),
(64, 'FR', '5a70d6bb01060 - FR'),
(65, 'EN', '5a70d6c024c4e - EN'),
(65, 'FR', '5a70d6c024c4e - FR'),
(66, 'EN', '5a70d6c06796f - EN'),
(66, 'FR', '5a70d6c06796f - FR'),
(67, 'EN', '5a70d71076163 - EN'),
(67, 'FR', '5a70d71076163 - FR'),
(68, 'EN', '5a70d710da326 - EN'),
(68, 'FR', '5a70d710da326 - FR'),
(69, 'EN', '5a70d73009a88 - EN'),
(69, 'FR', '5a70d73009a88 - FR'),
(70, 'EN', '5a70d7303f410 - EN'),
(70, 'FR', '5a70d7303f410 - FR'),
(71, 'EN', '5a70d73d7ee84 - EN'),
(71, 'FR', '5a70d73d7ee84 - FR'),
(72, 'EN', '5a70d73dbf689 - EN'),
(72, 'FR', '5a70d73dbf689 - FR'),
(73, 'EN', '5a70d7bda468e - EN'),
(73, 'FR', '5a70d7bda468e - FR'),
(74, 'EN', '5a70d7bdd0798 - EN'),
(74, 'FR', '5a70d7bdd0798 - FR'),
(75, 'EN', '5a70d96be487c - EN'),
(75, 'FR', '5a70d96be487c - FR'),
(76, 'EN', '5a70d96c25c13 - EN'),
(76, 'FR', '5a70d96c25c13 - FR'),
(77, 'EN', '5a70d9decb802 - EN'),
(77, 'FR', '5a70d9decb802 - FR'),
(78, 'EN', '5a70d9df0563c - EN'),
(78, 'FR', '5a70d9df0563c - FR'),
(79, 'EN', '5a71f90117dec - EN'),
(79, 'FR', '5a71f90117dec - FR'),
(80, 'EN', '5a71f90154176 - EN'),
(80, 'FR', '5a71f90154176 - FR'),
(81, 'EN', '5a742e0eb6c6e - EN'),
(81, 'FR', '5a742e0eb6c6e - FR'),
(82, 'EN', '5a742e0f239c6 - EN'),
(82, 'FR', '5a742e0f239c6 - FR'),
(83, 'EN', '5a742e4cefd6f - EN'),
(83, 'FR', '5a742e4cefd6f - FR'),
(84, 'EN', '5a742e4d31ae1 - EN'),
(84, 'FR', '5a742e4d31ae1 - FR'),
(85, 'EN', '5a742ff38bc83 - EN'),
(85, 'FR', '5a742ff38bc83 - FR'),
(86, 'EN', '5a742ff3b7f4e - EN'),
(86, 'FR', '5a742ff3b7f4e - FR'),
(87, 'EN', '5a74301070cb6 - EN'),
(87, 'FR', '5a74301070cb6 - FR'),
(88, 'EN', '5a743010a41ea - EN'),
(88, 'FR', '5a743010a41ea - FR'),
(89, 'EN', '5a74301fa9df2 - EN'),
(89, 'FR', '5a74301fa9df2 - FR'),
(90, 'EN', '5a74301fe7196 - EN'),
(90, 'FR', '5a74301fe7196 - FR'),
(91, 'EN', '5a74302bb94f7 - EN'),
(91, 'FR', '5a74302bb94f7 - FR'),
(92, 'EN', '5a74302bedafe - EN'),
(92, 'FR', '5a74302bedafe - FR'),
(93, 'EN', '5a743035170d6 - EN'),
(93, 'FR', '5a743035170d6 - FR'),
(94, 'EN', '5a7430354593c - EN'),
(94, 'FR', '5a7430354593c - FR'),
(95, 'EN', '5a7430444619f - EN'),
(95, 'FR', '5a7430444619f - FR'),
(96, 'EN', '5a7430447b550 - EN'),
(96, 'FR', '5a7430447b550 - FR'),
(97, 'EN', '5a7434da047e3 - EN'),
(97, 'FR', '5a7434da047e3 - FR'),
(98, 'EN', '5a7434da62f61 - EN'),
(98, 'FR', '5a7434da62f61 - FR'),
(99, 'EN', '5a7434fa6223a - EN'),
(99, 'FR', '5a7434fa6223a - FR'),
(100, 'EN', '5a7434fa91ad9 - EN'),
(100, 'FR', '5a7434fa91ad9 - FR'),
(101, 'EN', '5a7435b04c6b1 - EN'),
(101, 'FR', '5a7435b04c6b1 - FR'),
(102, 'EN', '5a7435b08af15 - EN'),
(102, 'FR', '5a7435b08af15 - FR'),
(103, 'EN', '5a7435c859bb3 - EN'),
(103, 'FR', '5a7435c859bb3 - FR'),
(104, 'EN', '5a7435c896d48 - EN'),
(104, 'FR', '5a7435c8a57c5 - FR - 2'),
(104, 'PL', '5a7435c8a57c5 - PL'),
(105, 'EN', '5a7435d27b547 - EN'),
(105, 'FR', '5a7435d27b547 - FR'),
(106, 'EN', '5a7435d2af272 - EN'),
(106, 'FR', '5a7435d2bac20 - FR - 2'),
(106, 'PL', '5a7435d2bac20 - PL'),
(107, 'EN', '5a7435d8869c3 - EN'),
(107, 'FR', '5a7435d8869c3 - FR'),
(108, 'EN', '5a7435d8ba594 - EN'),
(108, 'FR', '5a7435d8c5ebb - FR - 2'),
(108, 'PL', '5a7435d8c5ebb - PL'),
(109, 'EN', '5a7439eedb872 - EN'),
(109, 'FR', '5a7439eedb872 - FR'),
(110, 'EN', '5a7439ef22f20 - EN'),
(110, 'FR', '5a7439ef22f20 - FR'),
(111, 'EN', '5a7439fe3d5da - EN'),
(111, 'FR', '5a7439fe3d5da - FR'),
(112, 'EN', '5a7439fe76354 - EN'),
(112, 'FR', '5a7439fe80cd3 - FR - 2'),
(112, 'PL', '5a7439fe80cd3 - PL'),
(113, 'EN', '5a743a218c19e - EN'),
(113, 'FR', '5a743a218c19e - FR'),
(114, 'EN', '5a743a21c875b - EN'),
(114, 'FR', '5a743a21d6003 - FR - 2'),
(114, 'PL', '5a743a21d6003 - PL'),
(115, 'EN', '5a743d2e21ba4 - EN'),
(115, 'FR', '5a743d2e21ba4 - FR'),
(116, 'EN', '5a743d2e598e5 - EN'),
(116, 'FR', '5a743d2e66cb2 - FR - 2'),
(116, 'PL', '5a743d2e66cb2 - PL'),
(117, 'EN', '5a743e40ed868 - EN'),
(117, 'FR', '5a743e40ed868 - FR'),
(118, 'EN', '5a743e413ff34 - EN'),
(118, 'FR', '5a743e414ce58 - FR - 2'),
(118, 'PL', '5a743e414ce58 - PL'),
(119, 'EN', '5a743e6da4c3b - EN'),
(119, 'FR', '5a743e6da4c3b - FR'),
(120, 'EN', '5a743e6df1294 - EN'),
(120, 'FR', '5a743e6e0791d - FR - 2'),
(120, 'PL', '5a743e6e0791d - PL'),
(121, 'EN', '5a743e6e52c2c - EN'),
(121, 'FR', '5a743e6e52c2c - FR'),
(122, 'EN', '5a88234d888e5 - EN'),
(122, 'FR', '5a88234d888e5 - FR'),
(123, 'EN', '5a88234e27240 - EN'),
(123, 'FR', '5a88234e3903b - FR - 2'),
(123, 'PL', '5a88234e3903b - PL'),
(124, 'EN', '5a88234e923ee - EN'),
(124, 'FR', '5a88234e923ee - FR'),
(125, 'EN', '5a8824064b463 - EN'),
(125, 'FR', '5a8824064b463 - FR'),
(126, 'EN', '5a882406a0738 - EN'),
(126, 'FR', '5a882406ba5a5 - FR - 2'),
(126, 'PL', '5a882406ba5a5 - PL'),
(127, 'EN', '5a882407166d9 - EN'),
(127, 'FR', '5a882407166d9 - FR'),
(128, 'EN', '5a8824e915453 - EN'),
(128, 'FR', '5a8824e915453 - FR'),
(129, 'EN', '5a8824e9b6724 - EN'),
(129, 'FR', '5a8824e9cce08 - FR - 2'),
(129, 'PL', '5a8824e9cce08 - PL'),
(130, 'EN', '5a8824ea3548f - EN'),
(130, 'FR', '5a8824ea3548f - FR'),
(131, 'EN', '5a8825154ba73 - EN'),
(131, 'FR', '5a8825154ba73 - FR'),
(132, 'EN', '5a882515b13eb - EN'),
(132, 'FR', '5a882515d7f27 - FR - 2'),
(132, 'PL', '5a882515d7f27 - PL'),
(133, 'EN', '5a8825163f5c9 - EN'),
(133, 'FR', '5a8825163f5c9 - FR'),
(134, 'EN', '5a8825331a335 - EN'),
(134, 'FR', '5a8825331a335 - FR'),
(135, 'EN', '5a8825337ee07 - EN'),
(135, 'FR', '5a8825338ec87 - FR - 2'),
(135, 'PL', '5a8825338ec87 - PL'),
(136, 'EN', '5a882533e6aac - EN'),
(136, 'FR', '5a882533e6aac - FR'),
(137, 'EN', '5a8839850a8c4 - EN'),
(137, 'FR', '5a8839850a8c4 - FR'),
(138, 'EN', '5a8839855d7da - EN'),
(138, 'FR', '5a8839857c191 - FR - 2'),
(138, 'PL', '5a8839857c191 - PL'),
(139, 'EN', '5a883985ce14c - EN'),
(139, 'FR', '5a883985ce14c - FR'),
(140, 'FR', 'azef azef azefaz e');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'lilelulo', 'lilelulo@tipeee.com', 'ezygazkfuygezkfjgzkefj'),
(2, 'etna', 'rousse_h@etna-alternance.net', 'sqgsuyfgsjdhgfsdjkghf');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `domain`
--
ALTER TABLE `domain`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A7A91E0B989D9B62` (`slug`),
  ADD KEY `IDX_A7A91E0BA76ED395` (`user_id`);

--
-- Index pour la table `domain_lang`
--
ALTER TABLE `domain_lang`
  ADD PRIMARY KEY (`domain_id`,`lang_id`),
  ADD KEY `IDX_9CD5A905115F0EE5` (`domain_id`),
  ADD KEY `IDX_9CD5A905B213FA4` (`lang_id`);

--
-- Index pour la table `lang`
--
ALTER TABLE `lang`
  ADD PRIMARY KEY (`code`);

--
-- Index pour la table `translation`
--
ALTER TABLE `translation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `domain_id` (`domain_id`,`code`),
  ADD KEY `IDX_B469456F115F0EE5` (`domain_id`);

--
-- Index pour la table `translation_to_lang`
--
ALTER TABLE `translation_to_lang`
  ADD PRIMARY KEY (`translation_id`,`lang_id`),
  ADD KEY `IDX_77EB6C5F9CAA2B25` (`translation_id`),
  ADD KEY `IDX_77EB6C5FB213FA4` (`lang_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`),
  ADD UNIQUE KEY `password` (`password`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `domain`
--
ALTER TABLE `domain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `translation`
--
ALTER TABLE `translation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `domain`
--
ALTER TABLE `domain`
  ADD CONSTRAINT `FK_A7A91E0BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `domain_lang`
--
ALTER TABLE `domain_lang`
  ADD CONSTRAINT `FK_9CD5A905115F0EE5` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`),
  ADD CONSTRAINT `FK_9CD5A905B213FA4` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`code`);

--
-- Contraintes pour la table `translation`
--
ALTER TABLE `translation`
  ADD CONSTRAINT `FK_B469456F115F0EE5` FOREIGN KEY (`domain_id`) REFERENCES `domain` (`id`);

--
-- Contraintes pour la table `translation_to_lang`
--
ALTER TABLE `translation_to_lang`
  ADD CONSTRAINT `FK_77EB6C5F9CAA2B25` FOREIGN KEY (`translation_id`) REFERENCES `translation` (`id`),
  ADD CONSTRAINT `FK_77EB6C5FB213FA4` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;