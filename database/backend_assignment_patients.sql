-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: backend_assignment
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `patient_photo` varchar(255) NOT NULL,
  `psychiatrist_id` int DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `psychiatrist_id` (`psychiatrist_id`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`psychiatrist_id`) REFERENCES `psychiatrists` (`psychiatrist_id`),
  CONSTRAINT `patients_chk_1` CHECK ((length(`address`) >= 10)),
  CONSTRAINT `patients_chk_2` CHECK (regexp_like(`email`,_utf8mb4'^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+.[A-Z|a-z]{2,4}$')),
  CONSTRAINT `patients_chk_3` CHECK (((length(`phone_number`) >= 10) and regexp_like(`phone_number`,_utf8mb4'^[0-9]+$')))
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Wildon Quoit','582 Thackeray Court','wquoit0@kickstarter.com','5619592504','xO3$~w&qv|yA#f','NisiVenenatisTristique.doc',9),(2,'Alison Kinney','75 Cardinal Crossing','akinney1@go.com','9969025688','tX4!cY>azV1','Vestibulum.jpeg',13),(3,'Opaline Gierok','08 Ohio Junction','ogierok2@nba.com','9362647466','kV1|jC=)Gf','SollicitudinMiSit.avi',5),(4,'Jarrett Riseborough','78 Muir Circle','jriseborough3@quantcast.com','5203410736','hC3|EinJmF}','InterdumMaurisUllamcorper.png',5),(5,'Claus Pitrelli','62397 Corben Hill','cpitrelli4@mapy.cz','5185238225','sK0!+ja.p9g!C32','ConsectetuerEgetRutrum.jpeg',17),(6,'Reube Leere','57986 Bonner Alley','rleere5@instagram.com','6956984910','lB9`LiR,V\'&N4M','TristiqueTortorEu.avi',4),(7,'Wenda Cecchi','2446 Old Shore Street','wcecchi6@desdev.cn','2425973460','gE9&HVEbZXd','UtRhoncusAliquet.avi',12),(8,'Suzanna Borgnol','196 Sauthoff Park','sborgnol7@icq.com','5195264792','jY9<|yFuoH4e#Q5','Ante.mp3',2),(9,'Randy Parsonson','921 High Crossing Parkway','rparsonson8@about.com','6204352871','vA5~ty5pr9eW','Commodo.txt',16),(10,'Marissa Dawdary','73952 Arrowood Pass','mdawdary9@mapquest.com','9781370792','uH2/y0snAZo4','EuEstCongue.avi',10),(11,'Emilee Rodliff','4 Mifflin Terrace','erodliffa@smh.com.au','5942881909','gJ2.~X4<6W`k}dW','InHacHabitasse.jpeg',16),(12,'Kaitlynn Ezzle','925 Carpenter Crossing','kezzleb@omniture.com','2675237593','pA8+u@Ur`na','LoremQuisqueUt.mp3',1),(13,'Jacklyn Jennrich','79 Coleman Hill','jjennrichc@reddit.com','4945236319','yO8|jZsl91T%','JustoEu.xls',17),(14,'Darcie Lardez','971 Jenifer Lane','dlardezd@ucoz.com','1755775728','pT2/b7dwKEATO','Accumsan.gif',5),(15,'Brand Cairney','96 Helena Point','bcairneye@army.mil','3171502572','tX6,)?QrT','FelisDonec.tiff',3),(16,'Jennine Livermore','1 Mitchell Place','jlivermoref@deviantart.com','9426497666','vB6+V++S*jK0EEn','In.gif',3),(17,'Wilek Simants','2664 Randy Street','wsimantsg@exblog.jp','7207704551','lP3=+K>*2G\\','Diam.ppt',11),(18,'Farand Penright','3 7th Crossing','fpenrighth@sourceforge.net','3826709588','bO0,52J*#O1','Dolor.xls',6),(19,'Sheffy Shiel','84 Golden Leaf Court','sshieli@goodreads.com','3492351078','xQ0}YiQi#?','JustoEtiamPretium.avi',3),(20,'Britte Noods','71804 Mariners Cove Crossing','bnoodsj@admin.ch','3203929490','lM2|mMMcU50,_jD','Nascetur.avi',15),(21,'Matt McCaskill','2604 Reindahl Trail','mmccaskillk@macromedia.com','1448310397','zK2&`rN7F$L','EgetEros.pdf',19),(22,'Erhart Garside','38771 Sugar Place','egarsidel@patch.com','7367117669','pO7$$=EQZj','Sed.mp3',3),(23,'Alister Foynes','4326 Londonderry Court','afoynesm@dell.com','4339773914','aR5}6\'0ytlgjV','VelSem.avi',2),(24,'Dorthea De Beneditti','18 Schmedeman Street','dden@psu.edu','4852252869','rE1~V=,LD0VJ','A.mpeg',8),(25,'Jarrad Benediktovich','19849 Sloan Park','jbenediktovicho@artisteer.com','5718180179','pT4(8P5(G','DignissimVestibulum.avi',19),(26,'Aurora Tortoise','137 Killdeer Circle','atortoisep@cmu.edu','6317275979','nI0@hG5ITsP','RutrumAtLorem.tiff',1),(27,'Marget Hearnes','0806 Kensington Junction','mhearnesq@4shared.com','6125491811','dI4|`t34y0u&8\'','Amet.jpeg',3),(28,'Vivian Dyers','7917 Rusk Street','vdyersr@weebly.com','7698110618','vF2?Bcq(_vv','Nulla.jpeg',17),(29,'Willamina Baalham','77 Valley Edge Trail','wbaalhams@histats.com','6511268367','xV8(/=tk.&&f03B','PorttitorLacusAt.mpeg',8),(30,'Aldus Colston','423 Morning Terrace','acolstont@bloomberg.com','7332138018','iU0}pFCb<EcWUf','LacusCurabiturAt.tiff',6),(31,'Corbin Applebee','285 Northwestern Lane','capplebeeu@scribd.com','1127086280','eZ0&,jDR@R','VelDapibus.xls',5),(32,'Bruis Newnham','52 Corben Park','bnewnhamv@ebay.co.uk','1064822881','fH0_Nd,}MymEBF','SitAmet.mp3',17),(33,'Maggie Milier','229 Twin Pines Parkway','mmilierw@dropbox.com','3097647451','zJ3?J9JT','FaucibusOrci.txt',17),(34,'Cull MacPharlain','628 8th Lane','cmacpharlainx@diigo.com','3486778323','pM8=C6RHfk','VitaeConsectetuerEget.ppt',1),(35,'Archer Winch','51 Anzinger Road','awinchy@360.cn','5469933560','iW7+5I+p.lZEytW','MorbiVestibulumVelit.mp3',3),(36,'Kathleen de Clerc','601 New Castle Road','kdez@slate.com','4244645890','mF0\'JU/uE','Ipsum.ppt',13),(37,'Hadlee Lutwyche','5000 Crownhardt Circle','hlutwyche10@comcast.net','2989004977','tF2_n}D(w+>>','Interdum.ppt',14),(38,'Mathian Geerdts','4990 Little Fleur Park','mgeerdts11@hhs.gov','8263713442','yE7)6cn4,z|Orc=','PlateaDictumst.tiff',10),(39,'Tobin Lynd','3 Cardinal Street','tlynd12@miibeian.gov.cn','3862344200','qO3>WVpM8c$A0','Elit.txt',14),(40,'Charlton Stiling','251 Summit Terrace','cstiling13@free.fr','1004630457','yJ9~MNU*','Hac.jpeg',9),(41,'Bernelle Potell','8341 Luster Pass','bpotell14@toplist.cz','2171481186','mG0_>oLs','SuspendissePotentiIn.doc',18),(42,'Emanuele Challicum','79 8th Hill','echallicum15@homestead.com','2954373189','vX3\\3\"l_CU','CongueRisus.png',9),(43,'Selinda Fellowes','3 Lakewood Center','sfellowes16@reuters.com','1469814350','fZ3+c6f.,twd','AcNeque.jpeg',5),(44,'Galven Hinnerk','1970 Harbort Park','ghinnerk17@stumbleupon.com','4072004822','mX8?=1v\\D','Volutpat.avi',11),(45,'Gustave Draycott','062 Elmside Park','gdraycott18@sakura.ne.jp','4743682923','uJ5\"$L~d1(37','SitAmetSapien.mp3',13),(46,'Mikey Conew','41 Vernon Plaza','mconew19@xrea.com','7004848202','rR0\\16|@','TemporConvallisNulla.png',6),(47,'Linnea Normanvill','28302 Prentice Center','lnormanvill1a@sogou.com','9845250687','yU6%Dd_oec22M6','VolutpatConvallis.jpeg',11),(48,'Sylvester Marples','72 Hazelcrest Junction','smarples1b@xinhuanet.com','7523185711','xP6}!>Fqs\"gWt}','Dolor.mp3',11),(49,'Hurley Wolpert','49 Ridgeway Crossing','hwolpert1c@uol.com.br','6574336856','gM7%$jpH20','NecDui.xls',11),(50,'Gilburt Connochie','2643 Pawling Trail','gconnochie1d@github.io','6807636357','nL3|T/QW\\=','AccumsanTortorQuis.png',2),(51,'Bancroft Odd','75233 Gale Terrace','bodd1e@4shared.com','1522229206','oN0_z/$Rs#tP','AliquamNon.gif',6),(52,'Selie Grantham','531 Tennessee Park','sgrantham1f@yahoo.com','7477969383','eZ5!kPAhiJ+w\"M','AdipiscingLorem.xls',16),(53,'Domini Yellep','6508 East Plaza','dyellep1g@walmart.com','4811580924','eY7<gwjK','ElementumLigulaVehicula.xls',6),(54,'Randie Churms','90465 Delladonna Point','rchurms1h@earthlink.net','5765267920','xX9%uLp0@b#+_I','UltricesPhasellusId.ppt',16),(55,'Cooper Florence','29 Commercial Way','cflorence1i@dagondesign.com','6539503714','kJ7\\vA//4\'<b','Rutrum.tiff',12),(56,'Job Hardi','3 Spenser Court','jhardi1j@businessweek.com','5571590266','bO9*$Rt@g(kkwCC&','Amet.mp3',7),(57,'Cole Minico','3 Columbus Court','cminico1k@ebay.com','2045208502','fW6<s&Ih!','AtDolorQuis.mp3',18),(58,'Alice','Address 2342122','dr_allen1@example.com','98765421301','$2b$10$gnyNC8X.DWBIkAr.8n0pzeI/9NgKf7rr5kAxCZsgrgzWnnwj7cyD.','photo1.jpg',1),(59,'Alice2','Address 2342122','dr_allen1@example.com','98765421301','$2b$10$6MpJDzpXoexlzLkgA4MkAePgBqkFXQPZ1JvfEGsJHCEl9903CuPhi','photo1.jpg',1),(60,'Alice5','Address 2342122','dr_allen1@example.com','98765421301','$2b$10$GH5OvdHY5sI.1AkvJfLjcu.NKVmjKkzoy2oHLynbHz/Nn6buvFnue','photo1.jpg',3);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-31 16:11:18
