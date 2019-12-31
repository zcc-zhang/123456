/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.48 : Database - store
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`store` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `store`;

/*Table structure for table `t_administrator` */

DROP TABLE IF EXISTS `t_administrator`;

CREATE TABLE `t_administrator` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `head_portrait` varchar(50) NOT NULL DEFAULT '123' COMMENT '管理员头像',
  `admin_name` varchar(50) NOT NULL COMMENT '管理员用户名',
  `PASSWORD` varchar(20) NOT NULL COMMENT '管理员密码',
  `email` varchar(30) DEFAULT NULL COMMENT '管理员邮箱地址',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_administrator` */

insert  into `t_administrator`(`Id`,`head_portrait`,`admin_name`,`PASSWORD`,`email`) values (1,'123','admin','123456',NULL);

/*Table structure for table `t_commodity` */

DROP TABLE IF EXISTS `t_commodity`;

CREATE TABLE `t_commodity` (
  `commodity_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `product_name` varchar(60) NOT NULL COMMENT '商品名称',
  `commodity_type_ID` int(11) NOT NULL COMMENT '商品类型',
  `commodity_attribute` varchar(250) NOT NULL,
  `commodity_price` decimal(10,0) NOT NULL COMMENT '商品单价',
  `commodity_freight` decimal(10,0) NOT NULL COMMENT '商品运费',
  `merchant_id` int(11) NOT NULL COMMENT '商家id',
  `commodity_status` int(11) NOT NULL DEFAULT '1' COMMENT '商品状态',
  `commodity_img` text NOT NULL,
  `shelf_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上架时间',
  `commodity_weight` int(4) NOT NULL COMMENT '商品重量',
  `commodity_evaluation` int(4) NOT NULL DEFAULT '120' COMMENT '商品评价',
  `commodity_number` int(4) NOT NULL COMMENT '商品数量',
  `inventory` int(4) DEFAULT '100' COMMENT '商品库存',
  `collect_number` int(4) NOT NULL DEFAULT '100' COMMENT '商品库存',
  PRIMARY KEY (`commodity_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

/*Data for the table `t_commodity` */

insert  into `t_commodity`(`commodity_ID`,`product_name`,`commodity_type_ID`,`commodity_attribute`,`commodity_price`,`commodity_freight`,`merchant_id`,`commodity_status`,`commodity_img`,`shelf_time`,`commodity_weight`,`commodity_evaluation`,`commodity_number`,`inventory`,`collect_number`) values (6,'果酸“换肤术',2,'瓶装','238','0',3,0,'http://localhost:8080/commodityImg/8bf2a631fcac4415af83cc5ab9c77e0e1571043868952k1q6yfih12176.jpg,\nhttp://localhost:8080/commodityImg/9e464d7184c94e7ea6d655d9f8cbbf651569499903530k10npw6510052.jpg,\nhttp://localhost:8080/commodityImg/44e78572ad394af69cffda4da0955baa1569499904116k10npwm910054.jpg\n','2019-12-31 14:43:03',340,19988,15122,100,841),(7,'【2件装 5种香型可选】Kao 花王 Merit Pyuan 弱酸性无硅油洗护套组 425ml*2',3,'瓶装','89','0',3,1,'http://localhost:8080/commodityImg/70ca08ef6f50415cbca0fb224f46c2651571995540925086218ca-8fb2-4aa9-8a27-e086e590d93e.jpg,\nhttp://localhost:8080/commodityImg/73ef3098b739488997ba244281eb93791568103130976k0dk47kb10070.jpg,\nhttp://localhost:8080/commodityImg/454ace738a6b4f21acd0faf4a1a1bb541568103138637k0dk4dgx10070.jpg\n','2019-12-31 15:19:32',200,5,101,100,841),(10,'LANCÔME 兰蔻 小黑瓶精华肌底液 100毫升',1,'瓶装','979','0',3,1,'http://localhost:8080/commodityImg/9992674c525594c79181b6c62d54c9a8_1f88aaa55a434cf9ba5ab0a4b931ded41552978635642jtffdsa010036_imageView&thumbnail=524x524&quality=85.jpg,http://localhost:8080/commodityImg/fd8965b480274f3faceb5455a1b51c131561708890627jxft5g4d10162.jpg,http://localhost:8080/commodityImg/faebc281c88e4ac0a92d4ace84259e891561708890870jxft5gbk10163.jpg','2019-12-31 15:19:32',100,215,89,100,841),(11,'SHISEIDO 资生堂 UNO 男士泡沫快速洁面奶 150毫升',1,'盒装','55','0',2,1,'http://localhost:8080/commodityImg/81e533eb5946428897153e3143eb06631558609302587jw0jqiio10689.jpg,\nhttp://localhost:8080/commodityImg/99d2094fca8847229aea141fd94abf171558609307741jw0jqmob10710.jpg,\nhttp://localhost:8080/commodityImg/41015ee6d8a54488b6d49c569f5507071558609302152jw0jqi6810688.jpg','2019-12-31 15:19:32',50,487,120,100,841),(12,'NatureRepublic自然共和国软管芦荟胶自然精粹芦荟面膜5片装 清爽水润',1,'盒装','46','0',5,1,'http://localhost:8080/commodityImg/7943428de7914d59ab8d08333ca64a8f1558593576310jw0adg0t10527.jpg,\nhttp://localhost:8080/commodityImg/41ef9419b32b414682f45d6a3bc92c231558593580093jw0adiy110501.jpg,\nhttp://localhost:8080/commodityImg/5bf49c2d3ff44742bf7d66feb71e871e1558593580529jw0adj9t10502.jpg','2019-12-31 15:19:32',100,1200,111,100,841),(13,'ANNA SUI 安娜苏 许愿精灵女士淡香水 ',10,'瓶装','148','0',2,1,'http://localhost:8080/commodityImg/O1CN01bJbVKy1m1xJGjQ15o_!!2200657724895-0-sm.jpg_430x430q90.jpg,\nhttp://localhost:8080/commodityImg/TB2EJyYqNRDOuFjSZFzXXcIipXa_!!2549841410.jpg_430x430q90.jpg','2019-12-31 15:19:32',150,1212,221,100,841),(14,'BVLGARI 宝格丽 花舞轻盈紫水晶女士淡香水 ',10,'瓶装','228','0',4,1,'http://localhost:8080/commodityImg/ix7j8obh60_800_800.jpg,\nhttp://localhost:8080/commodityImg/ix7j8ojc84_800_800.jpg,\nhttp://localhost:8080/commodityImg/ix7j8ouq24_800_800.jpg','2019-12-31 15:19:32',200,3223,200,100,841),(15,'【抖音同款】Anna Sui 安娜苏筑梦天马 独角兽梦幻香水 甜蜜梦境女士淡香水Edt. 30/50/75ml ',12,'瓶装','220','0',5,1,'http://localhost:8080/commodityImg/b6abf8fef054402997ff234f28b18d2a1571276731431k1u1lhcp11111.jpg,\nhttp://localhost:8080/commodityImg/4866bf8def4f4781907023091f8bc81e1571276731723k1u1lhks11113.jpg,\nhttp://localhost:8080/commodityImg/831e97cffba4491e91776c4173a9def41571276731530k1u1lhfb11112.jpg','2019-12-31 15:19:22',250,163,263,100,841),(16,'SAINT LAURENT PARIS 圣罗兰 反转巴黎女士淡香精 ',12,'瓶装','498','0',1,1,'http://localhost:8080/commodityImg/2bfbef3e83c1417c8bfea1acb4d542841536113521432jloibuv310381.jpg,\nhttp://localhost:8080/commodityImg/b90163b6f5e844188287468ac3ae1a211536113520745jloibuc110379.jpg,\nhttp://localhost:8080/commodityImg/6ded74eeddd9492fa79331e3bed92e491536113520993jloibuiw10380.jpg','2019-12-31 15:19:22',150,613,1000,100,841),(17,'miu miu 缪缪 同名女士香水 50毫升 首款限量 ',12,'瓶装','478','0',1,1,'http://localhost:8080/commodityImg/595bc1bf8e1747ff9b42e3fbe0800fa81551433766432jspvlvk611117.jpg,\nhttp://localhost:8080/commodityImg/f73267b746734c4c8f0c80731f7a9cc51551433758544jspvlpgo11205.jpg,\nhttp://localhost:8080/commodityImg/7a1e3e5bb1714996a5eaf0cc6d8cd2711551433758697jspvlplb11206.jpg','2019-12-31 15:19:22',200,2588,2000,100,841),(18,'【 李佳琦推荐 再享1元换购】YSL圣罗兰细管 哑光口红 2.2g小金条 23/18/9/10/5/21/新色号22 ',7,'盒装','271','0',3,1,'http://localhost:8080/commodityImg/2b348436-c48d-44e2-810a-cfc05ef90772.jpg,\nhttp://localhost:8080/commodityImg/e0015547-d47a-4071-848b-c735b4e19f82.jpg,\nhttp://localhost:8080/commodityImg/ed7374ae-2c22-4cd6-b5d4-64ba871d39c1.jpg','2019-12-31 15:19:22',50,2000,1000,100,841),(19,'【不同礼盒随机发送】欧舒丹甜扁桃紧致系列身体护理礼盒 白色星月',9,'瓶装','569','0',2,1,'http://localhost:8080/commodityImg/350c55a8a5a44c388fbc55882d0737f11552965251045jtf7ewkf10001.jpg,\nhttp://localhost:8080/commodityImg/ik5espo825_800_800.jpg','2019-12-31 15:19:32',500,0,500,100,841),(20,'【必备套装】Aveeno 艾惟诺 成人舒缓柔嫩沐浴露 354毫升+天然燕麦润肤乳 354毫升+舒缓柔嫩恒润护手霜',9,'瓶装','195','0',2,1,'http://localhost:8080/commodityImg/dc060976188a413f9aa0a34e69b04f0e1552988583687jtflb05t10181.jpg,\nhttp://localhost:8080/commodityImg/onlineieh0ndgl10112.jpg,\nhttp://localhost:8080/commodityImg/onlineieh0nem210113.jpg\n','2019-12-31 15:19:32',200,10,100,100,841),(21,'2瓶装 | SHISEIDO 资生堂 水之密语烫染修护洗发露+护发素洗护套装 600毫升/瓶 ',5,'瓶装','89','0',5,1,'http://localhost:8080/commodityImg/ipkwtv5866_800_800.jpg,\nhttp://localhost:8080/commodityImg/ipkwtvn743_800_800.jpg,\nhttp://localhost:8080/commodityImg/ipkwtwif4_800_800.jpg','2019-12-31 15:19:32',300,98,200,100,841),(22,'Calvin Klein 卡文克莱 燃情男士淡香水 100毫升 ',11,'瓶装','148','0',2,1,'http://localhost:8080/commodityImg/ipnyyr7c85_800_800.jpg,\nhttp://localhost:8080/commodityImg/ipnyyrqs66_800_800.jpg,\nhttp://localhost:8080/commodityImg/ipnyysda35_800_800.jpg','2019-12-31 15:19:22',200,1583,1200,100,841),(23,'VERSACE 范思哲 经典同名男士淡香水 50毫升',11,'瓶装','278','0',3,1,'http://localhost:8080/commodityImg/4a02504ec7f74652aa59a06380457bc81533781087182jklxnp2w11433.jpg,\nhttp://localhost:8080/commodityImg/a7d3aab918a04666b7fcd61f4bc7c4291533781087969jklxnpoo11434.jpg,\nhttp://localhost:8080/commodityImg/a8b501f560084bdf8bbdbb3bd4a8b7e31533781089394jklxnqsf11436.jpg\n','2019-12-31 15:19:22',1000,2015,890,100,841),(24,'Ferrari 法拉利 法拉利红色淡香水喷雾 柑橘木调 明朗温暖 性感迷人 提升魅力',11,'瓶装','173','0',2,1,'http://localhost:8080/commodityImg/ipkwtv5866_800_800.jpg,\nhttp://localhost:8080/commodityImg/ipkwtvn743_800_800.jpg,\nhttp://localhost:8080/commodityImg/ipkwtwif4_800_800.jpg','2019-12-31 15:19:22',1000,2015,890,100,841),(25,'网易严选 小方砖系列 杉木与琥珀男士淡香水',11,'瓶装','199','0',2,1,'http://localhost:8080/commodityImg/ipnyyr7c85_800_800.jpg,\nhttp://localhost:8080/commodityImg/ipnyyrqs66_800_800.jpg,\nhttp://localhost:8080/commodityImg/ipnyysda35_800_800.jpg','2019-12-31 15:19:32',200,2150,2890,100,841),(26,'Dior 迪奥 旷野男士淡香水 60毫升',11,'瓶装','592','0',2,1,'http://localhost:8080/commodityImg/2b348436-c48d-44e2-810a-cfc05ef90772.jpg,\nhttp://localhost:8080/commodityImg/e0015547-d47a-4071-848b-c735b4e19f82.jpg,\nhttp://localhost:8080/commodityImg/ed7374ae-2c22-4cd6-b5d4-64ba871d39c1.jpg','2019-12-31 15:19:22',100,2015,890,100,841),(27,'VERSACE 范思哲 爱罗斯男士淡香水 50毫升 荷尔蒙的引诱',11,'瓶装','279','0',2,1,'\nhttp://localhost:8080/commodityImg/2bfbef3e83c1417c8bfea1acb4d542841536113521432jloibuv310381.jpg,\nhttp://localhost:8080/commodityImg/b90163b6f5e844188287468ac3ae1a211536113520745jloibuc110379.jpg,\nhttp://localhost:8080/commodityImg/6ded74eeddd9492fa79331e3bed92e491536113520993jloibuiw10380.jpg','2019-12-31 15:19:22',100,2015,890,100,841),(28,'Dior 迪奥 魅惑唇膏 3.5克',7,'盒装','159','0',3,1,'http://localhost:8080/commodityImg/a38f4e4a-f5d2-43c2-a347-a6193237143c.jpg,\nhttp://localhost:8080/commodityImg/fcc2cb2e-1b04-4320-956a-3f393c8c4f15.jpg,\nhttp://localhost:8080/commodityImg/0a44c60a-4610-45f9-9fea-77c142a8f0fe.jpg','2019-12-31 15:19:22',100,1020,1000,100,841),(29,'fresh 馥蕾诗 澄糖滋润护唇膏 #珊瑚红 4.3克',7,'盒装','279','0',2,1,'http://localhost:8080/commodityImg/a0fc3354-1d68-424d-a1f6-01ffaf5c0c00.jpg,\nhttp://localhost:8080/commodityImg/78de93f8-03e2-4de1-b03a-13893cef7872.jpg,\nhttp://localhost:8080/commodityImg/702ab98e-533c-42cc-9c45-e0e4b9e94f27.jpg','2019-12-31 15:19:22',100,2015,890,100,841),(30,'【限时包邮】Dior 迪奥 烈焰蓝金红管口红 3.2克#555 新款 #651 #863',7,'盒装','159','0',3,1,'http://localhost:8080/commodityImg/e9144737-d866-43ad-bbfb-2556afd13165.jpg,\nhttp://localhost:8080/commodityImg/11ee09e1-d8b9-4f27-a6f9-dcbdb6896631.jpg,\nhttp://localhost:8080/commodityImg/c38a1090-58c7-411d-857a-62287a1749ca.jpg','2019-12-31 15:19:22',100,1020,1000,100,841),(31,'GUCCI 古驰 Rouge a levres Voile 倾色华缎唇膏 3.5克',7,'盒装','149','0',3,1,'http://localhost:8080/commodityImg/d26026af-3e0e-44f6-9db0-602f054d5c26.jpg,\nhttp://localhost:8080/commodityImg/e1e64a80-002e-4334-973a-0003c40cb71c.jpg,\nhttp://localhost:8080/commodityImg/b36bf979-a1d5-4377-9282-053bea2ff4a2.jpg','2019-12-31 15:19:22',100,1020,1000,100,841),(32,'【包邮】BURBERRY 巴宝莉/博柏利 口红之吻晶润凝彩唇膏kisses口红唇膏 3.3克',7,'盒装','179','0',3,1,'http://localhost:8080/commodityImg/275c4560-1bcd-46c2-8b04-998f7f7a5900.jpg,\nhttp://localhost:8080/commodityImg/166ce383-8a54-46ab-b27f-de3e98219636.jpg','2019-12-31 15:19:22',100,1020,1000,100,841),(33,'Christian Louboutin 金管唇膏 3.5克',7,'盒装','169','0',3,1,'http://localhost:8080/commodityImg/994f779d-40b6-4f5e-8ac6-979eb1dedede.jpg,\nhttp://localhost:8080/commodityImg/f0f9a0b8-cf12-40d1-b85c-d36121b5b8b1.jpg,\nhttp://localhost:8080/commodityImg/5c44e4c6-c9e0-439a-a3b2-6eaf161d132c.jpg','2019-12-31 15:19:22',100,1020,1000,100,841),(34,'【大包装725毫升】Vaseline 凡士林 身体乳烟酰胺 725毫升/瓶 2件装',2,'瓶装','145','0',2,1,'http://localhost:8080/commodityImg/888ee99d597246308ac2bf4dda52d7ae1525867895413jgz2cj8e11974.jpg,\nhttp://localhost:8080/commodityImg/b3afaeff23114c319824c8fc32ebfb781525659213388jgvm3r5j11056.jpg,\nhttp://localhost:8080/commodityImg/72901f7e316140239ffd5ab0c17d02161525867875326jgz2c3qg11972.jpg','2019-12-31 15:19:22',250,2015,12452,100,841),(35,'【500毫升大包装】ElizabethArden 伊丽莎白雅顿 绿茶蜜滴舒体霜 500毫升',2,'瓶装','158','0',3,1,'http://localhost:8080/commodityImg/ccda3ea9-0fdb-4e3e-8c91-b5eb1475d365.jpg,\nhttp://localhost:8080/commodityImg/03133f75-81f1-4340-8140-1b9420bb96b1.jpg,\nhttp://localhost:8080/commodityImg/6ae37fc1-77f0-431b-843c-beca991b7ed1.jpg\n','2019-12-31 15:19:22',250,12331,323322,100,841),(36,'【青春有你同款】Sesderma 西班牙 焕白身体乳400ml',2,'瓶装','199','0',3,1,'http://localhost:8080/commodityImg/9942538678dd46ac80a7b93f0e1a5b1c1551678112859jstx32h111692.jpg,\nhttp://localhost:8080/commodityImg/81a3d97ce0c1425bbb96a4b0045208741545137687228jptr31rc11050.jpg,\nhttp://localhost:8080/commodityImg/6dccbfffac554670a327bd4930e825bd1545137686278jptr310w11047.jpghttp://localhost:8080/commodityImg/1d32d18c5eeb4394a6768537781bbb8d1548410878980jrbvuwog10646.jpg,	http://localhost:8080/commodityImg/7c50ca0c3eed4514a6974348062f52561524450177016jgbm9wpw11176.jpg,	http://localhost:8080/commodityImg/1d32d18c5eeb4394a6768537781bbb8d1548410878980jrbvuwog10646.jpg','2019-12-31 15:19:22',250,15545,31231,100,841),(37,'【青春有你同款】L OCCITANE 欧舒丹 樱花润肤露 250毫升',2,'瓶装','179','0',3,1,'http://localhost:8080/commodityImg/639999c9-a71d-4c38-8494-bf7db1547267.jpg,\nhttp://localhost:8080/commodityImg/f6aefa63-ee79-4f05-91a3-cd9785e701e9.jpg','2019-12-31 15:19:22',250,1256,2000,100,841),(38,'Vaseline 凡士林 身体乳保湿滋润 香体全身补水 嫩白烟酰胺 400毫升 3件装',2,'瓶装','189','0',3,1,'http://localhost:8080/commodityImg/5c44e4c6-c9e0-439a-a3b2-6eaf161d132c.jpg,	http://localhost:8080/commodityImg/206b4cf07fba481db06952787095e5e91536840340554jm0j23w811082.jpg,	http://localhost:8080/commodityImg/b2e7a2793443475d8b25a72f2a9d092c1536840340910jm0j24d411083(1).jpg','2019-12-31 15:19:22',250,1333,2000,100,841),(39,'SHISEIDO 资生堂 新透白樱润透白三件套装（洗面奶125ml+水150ml+乳液75ml）亮白淡斑',1,'瓶装','849','0',2,1,'http://localhost:8080/commodityImg/89a83d7ab3074e4a8aac31e0af3b916d_0_0.jpg,\nhttp://localhost:8080/commodityImg/b0457cd4-744f-46a6-9a56-dbff6d78d983.jpg','2019-12-31 15:19:22',200,2015,12452,100,841),(40,'Mentholatum 曼秀雷敦 乐肤洁隐形净痘贴 26片/盒',1,'盒装','198','0',3,1,'http://localhost:8080/commodityImg/a50fcd47-c5fd-48b0-b1a5-feaf8b97233d.jpg,\nhttp://localhost:8080/commodityImg/eae4aceb-916c-490b-bda8-ded5684e0274.jpg','2019-12-31 15:19:22',200,12331,323322,100,841),(41,'NatureRepublic自然共和国 芦荟胶+芦荟洗面奶 洁面 面膜护理套装',1,'盒装','169','0',3,1,'http://localhost:8080/commodityImg/1697d68f-1cc0-442d-9ce7-833d5f2b3c3a.jpg,\nhttp://localhost:8080/commodityImg/60c2bc94-c392-4c28-9b89-a756f3e06feb.jpghttp://localhost:8080/commodityImg/5bde6bf3-91b4-47bf-a255-d423bd045acd.jpg,	http://localhost:8080/commodityImg/8dff6aa1-2570-49c9-9f04-02a2b46d8173.jpg,	http://localhost:8080/commodityImg/3726ef70-4b09-47d0-8195-81912bb1c6d0.jpg','2019-12-31 15:19:22',200,15545,31231,100,841),(42,'【包税】BCL TSURURI 摩洛哥泥小鼻去皮脂清洁鼻膜 粉色去皮脂鼻膜 55克',1,'盒装','158','0',3,1,'http://localhost:8080/commodityImg/50a3bec8533e42fd8fb487664734b0b91560320146025jwsubtxx10751.jpg,\nhttp://localhost:8080/commodityImg/61023b2bbe754d6bbf5ebff31c6a720f1560320146336jwsubu6j10752.jpg','2019-12-31 15:19:22',200,1256,2000,100,841),(43,'【无税费】su:m37º 苏秘37˚ 臻选套盒 奇迹护理精华露30ml + 水漾清润保湿啫喱霜',1,'盒装','129','0',3,1,'http://localhost:8080/commodityImg/687ed901-1ff8-4805-83c4-2c32f62dca9d.jpg,\nhttp://localhost:8080/commodityImg/c190f432-4f28-4224-b21e-96ae5c7e6615.jpg','2019-12-31 15:19:22',200,13033,21000,100,841),(44,'【赵品霖同款】mixim POTION 觅籍 植物精油 深层修复洗护发套组 440ml*2',3,'瓶装','299','0',2,1,'http://localhost:8080/commodityImg/4e5f1880866e4deb830b705b40db402f1560172355062jwqec5ji10305.jpg,http://localhost:8080/commodityImg/2375a3de4d924fd1ab845db35abd1e171560172369318jwqecgph10252.jpg,http://localhost:8080/commodityImg/71fffdbd863948bd9b398f34760c32131560172363522jwqecc8f10251.jpg','2019-12-31 15:19:43',200,2015,12452,100,841),(45,'【法国明星产品】Klorane康如 奎宁金鸡纳维他命B防脱洗发水 400毫升',3,'瓶装','79','0',3,1,'http://localhost:8080/commodityImg/ilw84mtu65_800_800.jpg,	http://localhost:8080/commodityImg/66375d5b89da4e18b45d7a523fde7a551554174361977jtz7acmf12979.jpg,	http://localhost:8080/commodityImg/66375d5b89da4e18b45d7a523fde7a551554174361977jtz7acmf12979.jpg','2019-12-31 15:19:22',200,12331,323322,100,841),(46,'Amore 爱茉莉 美妆仙护发精油 70毫升/瓶 2瓶装 星你女神同款',3,'盒装','169','0',3,1,'http://localhost:8080/commodityImg/k1.jpg,http://localhost:8080/commodityImg/2a8ec9c46f4047e9ab1aabdebb9e9a931536547273104jlvoknrx11003.jpg,http://localhost:8080/commodityImg/4316688848de48fd93ed0cf7a9fa6ba31536547272813jlvoknks11002.jpg','2019-12-31 15:19:22',200,15545,31231,100,841),(48,'THE BODY SHOP 美体小铺生姜头皮护理洗发水 400毫升',3,'盒装','129','0',3,1,'http://localhost:8080/commodityImg/3232103295aa41f5a4c447767e1bdf5b1552290936670jt41y09z14334.jpg,\nhttp://localhost:8080/commodityImg/beee7554-21e6-4e02-988d-86c574433946.png','2019-12-31 15:19:22',200,13033,21000,100,841),(50,'【赵品霖同款】mixim POTION 觅籍 植物精油 深层修复洗发水 440毫升/瓶',3,'盒装','55','0',3,1,'http://localhost:8080/commodityImg/ipnyyr7c85_800_800.jpg,\nhttp://localhost:8080/commodityImg/ipnyyrqs66_800_800.jpg\n','2019-12-31 15:19:22',200,13033,21000,100,841),(51,'MILENSEA米蓝晞以色列死海泥洗发水护发素2件套装男女控油去屑止痒洗发露柔顺无硅油',3,'盒装','79','0',3,1,'http://localhost:8080/commodityImg/0fb706ca-7991-4a14-a8d0-9222a9a7a3be.jpg,\nhttp://localhost:8080/commodityImg/3232103295aa41f5a4c447767e1bdf5b1552290936670jt41y09z14334.jpg,\nhttp://localhost:8080/commodityImg/287465a48b3740198682305f97bd9fdf1564054215384jyilhwal10012.jpg','2019-12-31 15:19:22',200,13033,21000,100,841),(52,'THE BODY SHOP 美体小铺生姜头皮护理洗发水',3,'盒装','69','0',3,1,'http://localhost:8080/commodityImg/im8v2s2k10_800_800.jpg,\nhttp://localhost:8080/commodityImg/im8v2p5q67_800_800.jpg','2019-12-31 15:19:22',200,13033,21000,100,841),(54,'怡丽丝尔ELIXIR 纯肌净白防护精华乳 SPF50+ PA++++ 35毫升 保湿防晒隔离',5,'瓶装','79','0',3,1,'http://localhost:8080/commodityImg/5d7edeae866a41f98fda1dbfcf94a25f1560252518051jwrq2bv510352.jpg,http://localhost:8080/commodityImg/104fd23887f041cdb506f8d056e420ab1560252518365jwrq2c3w10353.jpg,	http://localhost:8080/commodityImg/59d554db369744c4a3c2ed80d665a4311560252518683jwrq2ccl10354.jpg','2019-12-31 15:19:22',200,12331,323322,100,841),(59,'【陈都灵同款】Coppertone确美同 水宝宝防汗防晒喷雾SPF50 170g',5,'盒装','55','0',3,1,'http://localhost:8080/commodityImg/bb1933c63ea54ea2971db5d42fdcf5761557050163243jvargr2t10280.jpg,	http://localhost:8080/commodityImg/f7fa5ab597b04d9e818cc06a82bdc50d1557050163415jvargr7l10281.jpg,	http://localhost:8080/commodityImg/e53a58f154a94432abc9b2eea2cce0851557050164384jvargryk10282.jpg','2019-12-31 15:19:22',200,13033,21000,100,841),(60,'Kanebo 佳丽宝 ALLIE防晒霜 物理防晒补水保湿防水防汗乳液 90克 SPF50+',5,'盒装','79','0',3,1,'http://localhost:8080/commodityImg/17a74fce2f42421abce5f74d028519431559647558163jwhpvxtm10231.jpg,	http://localhost:8080/commodityImg/a3f55535b1e34c39a798c9846a01f2f21559647558426jwhpvy1110233.jpg,	http://localhost:8080/commodityImg/66badf7956764cb3a3a711226c808d6f1559647558790jwhpvyb210235.jpg','2019-12-31 15:19:22',200,13033,21000,100,841),(62,'Kao 花王 Curél珂润润浸保湿洁颜泡沫 150毫升 任何肤质都hold住',1,'瓶装','75','0',1,1,'http://localhost:8080/commodityImg/a1.jpg,http://localhost:8080/commodityImg/a2.jpg,http://localhost:8080/commodityImg/a3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(63,'SHISEIDO 资生堂 UNO 男士洗面奶 黑炭控油/净透磨砂/润泽温和 130克',1,'瓶装','35','0',1,1,'http://localhost:8080/commodityImg/b1.jpg,http://localhost:8080/commodityImg/b2.jpg,http://localhost:8080/commodityImg/b3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(64,'Cure 酷韵 东洋 去角质凝胶 温和不刺激 日本进口 250g',1,'瓶装','135','0',1,1,'http://localhost:8080/commodityImg/c1.jpg,http://localhost:8080/commodityImg/c2.jpg,http://localhost:8080/commodityImg/c3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(66,'【温和氨基酸】Freeplus 芙丽芳丝 净润洗面霜 100g',1,'瓶装','98','0',1,1,'http://localhost:8080/commodityImg/e1.jpg,http://localhost:8080/commodityImg/e2.jpg,http://localhost:8080/commodityImg/e3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(67,'【林允同款】2件装｜SHISEIDO 资生堂 SENKA珊珂 洗颜专科绵润泡沫洁面乳120克/支 透明质酸 丰富泡沫',1,'瓶装','65','0',1,1,'http://localhost:8080/commodityImg/f1.jpg,http://localhost:8080/commodityImg/f2.jpg,http://localhost:8080/commodityImg/f3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(68,'SHISEIDO 资生堂 UNO 男士泡沫快速洁面奶 150毫升',1,'瓶装','35','0',1,1,'http://localhost:8080/commodityImg/g1.jpg,http://localhost:8080/commodityImg/g2.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(69,'SHISEIDO 资生堂 洗颜专科超微米洁颜乳 120克（新升级）',1,'瓶装','35','0',1,1,'http://localhost:8080/commodityImg/h1.jpg,http://localhost:8080/commodityImg/h2.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(70,'【包邮】Cure水润去角质凝胶 250克/瓶',1,'瓶装','134','0',1,1,'http://localhost:8080/commodityImg/i1.jpg,http://localhost:8080/commodityImg/i2.jpg,http://localhost:8080/commodityImg/i3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(71,'ROSETTE露姬婷 去角质啫喱 120克 挥别面部角质',1,'瓶装','45','0',1,1,'http://localhost:8080/commodityImg/j1.jpg,http://localhost:8080/commodityImg/j2.jpg,http://localhost:8080/commodityImg/j3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(72,'SHISEIDO 资生堂 男士清洁洗面奶 130克',1,'瓶装','129','0',1,1,'http://localhost:8080/commodityImg/k1.jpg,http://localhost:8080/commodityImg/k2.jpg,http://localhost:8080/commodityImg/k3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(73,'【胡一天同款】EltaMD 氨基酸泡沫卸妆洁面乳 207毫升',1,'瓶装','168','0',1,1,'http://localhost:8080/commodityImg/831e97cffba4491e91776c4173a9def41571276731530k1u1lhfb11112.jpg,http://localhost:8080/commodityImg/l2.jpg,http://localhost:8080/commodityImg/l3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(74,'【任选2件减10】Shiseido/资生堂洗颜专科洗面奶粉色 胶原蛋白精华洁面乳120g*3支 【保税】',1,'瓶装','109','0',1,1,'http://localhost:8080/commodityImg/m3.jpg,http://localhost:8080/commodityImg/m2.jpg,http://localhost:8080/commodityImg/m3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(75,'【打造\"天鹅颈\"】Xhekpon 天然胶原蛋白颈纹霜 40毫升*2支装 紧致肌肤',2,'瓶装','139','0',1,1,'http://localhost:8080/commodityImg/aa1.jpg,http://localhost:8080/commodityImg/aa2.jpg,http://localhost:8080/commodityImg/aa3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(76,'SHISEIDO 资生堂 悦薇紧致颈霜 75克',2,'瓶装','289','0',1,1,'http://localhost:8080/commodityImg/bb1.jpg,http://localhost:8080/commodityImg/bb2.jpg,http://localhost:8080/commodityImg/bb3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(77,'【官方授权】Balea芭乐雅 Bodyfit塑形美体紧致霜提拉紧肤',2,'瓶装','68','0',1,1,'http://localhost:8080/commodityImg/cc1.jpg,http://localhost:8080/commodityImg/cc2.jpg,http://localhost:8080/commodityImg/cc3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(78,'【重塑天鹅颈】【包邮正品保障】韩国Dermafirm 德妃颈霜淡化颈纹胶原蛋白紧致提拉颈纹霜颈部护理 40g/支',2,'瓶装','119','0',1,1,'http://localhost:8080/commodityImg/dd1.jpg,http://localhost:8080/commodityImg/dd2.jpg,http://localhost:8080/commodityImg/dd3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(79,'半亩花田六胜肽美颈霜提拉紧致劲纹女颈部护理嫩白脖子颈膜去淡化颈纹霜',2,'瓶装','89','0',1,1,'http://localhost:8080/commodityImg/ee1.jpg,http://localhost:8080/commodityImg/ee2.jpg,http://localhost:8080/commodityImg/ee3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(80,'freezeframe 胸部按摩膏 100毫升 胸部护理',2,'瓶装','268','0',1,1,'http://localhost:8080/commodityImg/ff1.jpg,http://localhost:8080/commodityImg/ff2.jpg,http://localhost:8080/commodityImg/ff3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(81,'KROKO 泰国健胸贴 美胸丰胸胸部紧致提拉 疏通乳腺肿块塑身美胸贴乳贴 5对/包*2',2,'瓶装','59','0',1,1,'http://localhost:8080/commodityImg/gg1.jpg,http://localhost:8080/commodityImg/gg2.jpg,http://localhost:8080/commodityImg/gg3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(82,'【官方正品】XHKEPON/佳科宝西班牙颈纹霜去淡化颈纹提拉紧致颈膜颈部护理颈霜美颈霜40ml',2,'瓶装','109','0',1,1,'http://localhost:8080/commodityImg/hh1.jpg,http://localhost:8080/commodityImg/hh2.jpg,http://localhost:8080/commodityImg/hh3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(83,'【媲美倩碧黄油】ISANA 活力Q10颈霜 Q10辅酶抑制氧化 延缓老化 紧致淡纹',2,'瓶装','53','0',1,1,'http://localhost:8080/commodityImg/ii1.jpg,http://localhost:8080/commodityImg/ii2.jpg,http://localhost:8080/commodityImg/ii3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(84,'【塑造无瑕天鹅美颈】Bb Laboratories 提拉紧致抚纹修护颈霜 50克',2,'瓶装','256','0',1,1,'http://localhost:8080/commodityImg/jj1.jpg,http://localhost:8080/commodityImg/jj2.jpg,http://localhost:8080/commodityImg/jj3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(85,'【迷人天鹅颈】CLARINS 娇韵诗 焕颜紧致颈霜 50毫升 淡化颈纹 低头族必备',2,'瓶装','545','0',1,1,'http://localhost:8080/commodityImg/kk1.jpg,http://localhost:8080/commodityImg/kk2.jpg,http://localhost:8080/commodityImg/kk3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(86,'【双11预售】【创新V型按摩颈霜】【自然旋律】六胜肽颈霜颈纹霜颈部护理紧致按摩脖子纹颈膜天鹅颈美颈120g',2,'瓶装','59','0',1,1,'http://localhost:8080/commodityImg/ll1.jpg,http://localhost:8080/commodityImg/ll2.jpg,http://localhost:8080/commodityImg/ll3.jpg','2019-12-31 15:19:22',150,12233,200,99,1),(87,'Vella 小熨斗紧致抚纹颈霜 (50毫升)',2,'瓶装','139','0',1,1,'http://localhost:8080/commodityImg/mm1.jpg,http://localhost:8080/commodityImg/mm2.jpg,http://localhost:8080/commodityImg/mm3.jpg','2019-12-31 15:19:22',150,12233,200,99,1);

/*Table structure for table `t_commodity_type` */

DROP TABLE IF EXISTS `t_commodity_type`;

CREATE TABLE `t_commodity_type` (
  `commodity_type_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类型id',
  `commodity_type` varchar(20) NOT NULL COMMENT '商品类型',
  `type` int(4) DEFAULT NULL,
  PRIMARY KEY (`commodity_type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `t_commodity_type` */

insert  into `t_commodity_type`(`commodity_type_ID`,`commodity_type`,`type`) values (1,'脸部护理',NULL),(2,'身体护理',NULL),(3,'洗发护发',NULL),(4,'唇部护理',NULL),(5,'防晒霜-防晒乳',1),(6,'乳液-面霜',1),(7,'口红-润唇膏-唇膜',4),(8,'面膜-洁面-化妆水',1),(9,'护手霜-沐浴露',2),(10,'香水彩妆',NULL),(11,'男士香水',10),(12,'女士香水',10),(13,'diy\r\n,礼品',NULL);

/*Table structure for table `t_evaluation` */

DROP TABLE IF EXISTS `t_evaluation`;

CREATE TABLE `t_evaluation` (
  `evaluation_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价Id',
  `user_Id` int(11) NOT NULL COMMENT '用户Id',
  `commodity_Id` int(11) NOT NULL COMMENT '商品Id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名称',
  `evaluation_content` varchar(100) NOT NULL COMMENT '评价内容',
  `evaluation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '商品评价时间',
  `evaluation_status` int(11) NOT NULL COMMENT '评价状态',
  PRIMARY KEY (`evaluation_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_evaluation` */

/*Table structure for table `t_order_information` */

DROP TABLE IF EXISTS `t_order_information`;

CREATE TABLE `t_order_information` (
  `order_form_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `id` int(11) NOT NULL COMMENT '与用户表关联键',
  `product_name` varchar(60) NOT NULL COMMENT '商品名称',
  `commodity_attribute` varchar(50) NOT NULL COMMENT '商品属性',
  `commodity_price` decimal(10,0) NOT NULL COMMENT '商品单价',
  `commodity_count` int(11) NOT NULL COMMENT '商品数量',
  `commodity_freight` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '商品运费',
  `subtotal` decimal(10,0) NOT NULL COMMENT '商品小计',
  `price` decimal(10,0) NOT NULL COMMENT '商品总计',
  `place_an_order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `payment_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '付款时间',
  `affirm_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '收货时间',
  `logistics_Id` varchar(50) DEFAULT NULL COMMENT '订单物流编号',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '商品状态',
  `commodity_Img` text NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`order_form_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_order_information` */

insert  into `t_order_information`(`order_form_Id`,`id`,`product_name`,`commodity_attribute`,`commodity_price`,`commodity_count`,`commodity_freight`,`subtotal`,`price`,`place_an_order_date`,`payment_time`,`affirm_date`,`logistics_Id`,`STATUS`,`commodity_Img`) values (1,3,'NatureRepublic自然共和国软管芦荟胶自然精粹芦荟面膜5片装 清爽水润','盒装','46',2,'0','0','267','2019-12-26 16:39:03','2019-12-26 16:39:03','1999-12-29 23:59:59','20191226163833197',3,'http://localhost:8080/commodityImg/7943428de7914d59ab8d08333ca64a8f1558593576310jw0adg0t10527.jpg,\nhttp://localhost:8080/commodityImg/41ef9419b32b414682f45d6a3bc92c231558593580093jw0adiy110501.jpg,\nhttp://localhost:8080/commodityImg/5bf49c2d3ff44742bf7d66feb71e871e1558593580529jw0adj9t10502.jpg'),(2,3,'【2件装 5种香型可选】Kao 花王 Merit Pyuan 弱酸性无硅油洗护套组 425ml*2','瓶装','89',1,'0','0','89','2019-12-26 16:48:02','2019-12-26 16:48:02','1999-12-29 23:59:59','2019122616473634',3,'http://localhost:8080/commodityImg/70ca08ef6f50415cbca0fb224f46c2651571995540925086218ca-8fb2-4aa9-8a27-e086e590d93e.jpg'),(3,3,'ANNA SUI 安娜苏 许愿精灵女士淡香水','瓶装','148',1000000,'0','0','148000','2019-12-26 16:53:08','2019-12-26 16:53:08','1999-12-29 23:59:59','20191226165253',3,'http://localhost:8080/commodityImg/O1CN01bJbVKy1m1xJGjQ15o_!!2200657724895-0-sm.jpg_430x430q90.jpg');

/*Table structure for table `t_shipping_address` */

DROP TABLE IF EXISTS `t_shipping_address`;

CREATE TABLE `t_shipping_address` (
  `shipping_address_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `NAME` varchar(10) NOT NULL COMMENT '收货人姓名',
  `moblie` varchar(20) NOT NULL COMMENT '收货人手机号',
  `address` varchar(40) NOT NULL COMMENT '收货地址',
  `postal` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `id` int(11) NOT NULL COMMENT '用户id',
  `STATUS` int(11) NOT NULL COMMENT '收货地址信息状态',
  PRIMARY KEY (`shipping_address_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_shipping_address` */

insert  into `t_shipping_address`(`shipping_address_Id`,`NAME`,`moblie`,`address`,`postal`,`id`,`STATUS`) values (4,'阿萨德','18744445656','澶╂触澶╂触鍗楀紑鍖�萨达斯','12',3,1);

/*Table structure for table `t_shopping_collection` */

DROP TABLE IF EXISTS `t_shopping_collection`;

CREATE TABLE `t_shopping_collection` (
  `shopping_collection_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `commodity_Id` int(11) NOT NULL COMMENT '商品id',
  `user_Id` int(11) NOT NULL COMMENT '用户id',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '商品收藏状态',
  PRIMARY KEY (`shopping_collection_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_shopping_collection` */

insert  into `t_shopping_collection`(`shopping_collection_Id`,`commodity_Id`,`user_Id`,`STATUS`) values (5,2,2,1),(8,3,1,1);

/*Table structure for table `t_shopping_trolley` */

DROP TABLE IF EXISTS `t_shopping_trolley`;

CREATE TABLE `t_shopping_trolley` (
  `shopping_trolley_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `commodity_Id` int(11) NOT NULL COMMENT '商品id',
  `user_Id` int(11) NOT NULL COMMENT '用户id',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '购物车状态',
  `count` int(11) NOT NULL DEFAULT '1' COMMENT '总个数',
  PRIMARY KEY (`shopping_trolley_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `t_shopping_trolley` */

insert  into `t_shopping_trolley`(`shopping_trolley_Id`,`commodity_Id`,`user_Id`,`STATUS`,`count`) values (9,12,1,1,1),(28,7,3,1,2),(29,11,3,1,7),(30,13,3,1,1),(31,22,3,1,1),(32,19,3,1,1);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `user_Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `head_portrait` varchar(200) DEFAULT '123' COMMENT '头像',
  `NAME` varchar(20) DEFAULT NULL COMMENT '姓名',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(50) NOT NULL COMMENT '密码',
  `sex` varchar(4) DEFAULT NULL COMMENT '性别',
  `moblie` varchar(20) DEFAULT NULL COMMENT ' 手机号',
  `IDnumber` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `register` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  `STATUS` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态',
  PRIMARY KEY (`user_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`user_Id`,`head_portrait`,`NAME`,`username`,`PASSWORD`,`sex`,`moblie`,`IDnumber`,`email`,`register`,`STATUS`) values (1,'http://localhost:8080/store/userHeadPortrait','zc','张','456789','男','12','12','zhangchendad@163.com','2019-12-22 13:33:44',1),(2,'123','zz','小明','123456','男','12','12','12@163.com','2019-12-19 14:18:11',1),(3,NULL,NULL,'王','741a627471982d84d67177464d006a01',NULL,NULL,NULL,'744338002@qq.com','2019-12-26 13:58:06',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
