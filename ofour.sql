-- MySQL dump 10.13  Distrib 9.1.0, for macos15.1 (arm64)
--
-- Host: localhost    Database: ofour
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (00000000000000000001,'Plats principaux',NULL,NULL),(00000000000000000002,'Plats principaux',NULL,NULL),(00000000000000000003,'Soupe',NULL,NULL),(00000000000000000004,'Plats principaux',NULL,NULL),(00000000000000000005,'Plats principaux',NULL,NULL),(00000000000000000006,'Desserts',NULL,NULL),(00000000000000000007,'Soupe',NULL,NULL),(00000000000000000008,'Desserts',NULL,NULL),(00000000000000000009,'Plats principaux',NULL,NULL),(00000000000000000010,'Desserts',NULL,NULL),(00000000000000000011,'Desserts',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapes_preparation`
--

DROP TABLE IF EXISTS `etapes_preparation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapes_preparation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `recette_id` bigint unsigned NOT NULL,
  `numero_etape` int NOT NULL,
  `description_etape` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etapes_preparation_recette_id_foreign` (`recette_id`),
  CONSTRAINT `etapes_preparation_recette_id_foreign` FOREIGN KEY (`recette_id`) REFERENCES `recettes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapes_preparation`
--

LOCK TABLES `etapes_preparation` WRITE;
/*!40000 ALTER TABLE `etapes_preparation` DISABLE KEYS */;
INSERT INTO `etapes_preparation` VALUES (1,1,1,'Préparer la pâte brisée.',NULL,NULL),(2,1,2,'Faire revenir les lardons.',NULL,NULL),(3,1,3,'Mélanger les œufs et la crème.',NULL,NULL),(4,1,4,'Verser le mélange sur la pâte avec les lardons.',NULL,NULL),(5,1,5,'Ajouter le fromage râpé et cuire au four.',NULL,NULL),(6,2,1,'Couper les légumes en dés.',NULL,NULL),(7,2,2,'Faire revenir les légumes dans une poêle.',NULL,NULL),(8,2,3,'Laisser mijoter jusqu\'à ce que les légumes soient tendres.',NULL,NULL),(9,3,1,'Faire revenir les oignons.',NULL,NULL),(10,3,2,'Ajouter le bouillon et laisser mijoter.',NULL,NULL),(11,3,3,'Ajouter le pain et le fromage râpé.',NULL,NULL),(12,3,4,'Faire gratiner au four.',NULL,NULL),(13,4,1,'Faire revenir le bœuf.',NULL,NULL),(14,4,2,'Ajouter les légumes.',NULL,NULL),(15,4,3,'Ajouter le vin et laisser mijoter.',NULL,NULL),(16,5,1,'Faire revenir le poulet.',NULL,NULL),(17,5,2,'Ajouter les oignons et les champignons.',NULL,NULL),(18,5,3,'Ajouter le vin et laisser mijoter.',NULL,NULL),(19,6,1,'Préparer la pâte à crêpes.',NULL,NULL),(20,6,2,'Cuire les crêpes.',NULL,NULL),(21,6,3,'Préparer la sauce à l\'orange.',NULL,NULL),(22,6,4,'Flamber les crêpes avec la sauce.',NULL,NULL),(23,7,1,'Faire revenir les poissons et moules.',NULL,NULL),(24,7,2,'Ajouter les tomates et le bouillon.',NULL,NULL),(25,7,3,'Ajouter le safran et laisser mijoter.',NULL,NULL),(26,8,1,'Préparer le caramel avec le sucre et le beurre.',NULL,NULL),(27,8,2,'Ajouter les pommes au caramel.',NULL,NULL),(28,8,3,'Recouvrir de pâte brisée et cuire au four.',NULL,NULL),(29,9,1,'Beurrer les tranches de pain.',NULL,NULL),(30,9,2,'Ajouter le jambon et le fromage.',NULL,NULL),(31,9,3,'Griller les sandwiches.',NULL,NULL),(32,10,1,'Préparer la pâte sablée.',NULL,NULL),(33,10,2,'Préparer la garniture au citron.',NULL,NULL),(34,10,3,'Ajouter la meringue et cuire au four.',NULL,NULL),(35,11,1,'Préparer la crème avec le lait, les œufs et la vanille.',NULL,NULL),(36,11,2,'Verser dans des ramequins et cuire au bain-marie.',NULL,NULL),(37,11,3,'Caraméliser le sucre sur le dessus avant de servir.',NULL,NULL),(38,12,1,'Préparer le caramel avec le sucre et le beurre.',NULL,NULL),(39,12,2,'Ajouter les pommes au caramel.',NULL,NULL),(40,12,3,'Recouvrir de pâte brisée et cuire au four.',NULL,NULL),(41,13,1,'Préparer les blancs d\'œufs et battre en neige.',NULL,NULL),(42,13,2,'Mélanger les amandes et le sucre glace.',NULL,NULL),(43,13,3,'Former des petits tas et cuire au four.',NULL,NULL),(44,14,1,'Préparer la pâte à choux et la cuire.',NULL,NULL),(45,14,2,'Préparer la crème pâtissière au chocolat.',NULL,NULL),(46,14,3,'Garnir les éclairs avec la crème pâtissière.',NULL,NULL),(47,15,1,'Préparer la crème de mascarpone.',NULL,NULL),(48,15,2,'Tremper les biscuits dans le café.',NULL,NULL),(49,15,3,'Alterner les couches de biscuits et de crème.',NULL,NULL),(50,16,1,'Faire fondre le chocolat avec le beurre.',NULL,NULL),(51,16,2,'Incorporer les œufs et le sucre.',NULL,NULL),(52,16,3,'Cuire au four et servir immédiatement.',NULL,NULL),(53,17,1,'Mélanger les ingrédients et préparer la pâte.',NULL,NULL),(54,17,2,'Verser dans les moules à madeleines.',NULL,NULL),(55,17,3,'Cuire au four jusqu\'à ce qu\'elles soient dorées.',NULL,NULL),(56,18,1,'Préparer la pâte à choux et la cuire.',NULL,NULL),(57,18,2,'Garnir les choux avec la crème pâtissière.',NULL,NULL),(58,18,3,'Nappez de chocolat fondu.',NULL,NULL),(59,19,1,'Préparer la pâte et la laisser lever.',NULL,NULL),(60,19,2,'Cuire les babas au four.',NULL,NULL),(61,19,3,'Imbiber les babas de sirop au rhum.',NULL,NULL),(62,20,1,'Préparer la crème d\'amande.',NULL,NULL),(63,20,2,'Étaler la pâte feuilletée et garnir de crème.',NULL,NULL),(64,20,3,'Cuire au four et laisser refroidir.',NULL,NULL),(65,21,1,'Couper les tomates et haricots verts.',NULL,NULL),(66,21,2,'Mélanger les légumes avec les œufs durs, olives, thon et anchois.',NULL,NULL),(67,21,3,'Assaisonner avec de l\'huile d\'olive.',NULL,NULL),(68,22,1,'Faire caraméliser les oignons.',NULL,NULL),(69,22,2,'Ajouter le bouillon et laisser mijoter.',NULL,NULL),(70,22,3,'Servir avec du pain grillé et du fromage.',NULL,NULL),(71,23,1,'Trancher le foie gras.',NULL,NULL),(72,23,2,'Assaisonner avec fleur de sel et poivre.',NULL,NULL),(73,23,3,'Servir avec du pain d\'épices grillé.',NULL,NULL),(74,24,1,'Préparer la pâte brisée.',NULL,NULL),(75,24,2,'Mélanger les œufs, crème et lardons.',NULL,NULL),(76,24,3,'Verser le mélange sur la pâte et cuire.',NULL,NULL),(77,25,1,'Préparer la pâte et la farce de viande.',NULL,NULL),(78,25,2,'Assembler le pâté et le cuire.',NULL,NULL),(79,26,1,'Faire griller le pain et déposer une tranche de chèvre dessus.',NULL,NULL),(80,26,2,'Préparer la salade avec les noix et la vinaigrette.',NULL,NULL),(81,26,3,'Disposer le chèvre chaud sur la salade et servir.',NULL,NULL),(82,27,1,'Cuire les aubergines au four jusqu\'à ce qu\'elles soient tendres.',NULL,NULL),(83,27,2,'Mixer la chair des aubergines avec l\'ail, l\'huile d\'olive et le jus de citron.',NULL,NULL),(84,27,3,'Assaisonner avec du sel et servir.',NULL,NULL),(85,28,1,'Trancher finement le bœuf et disposer sur une assiette.',NULL,NULL),(86,28,2,'Parsemer de parmesan, roquette, huile et citron.',NULL,NULL),(87,28,3,'Servir immédiatement.',NULL,NULL),(88,29,1,'Cuire le saumon frais et l\'émietter.',NULL,NULL),(89,29,2,'Mélanger avec le saumon fumé, la crème et le citron.',NULL,NULL),(90,29,3,'Assaisonner avec l\'aneth et servir.',NULL,NULL),(91,30,1,'Hacher la viande et mélanger avec les ingrédients.',NULL,NULL),(92,30,2,'Verser le mélange dans une terrine et cuire au bain-marie.',NULL,NULL);
/*!40000 ALTER TABLE `etapes_preparation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `recette_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Lardons',NULL,NULL,0),(2,'Œufs',NULL,NULL,0),(3,'Crème fraîche',NULL,NULL,0),(4,'Fromage râpé',NULL,NULL,0),(5,'Aubergine',NULL,NULL,0),(6,'Poivron',NULL,NULL,0),(7,'Courgette',NULL,NULL,0),(8,'Tomates',NULL,NULL,0),(9,'Oignons',NULL,NULL,0),(10,'Bouillon de légumes',NULL,NULL,0),(11,'Pain',NULL,NULL,0),(12,'Fromage râpé',NULL,NULL,0),(13,'Bœuf',NULL,NULL,0),(14,'Carottes',NULL,NULL,0),(15,'Vin rouge',NULL,NULL,0),(16,'Oignons',NULL,NULL,0),(17,'Poulet',NULL,NULL,0),(18,'Vin rouge',NULL,NULL,0),(19,'Oignons',NULL,NULL,0),(20,'Champignons',NULL,NULL,0),(21,'Farine',NULL,NULL,0),(22,'Œufs',NULL,NULL,0),(23,'Beurre',NULL,NULL,0),(24,'Orange',NULL,NULL,0),(25,'Poisson',NULL,NULL,0),(26,'Moules',NULL,NULL,0),(27,'Tomates',NULL,NULL,0),(28,'Safran',NULL,NULL,0),(29,'Pommes',NULL,NULL,0),(30,'Sucre',NULL,NULL,0),(31,'Beurre',NULL,NULL,0),(32,'Pâte brisée',NULL,NULL,0),(33,'Pain de mie',NULL,NULL,0),(34,'Jambon',NULL,NULL,0),(35,'Fromage',NULL,NULL,0),(36,'Beurre',NULL,NULL,0),(37,'Citron',NULL,NULL,0),(38,'Sucre',NULL,NULL,0),(39,'Œufs',NULL,NULL,0),(40,'Pâte sablée',NULL,NULL,0),(41,'Crème',NULL,NULL,0),(42,'Œufs',NULL,NULL,0),(43,'Sucre',NULL,NULL,0),(44,'Vanille',NULL,NULL,0),(45,'Pommes',NULL,NULL,0),(46,'Sucre',NULL,NULL,0),(47,'Beurre',NULL,NULL,0),(48,'Pâte brisée',NULL,NULL,0),(49,'Amandes',NULL,NULL,0),(50,'Blancs d\'œufs',NULL,NULL,0),(51,'Sucre glace',NULL,NULL,0),(52,'Colorant alimentaire',NULL,NULL,0),(53,'Pâte à choux',NULL,NULL,0),(54,'Chocolat',NULL,NULL,0),(55,'Crème pâtissière',NULL,NULL,0),(56,'Sucre',NULL,NULL,0),(57,'Mascarpone',NULL,NULL,0),(58,'Œufs',NULL,NULL,0),(59,'Café',NULL,NULL,0),(60,'Biscuit à la cuillère',NULL,NULL,0),(61,'Chocolat',NULL,NULL,0),(62,'Œufs',NULL,NULL,0),(63,'Beurre',NULL,NULL,0),(64,'Sucre',NULL,NULL,0),(65,'Farine',NULL,NULL,0),(66,'Beurre',NULL,NULL,0),(67,'Œufs',NULL,NULL,0),(68,'Sucre',NULL,NULL,0),(69,'Pâte à choux',NULL,NULL,0),(70,'Crème pâtissière',NULL,NULL,0),(71,'Chocolat',NULL,NULL,0),(72,'Sucre',NULL,NULL,0),(73,'Farine',NULL,NULL,0),(74,'Levure',NULL,NULL,0),(75,'Rhum',NULL,NULL,0),(76,'Sucre',NULL,NULL,0),(77,'Pâte feuilletée',NULL,NULL,0),(78,'Crème d\'amande',NULL,NULL,0),(79,'Œufs',NULL,NULL,0),(80,'Sucre',NULL,NULL,0),(81,'Tomates',NULL,NULL,0),(82,'Haricots verts',NULL,NULL,0),(83,'Œufs durs',NULL,NULL,0),(84,'Olives noires',NULL,NULL,0),(85,'Thon',NULL,NULL,0),(86,'Anchois',NULL,NULL,0),(87,'Oignons',NULL,NULL,0),(88,'Bouillon de bœuf',NULL,NULL,0),(89,'Pain',NULL,NULL,0),(90,'Fromage râpé',NULL,NULL,0),(91,'Foie gras',NULL,NULL,0),(92,'Pain d\'épices',NULL,NULL,0),(93,'Fleur de sel',NULL,NULL,0),(94,'Poivre noir',NULL,NULL,0),(95,'Lardons',NULL,NULL,0),(96,'Œufs',NULL,NULL,0),(97,'Crème fraîche',NULL,NULL,0),(98,'Pâte brisée',NULL,NULL,0),(99,'Gruyère râpé',NULL,NULL,0),(100,'Farine',NULL,NULL,0),(101,'Viande de porc hachée',NULL,NULL,0),(102,'Œufs',NULL,NULL,0),(103,'Beurre',NULL,NULL,0),(104,'Chèvre',NULL,NULL,0),(105,'Pain',NULL,NULL,0),(106,'Salade verte',NULL,NULL,0),(107,'Noix',NULL,NULL,0),(108,'Vinaigrette',NULL,NULL,0),(109,'Aubergines',NULL,NULL,0),(110,'Ail',NULL,NULL,0),(111,'Huile d\'olive',NULL,NULL,0),(112,'Citron',NULL,NULL,0),(113,'Sel',NULL,NULL,0),(114,'Bœuf',NULL,NULL,0),(115,'Parmesan',NULL,NULL,0),(116,'Roquette',NULL,NULL,0),(117,'Huile d\'olive',NULL,NULL,0),(118,'Citron',NULL,NULL,0),(119,'Saumon frais',NULL,NULL,0),(120,'Saumon fumé',NULL,NULL,0),(121,'Crème fraîche',NULL,NULL,0),(122,'Citron',NULL,NULL,0),(123,'Aneth',NULL,NULL,0),(124,'Porc',NULL,NULL,0),(125,'Foie de volaille',NULL,NULL,0),(126,'Oeufs',NULL,NULL,0),(127,'Cognac',NULL,NULL,0),(128,'Échalotes',NULL,NULL,0);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2019_12_14_000001_create_personal_access_tokens_table',1),(2,'2023_10_13_130843_create_categories_table',1),(3,'2023_10_13_130924_create_ingredients_table',2),(4,'2023_10_13_130956_create_recettes_table',2),(5,'2023_10_13_131023_create_recette_ingredients_table',2),(6,'2023_10_13_131050_create_etapes_preparation_table',2),(7,'2023_10_13_143117_add_recette_id_to_ingredients_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recette_ingredients`
--

DROP TABLE IF EXISTS `recette_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recette_ingredients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `recette_id` bigint unsigned NOT NULL,
  `ingredient_id` bigint unsigned NOT NULL,
  `quantite` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recette_ingredients_recette_id_foreign` (`recette_id`),
  KEY `recette_ingredients_ingredient_id_foreign` (`ingredient_id`),
  CONSTRAINT `recette_ingredients_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`),
  CONSTRAINT `recette_ingredients_recette_id_foreign` FOREIGN KEY (`recette_id`) REFERENCES `recettes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
