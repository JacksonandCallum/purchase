/*
 Navicat Premium Dump SQL

 Source Server         : localhost-mysql
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : purchase

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 30/04/2025 14:15:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1697438073596-avatar.png', 'ADMIN', '13677889922', 'admin@xm.com');

-- ----------------------------
-- Table structure for data_matching
-- ----------------------------
DROP TABLE IF EXISTS `data_matching`;
CREATE TABLE `data_matching`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `SKU` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'sku',
  `MSKU` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '美国MSKU',
  `FNSKU` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '美国FNSKU',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品名',
  `attribute` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '属性',
  `factory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '工厂',
  `cartons_number` int NULL DEFAULT NULL COMMENT '装箱数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2634 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '数据匹配表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of data_matching
-- ----------------------------
INSERT INTO `data_matching` VALUES (1337, 'UTSPOONS01-9', 'UTSPOONS-9P-FBA', 'X001X8Z8T7', '量勺9件套', '/', 'YJ', 100);
INSERT INTO `data_matching` VALUES (1338, 'UTSPOONS01-8', 'UTSPOONS-8P-FBA', 'X001X92UV5', '量勺8件套', '/', 'YJ', 100);
INSERT INTO `data_matching` VALUES (1339, 'UTSPOONS01-7', 'UTSPOONS001-7P-FBA', 'X001SFTCNX', '量勺7件套', '/', 'YJ', 100);
INSERT INTO `data_matching` VALUES (1340, 'UTSPOONS01-6', 'UTSPOONS-6P-FBA', 'X001W8G1JJ', '量勺6件套', '/', 'YJ', 100);
INSERT INTO `data_matching` VALUES (1341, 'UTCUPS-7', 'UTCUPS-7P-FBA', 'X001K6C9QR', '量杯7件套', '/', 'YJ', 30);
INSERT INTO `data_matching` VALUES (1342, 'UTCUPS-15', 'UTCUPS-15PCA-FBA', 'X001LXP38P', '量杯15件套', '/', 'YJ', 24);
INSERT INTO `data_matching` VALUES (1343, 'SR01-4-AquaSky', 'SR01-4-AquaSky-US-FBA', 'X0046JZEIP', '擀面杖硅胶环四组', '水天色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1344, 'SMS01-Set8-S', '', '', '方形量勺8件套', '数量：8件套', 'YJ', 60);
INSERT INTO `data_matching` VALUES (1345, 'SMS01-Set7-S', '', '', '方形量勺7件套', '数量：7件套', 'YJ', 60);
INSERT INTO `data_matching` VALUES (1346, 'SMS01-Set6-S', '', '', '方形量勺6件套', '数量：6件套', 'YJ', 60);
INSERT INTO `data_matching` VALUES (1347, 'SMC01-12-S', '', '', '不锈钢量杯12件套', '银色', 'YJ', 24);
INSERT INTO `data_matching` VALUES (1348, 'SLS01-Set2B-32', '', '', '硅胶蒸笼垫文字2件套', '32cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1349, 'SLS01-Set2B-26', '', '', '硅胶蒸笼垫文字2件套', '26cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1350, 'SLS01-Set2B-22', '', '', '硅胶蒸笼垫文字2件套', '22cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1351, 'SLS01-Set2B-18', '', '', '硅胶蒸笼垫文字2件套', '18cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1352, 'SLS01-Set2A-32', '', '', '硅胶蒸笼垫图案2件套', '32cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1353, 'SLS01-Set2A-26', '', '', '硅胶蒸笼垫图案2件套', '26cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1354, 'SLS01-Set2A-22', '', '', '硅胶蒸笼垫图案2件套', '22cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1355, 'SLS01-Set2A-18', '', '', '硅胶蒸笼垫图案2件套', '18cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1356, 'SLS01-Set2-32', '', '', '硅胶蒸笼垫2件套', '32cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1357, 'SLS01-Set2-26', '', '', '硅胶蒸笼垫2件套', '26cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1358, 'SLS01-Set2-22', '', '', '硅胶蒸笼垫2件套', '22cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1359, 'SLS01-Set2-18', '', '', '硅胶蒸笼垫2件套', '18cm', 'JS', 200);
INSERT INTO `data_matching` VALUES (1360, 'SFS01-S-R', '', '', '硅胶滤勺小号', '红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (1361, 'SFS01-S-P', '', '', '硅胶滤勺小号', '紫色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (1362, 'SFS01-S-O', '', '', '硅胶滤勺小号', '橙色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (1363, 'SFS01-S-MB', '', '', '硅胶滤勺小号', '午夜蓝', 'RF', NULL);
INSERT INTO `data_matching` VALUES (1364, 'SFS01-S-BK', '', '', '硅胶滤勺小号', '黑色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (1365, 'SFS01-S-AS', '', '', '硅胶滤勺小号', '水天色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (1366, 'Scoop01-2', 'Scoop-2-FBA', 'X001XTUO59', '咖啡勺2件套', '/', 'YJ', 100);
INSERT INTO `data_matching` VALUES (1367, 'Scoop01-1', 'Scoop-2Tbsp-SnL', 'X002Q8LXGZ', '咖啡勺', '30ml', 'YJ', 100);
INSERT INTO `data_matching` VALUES (1368, 'SC02-SSet2-BK', 'SC02-SSet2-BK-US-FBA', 'X0041ZU53X', '长手柄咖啡勺小号两件套黑色', '黑色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (1369, 'SC02-S30-BK', 'SC02-S30-BK-US-FBA', 'X0041ZU55B', '长手柄咖啡勺小号30ml黑色', '黑色', 'YJ', 200);
INSERT INTO `data_matching` VALUES (1370, 'SC02-S15-BK', 'SC02-S15-BK-US-FBA', 'X0041ZR1KX', '长手柄咖啡勺小号15ml黑色', '黑色', 'YJ', 200);
INSERT INTO `data_matching` VALUES (1371, 'SC02-MSet2-S', 'SC02-MSet2-S-US-FBA', 'X0041ZU709', '长手柄咖啡勺中号两件套银色', '银色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (1372, 'SC02-M30-S', 'SC02-M30-S-US-FBA', 'X0041ZU56P', '长手柄咖啡勺中号30ml银色', '银色', 'YJ', 180);
INSERT INTO `data_matching` VALUES (1373, 'SC02-M15-S', 'SC02-M15-S-US-FBA', 'X0041ZU583', '长手柄咖啡勺中号15ml银色', '银色', 'YJ', 180);
INSERT INTO `data_matching` VALUES (1374, 'SC02-LSet2-S', 'SC02-LSet2-S-US-FBA', 'X0041ZR1OJ', '长手柄咖啡勺大号两件套银色', '银色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (1375, 'SC02-L30-S', 'SC02-L30-S-US-FBA', 'X0041ZU7EP', '长手柄咖啡勺大号30ml银色', '银色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (1376, 'SC02-L15-S', 'SC02-L15-S-US-FBA', 'X0041ZU6W3', '长手柄咖啡勺大号15ml银色', '银色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (1377, 'SC01-30Set2-S', 'SC01-30Set2-S-US-FBA', 'X0046JVKNX', '咖啡勺2件套30ml', '银色', 'YJ', 80);
INSERT INTO `data_matching` VALUES (1378, 'SC01-15Set2-S', 'SC01-15Set2-S-US-FBA', 'X0046K1IMZ', '咖啡勺2件套15ml', '银色', 'YJ', 120);
INSERT INTO `data_matching` VALUES (1379, 'SC01-15-S', 'SC01-15-S-US-SnL', 'X003Q73UIT', '咖啡勺15ml', '15ml', 'YJ', 150);
INSERT INTO `data_matching` VALUES (1380, 'SBS01-S2-O', 'SBS01-S2-O-US-FBA', 'X0048X3RO7', '硅胶荷兰垫小号2件套', '橙色', 'JS', 80);
INSERT INTO `data_matching` VALUES (1381, 'SBS01-S2-MUL', 'SBS01-S2-MUL-US-FBA', 'X0048WZFX9', '硅胶荷兰垫小号2件套', '混色', 'JS', 80);
INSERT INTO `data_matching` VALUES (1382, 'SBS01-S2-MB', 'SBS01-S2-MB-US-FBA', 'X0048X3S7D', '硅胶荷兰垫小号2件套', '午夜蓝', 'JS', 80);
INSERT INTO `data_matching` VALUES (1383, 'SBS01-S2-GY', 'SBS01-S2-GY-US-FBA', 'X0048XAYZR', '硅胶荷兰垫小号2件套', '灰色', 'JS', 80);
INSERT INTO `data_matching` VALUES (1384, 'SBS01-S2-AS', 'SBS01-S2-AS-US-FBA', 'X0048X85UN', '硅胶荷兰垫小号2件套', '水天色', 'JS', 80);
INSERT INTO `data_matching` VALUES (1385, 'SBS01-S-AS', '', '', '硅胶荷兰垫小号', '水天色', 'JS', 80);
INSERT INTO `data_matching` VALUES (1386, 'SB01-8Set6-TSB', '', '', '8盎司挤酱瓶6件套', '/', 'YB', 48);
INSERT INTO `data_matching` VALUES (1387, 'SB01-24-Set6-TSB', 'SB01-24-Set6-TSB-CA-FBA', 'X003FDZ2HL', '24盎司挤酱瓶6件套', '/', 'YB', 16);
INSERT INTO `data_matching` VALUES (1388, 'SB01-16-Set6-TSB', 'SB01-16-Set6-TSB-CA-FBA', 'X002ZHKAP7', '16盎司挤酱瓶6件套', '/', 'YB', 24);
INSERT INTO `data_matching` VALUES (1389, 'SB01-12Set6-TSB', '', '', '12盎司挤酱瓶6件套', '/', 'YB', 30);
INSERT INTO `data_matching` VALUES (1390, 'RP02-40-BN', '', '', '木擀面杖', '', 'QJ', 80);
INSERT INTO `data_matching` VALUES (1391, 'RP02-30-BN', '', '', '木擀面杖', '', 'QJ', 100);
INSERT INTO `data_matching` VALUES (1392, 'RP01-16-AquaSky', '', '', '擀面杖16英寸', '/', 'RF', 30);
INSERT INTO `data_matching` VALUES (1393, 'RP01-16', '', '', '擀面杖16英寸', '/', 'RF', 30);
INSERT INTO `data_matching` VALUES (1394, 'PT01M-Set6-S', '', '', '中号裱花嘴6件套', '/', 'FX', 100);
INSERT INTO `data_matching` VALUES (1395, 'PT01-M40-S', '', '', '中号裱花嘴', '造型：玫瑰', 'FX', 1000);
INSERT INTO `data_matching` VALUES (1396, 'PT01-M30-S', '', '', '中号裱花嘴', '造型：圣安娜', 'FX', 1000);
INSERT INTO `data_matching` VALUES (1397, 'PT01-M28A-S', '', '', '中号裱花嘴', '造型：珍妮曲奇', 'FX', 1000);
INSERT INTO `data_matching` VALUES (1398, 'PT01-M28-S', '', '', '中号裱花嘴', '造型：8齿', 'FX', 1000);
INSERT INTO `data_matching` VALUES (1399, 'PT01-M218-S', '', '', '中号裱花嘴', '造型：18齿', 'FX', 1000);
INSERT INTO `data_matching` VALUES (1400, 'PT01-M210-S', '', '', '中号裱花嘴', '造型：10齿', 'FX', 1000);
INSERT INTO `data_matching` VALUES (1401, 'PT01-M10-S', '', '', '中号裱花嘴', '造型：圆口', 'FX', 1000);
INSERT INTO `data_matching` VALUES (1402, 'PM02-5070-TSB2', '', '', '揉面垫印刷款5070磨砂透明款', '磨砂透明', 'RF', 20);
INSERT INTO `data_matching` VALUES (1403, 'PM02-5070-AS', 'PM02-5070-AS-US-FBA', 'X004BQQU27', '揉面垫印刷款5070', '水天色', 'RF', 20);
INSERT INTO `data_matching` VALUES (1404, 'PM02-4050-TSB2', '', '', '揉面垫印刷款4050磨砂透明款', '磨砂透明', 'RF', 24);
INSERT INTO `data_matching` VALUES (1405, 'PM02-4050-AS', 'PM02-4050-AS-US-FBA', 'X004BR2VYR', '揉面垫印刷款4050', '水天色', 'RF', 24);
INSERT INTO `data_matching` VALUES (1406, 'OP-EUUT05-Set5-R', '', '', '铂金欧标硅胶厨具5件套', '红色', 'RF', 15);
INSERT INTO `data_matching` VALUES (1407, 'OP-EUUT05-Set5-P', '', '', '铂金欧标硅胶厨具5件套', '紫色', 'RF', 15);
INSERT INTO `data_matching` VALUES (1408, 'OP-EUUT05-Set5-O', '', '', '铂金欧标硅胶厨具5件套', '橙色', 'RF', 15);
INSERT INTO `data_matching` VALUES (1409, 'OP-EUUT05-Set5-MB', '', '', '铂金欧标硅胶厨具5件套', '午夜蓝', 'RF', 15);
INSERT INTO `data_matching` VALUES (1410, 'OP-EUUT05-Set5-BK', '', '', '铂金欧标硅胶厨具5件套', '黑色', 'RF', 15);
INSERT INTO `data_matching` VALUES (1411, 'OP-EUUT05-Set5-AS', '', '', '铂金欧标硅胶厨具5件套', '水天色', 'RF', 15);
INSERT INTO `data_matching` VALUES (1412, 'OP-EUUT03-Set5-R', 'OP-EUUT03-Set5-R-US-FBA', 'X003XV5KC7', '升级款欧标硅胶厨具5件套', '红色', 'RF', 15);
INSERT INTO `data_matching` VALUES (1413, 'OP-EUUT03-Set5-P', 'OP-EUUT03-Set5-P-US-FBA', 'X003XVD0IX', '升级款欧标硅胶厨具5件套', '紫色', 'RF', 15);
INSERT INTO `data_matching` VALUES (1414, 'OP-EUUT03-Set5-O', 'OP-EUUT03-Set5-O-US-FBA', 'X003XV5HY3', '升级款欧标硅胶厨具5件套', '橙色', 'RF', 15);
INSERT INTO `data_matching` VALUES (1415, 'OP-EUUT03-Set5-MB', 'OP-EUUT03-Set5-MB-US-FBA', 'X003XVD0LZ', '升级款欧标硅胶厨具5件套', '午夜蓝', 'RF', 15);
INSERT INTO `data_matching` VALUES (1416, 'OP-EUUT03-Set5-BK', 'OP-EUUT03-Set5-BK-US-FBA', 'X003XV5HNJ', '升级款欧标硅胶厨具5件套', '黑色', 'RF', 15);
INSERT INTO `data_matching` VALUES (1417, 'OP-EUUT03-Set5-AS', 'OP-EUUT03-Set5-T-US-FBA', 'X003XV7FQL', '升级款欧标硅胶厨具5件套', '水天色', 'RF', 15);
INSERT INTO `data_matching` VALUES (1418, 'OP-EUTN06-M-R', '', '', '铂金欧标硅胶镂铲', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1419, 'OP-EUTN06-M-P', '', '', '铂金欧标硅胶镂铲', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1420, 'OP-EUTN06-M-O', '', '', '铂金欧标硅胶镂铲', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1421, 'OP-EUTN06-M-MB', '', '', '铂金欧标硅胶镂铲', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (1422, 'OP-EUTN06-M-BK', '', '', '铂金欧标硅胶镂铲', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1423, 'OP-EUTN06-M-AS', '', '', '铂金欧标硅胶镂铲', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1424, 'OP-EUTN0506-Set2-R', '', '', '铂金欧标硅胶铲组合2件套', '红色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1425, 'OP-EUTN0506-Set2-P', '', '', '铂金欧标硅胶铲组合2件套', '紫色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1426, 'OP-EUTN0506-Set2-O', '', '', '铂金欧标硅胶铲组合2件套', '橙色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1427, 'OP-EUTN0506-Set2-MB', '', '', '铂金欧标硅胶铲组合2件套', '午夜蓝', 'RF', 55);
INSERT INTO `data_matching` VALUES (1428, 'OP-EUTN0506-Set2-BK', '', '', '铂金欧标硅胶铲组合2件套', '黑色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1429, 'OP-EUTN0506-Set2-AS', '', '', '铂金欧标硅胶铲组合2件套', '水天色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1430, 'OP-EUTN05-M-R', '', '', '铂金欧标硅胶翻铲', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1431, 'OP-EUTN05-M-P', '', '', '铂金欧标硅胶翻铲', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1432, 'OP-EUTN05-M-O', '', '', '铂金欧标硅胶翻铲', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1433, 'OP-EUTN05-M-MB', '', '', '铂金欧标硅胶翻铲', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (1434, 'OP-EUTN05-M-BK', '', '', '铂金欧标硅胶翻铲', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1435, 'OP-EUTN05-M-AS', '', '', '铂金欧标硅胶翻铲', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1436, 'OP-EUTN04-M-R', 'OP-EUTN04-M-R-US-FBA', 'X003XVNF0L', '升级款欧标硅胶镂铲', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1437, 'OP-EUTN04-M-P', 'OP-EUTN04-M-P-US-FBA', 'X003XVL8UF', '升级款欧标硅胶镂铲', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1438, 'OP-EUTN04-M-O', 'OP-EUTN04-M-O-US-FBA', 'X003XVNLR3', '升级款欧标硅胶镂铲', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1439, 'OP-EUTN04-M-MB', 'OP-EUTN04-M-MB-US-FBA', 'X003XVKKFT', '升级款欧标硅胶镂铲', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (1440, 'OP-EUTN04-M-BK', 'OP-EUTN04-M-BK-US-FBA', 'X003XVNFD3', '升级款欧标硅胶镂铲', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1441, 'OP-EUTN04-M-AS', 'OP-EUTN04-M-AS-US-FBA', 'X003XVCTFX', '升级款欧标硅胶镂铲', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1442, 'OP-EUTN0304-Set2-R', 'OP-EUTN0304-Set2-R-US01-FBA', 'X004E5USDH', '升级款欧标硅胶铲组合2件套', '红色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1443, 'OP-EUTN0304-Set2-P', 'OP-EUTN0304-Set2-P-US-FBA', 'X0049LHJ01', '升级款欧标硅胶铲组合2件套', '紫色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1444, 'OP-EUTN0304-Set2-O', 'OP-EUTN0304-Set2-O-US-FBA', 'X0049LROND', '升级款欧标硅胶铲组合2件套', '橙色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1445, 'OP-EUTN0304-Set2-MB', 'OP-EUTN0304-Set2-MB-US-FBA', 'X0049LPBIX', '升级款欧标硅胶铲组合2件套', '午夜蓝', 'RF', 55);
INSERT INTO `data_matching` VALUES (1446, 'OP-EUTN0304-Set2-BK', 'OP-EUTN0304-Set2-BK-US01-FBA', 'X004E5OHZ7', '升级款欧标硅胶铲组合2件套', '黑色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1447, 'OP-EUTN0304-Set2-AS', 'OP-EUTN0304-Set2-AS-US-FBA', 'X0049LRN89', '升级款欧标硅胶铲组合2件套', '水天色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1448, 'OP-EUTN03-M-R', 'OP-EUTN03-M-R-US-FBA', 'X003XVJBL3', '升级款欧标硅胶翻铲', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1449, 'OP-EUTN03-M-P', 'OP-EUTN03-M-P-US-FBA', 'X003XVJPQJ', '升级款欧标硅胶翻铲', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1450, 'OP-EUTN03-M-O', 'OP-EUTN03-M-O-US-FBA', 'X003XVL92H', '升级款欧标硅胶翻铲', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1451, 'OP-EUTN03-M-MB', 'OP-EUTN03-M-MB-US-FBA', 'X003XVJ77B', '升级款欧标硅胶翻铲', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (1452, 'OP-EUTN03-M-BK', 'OP-EUTN03-M-BK-US-FBA', 'X003XVJBX1', '升级款欧标硅胶翻铲', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1453, 'OP-EUTN03-M-AS', 'OP-EUTN01-M-AS-US-FBA', 'X003SDVRA9', '升级款欧标硅胶翻铲', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1454, 'OP-EUSP06-M-R', '', '', '铂金欧标硅胶镂空分餐勺', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1455, 'OP-EUSP06-M-P', '', '', '铂金欧标硅胶镂空分餐勺', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1456, 'OP-EUSP06-M-O', '', '', '铂金欧标硅胶镂空分餐勺', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1457, 'OP-EUSP06-M-MB', '', '', '铂金欧标硅胶镂空分餐勺', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (1458, 'OP-EUSP06-M-BK', '', '', '铂金欧标硅胶镂空分餐勺', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1459, 'OP-EUSP06-M-AS', '', '', '铂金欧标硅胶镂空分餐勺', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1460, 'OP-EUSP0506-Set2-R', '', '', '铂金欧标硅胶分餐勺组合2件套', '红色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1461, 'OP-EUSP0506-Set2-P', '', '', '铂金欧标硅胶分餐勺组合2件套', '紫色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1462, 'OP-EUSP0506-Set2-O', '', '', '铂金欧标硅胶分餐勺组合2件套', '橙色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1463, 'OP-EUSP0506-Set2-MB', '', '', '铂金欧标硅胶分餐勺组合2件套', '午夜蓝', 'RF', 55);
INSERT INTO `data_matching` VALUES (1464, 'OP-EUSP0506-Set2-BK', '', '', '铂金欧标硅胶分餐勺组合2件套', '黑色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1465, 'OP-EUSP0506-Set2-AS', '', '', '铂金欧标硅胶分餐勺组合2件套', '水天色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1466, 'OP-EUSP05-M-R', '', '', '铂金欧标硅胶分餐勺', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1467, 'OP-EUSP05-M-P', '', '', '铂金欧标硅胶分餐勺', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1468, 'OP-EUSP05-M-O', '', '', '铂金欧标硅胶分餐勺', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1469, 'OP-EUSP05-M-MB', '', '', '铂金欧标硅胶分餐勺', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (1470, 'OP-EUSP05-M-BK', '', '', '铂金欧标硅胶分餐勺', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1471, 'OP-EUSP05-M-AS', '', '', '铂金欧标硅胶分餐勺', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1472, 'OP-EUSP04-M-R', 'OP-EUSP04-M-R-US-FBA', 'X003XV5KEF', '升级款欧标硅胶镂空分餐勺', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1473, 'OP-EUSP04-M-P', 'OP-EUSP04-M-P-US-FBA', 'X003XV5IM9', '升级款欧标硅胶镂空分餐勺', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1474, 'OP-EUSP04-M-O', 'OP-EUSP04-M-O-US-FBA', 'X003XV5KCH', '升级款欧标硅胶镂空分餐勺', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1475, 'OP-EUSP04-M-MB', 'OP-EUSP04-M-MB-US-FBA', 'X003XVD0T7', '升级款欧标硅胶镂空分餐勺', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (1476, 'OP-EUSP04-M-BK', 'OP-EUSP04-M-BK-US-FBA', 'X003XV5I8D', '升级款欧标硅胶镂空分餐勺', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1477, 'OP-EUSP04-M-AS', 'OP-EUSP04-M-AS-US-FBA', 'X003XV5HRP', '升级款欧标硅胶镂空分餐勺', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1478, 'OP-EUSP0304-Set2-R', 'OP-EUSP0304-Set2-R-US-FBA', 'X0049LRNP7', '升级款欧标硅胶分餐勺组合2件套', '红色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1479, 'OP-EUSP0304-Set2-P', 'OP-EUSP0304-Set2-P-US-FBA', 'X0049LS0I1', '升级款欧标硅胶分餐勺组合2件套', '紫色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1480, 'OP-EUSP0304-Set2-O', 'OP-EUSP0304-Set2-O-US-FBA', 'X0049LHIYX', '升级款欧标硅胶分餐勺组合2件套', '橙色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1481, 'OP-EUSP0304-Set2-MB', 'OP-EUSP0304-Set2-MB-US-FBA', 'X0049LHIU7', '升级款欧标硅胶分餐勺组合2件套', '午夜蓝', 'RF', 55);
INSERT INTO `data_matching` VALUES (1482, 'OP-EUSP0304-Set2-BK', 'OP-EUSP0304-Set2-BK-US-FBA', 'X0049LLL4B', '升级款欧标硅胶分餐勺组合2件套', '黑色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1483, 'OP-EUSP0304-Set2-AS', 'OP-EUSP0304-Set2-AS-US-FBA', 'X0049LHJBZ', '升级款欧标硅胶分餐勺组合2件套', '水天色', 'RF', 55);
INSERT INTO `data_matching` VALUES (1484, 'OP-EUSP03-M-R', 'OP-EUSP03-M-R-US-FBA', 'X003XV5KGX', '升级款欧标硅胶分餐勺', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1485, 'OP-EUSP03-M-P', 'OP-EUSP03-M-P-US-FBA', 'X003XV5HSJ', '升级款欧标硅胶分餐勺', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1486, 'OP-EUSP03-M-O', 'OP-EUSP03-M-O-US-FBA', 'X003XVD0I3', '升级款欧标硅胶分餐勺', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1487, 'OP-EUSP03-M-MB', 'OP-EUSP03-M-MB-US-FBA', 'X003XV5KT5', '升级款欧标硅胶分餐勺', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (1488, 'OP-EUSP03-M-BK', 'OP-EUSP03-M-BK-US-FBA', 'X003XV5IFB', '升级款欧标硅胶分餐勺', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1489, 'OP-EUSP03-M-AS', 'OP-EUSP03-M-AS-US-FBA', 'X003XV5HQV', '升级款欧标硅胶分餐勺', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (1490, 'OP-EUSL05-M-R', '', '', '铂金欧标硅胶汤勺', '红色', 'RF', 80);
INSERT INTO `data_matching` VALUES (1491, 'OP-EUSL05-M-P', '', '', '铂金欧标硅胶汤勺', '紫色', 'RF', 80);
INSERT INTO `data_matching` VALUES (1492, 'OP-EUSL05-M-O', '', '', '铂金欧标硅胶汤勺', '橙色', 'RF', 80);
INSERT INTO `data_matching` VALUES (1493, 'OP-EUSL05-M-MB', '', '', '铂金欧标硅胶汤勺', '午夜蓝', 'RF', 80);
INSERT INTO `data_matching` VALUES (1494, 'OP-EUSL05-M-BK', '', '', '铂金欧标硅胶汤勺', '黑色', 'RF', 80);
INSERT INTO `data_matching` VALUES (1495, 'OP-EUSL05-M-AS', '', '', '铂金欧标硅胶汤勺', '水天色', 'RF', 80);
INSERT INTO `data_matching` VALUES (1496, 'OP-EUSL03-M-R', 'OP-EUSL03-M-R-US-FBA', 'X003UY2GRT', '升级款欧标硅胶汤勺', '红色', 'RF', 80);
INSERT INTO `data_matching` VALUES (1497, 'OP-EUSL03-M-P', 'OP-EUSL03-M-P-US-FBA', 'X003UY9VDL', '升级款欧标硅胶汤勺', '紫色', 'RF', 80);
INSERT INTO `data_matching` VALUES (1498, 'OP-EUSL03-M-O', '', '', '升级款欧标硅胶汤勺', '橙色', 'RF', 80);
INSERT INTO `data_matching` VALUES (1499, 'OP-EUSL03-M-MB', 'OP-EUSL03-M-MB-US-FBA', 'X003UY5397', '升级款欧标硅胶汤勺', '午夜蓝', 'RF', 80);
INSERT INTO `data_matching` VALUES (1500, 'OP-EUSL03-M-BK', 'OP-EUSL01-M-BK-US-FBA', 'X00366PNTT', '升级款欧标硅胶汤勺', '黑色', 'RF', 80);
INSERT INTO `data_matching` VALUES (1501, 'OP-EUSL03-M-AS', 'OP-EUSL03-M-AS-US-FBA', 'X003UY8WS1', '升级款欧标硅胶汤勺', '水天色', 'RF', 80);
INSERT INTO `data_matching` VALUES (1502, 'N-OP-Bs01-S-O', '', '', '硅胶刷小号', '橙色', '待定', 150);
INSERT INTO `data_matching` VALUES (1503, 'N-OP-Bs01-S-LB', '', '', '硅胶刷小号', '湖蓝色', '待定', 150);
INSERT INTO `data_matching` VALUES (1504, 'N-OP-Bs01-L-AS', '', '', '硅胶刷大号', '水天色', '待定', 150);
INSERT INTO `data_matching` VALUES (1505, 'MS01-5', 'MS01-5-US-FBA', 'X0047QA1SZ', '量勺5件套', '/', 'YJ', 100);
INSERT INTO `data_matching` VALUES (1506, 'MMC-13-Color', 'MMC01-13-FBA', 'X002ANVEJ7', '量杯13件套', '混色', 'YJ', 24);
INSERT INTO `data_matching` VALUES (1507, 'MCC', 'MCC01-SnL', 'X002Q8OWX1', '刻度板', '/', 'YJ', 150);
INSERT INTO `data_matching` VALUES (1508, 'MC03-12-MUL', 'MC03-12-MUL-US-FBA', 'X003DWK0S5', '量杯12件套', '混色', 'HY', 20);
INSERT INTO `data_matching` VALUES (1509, 'MC03-12-MB', 'MC03-12-MB-US-FBA', 'X0043U55FT', '量杯12件套', '午夜蓝', 'HY', 20);
INSERT INTO `data_matching` VALUES (1510, 'MC03-12-BK', 'MC03-12-BK-US-FBA', 'X003631W15', '量杯12件套', '黑色', 'HY', 20);
INSERT INTO `data_matching` VALUES (1511, 'MC03-12-AS', 'MC03-12-AS-US-FBA', 'X003631QZ7', '量杯12件套', '水天色', 'HY', 20);
INSERT INTO `data_matching` VALUES (1512, 'MC03-10-T', 'MC03-10-T-US-FBA', 'X0036B3L2F', '量杯10件套', '深绿色', 'HY', 24);
INSERT INTO `data_matching` VALUES (1513, 'MC03-10-R', 'MC03-10-R-US-FBA', 'X003DWOY4B', '量杯10件套', '红色', 'HY', 24);
INSERT INTO `data_matching` VALUES (1514, 'MC03-10-P', 'MC03-10-P-US-FBA', 'X003DWGSQ3', '量杯10件套', '紫色', 'HY', 24);
INSERT INTO `data_matching` VALUES (1515, 'MC03-10-O', 'MC03-10-O-US-FBA', 'X003DJZLZP', '量杯10件套', '橙色', 'HY', 24);
INSERT INTO `data_matching` VALUES (1516, 'MC03-10-MUL', 'MC03-10-MUL-US-FBA', 'X003DWTFHH', '量杯10件套', '混色', 'HY', 24);
INSERT INTO `data_matching` VALUES (1517, 'MC03-10-MB', 'MC03-10-MB-US-FBA', 'X0043UB98L', '量杯10件套', '午夜蓝', 'HY', 24);
INSERT INTO `data_matching` VALUES (1518, 'MC03-10-BK', 'MC03-10-BK-US-FBA', 'X003D72MTP', '量杯10件套', '黑色', 'HY', 24);
INSERT INTO `data_matching` VALUES (1519, 'MC03-10-B', 'MC03-10-B-US-FBA', 'X003DWOY3H', '量杯10件套', '蓝色', 'HY', 24);
INSERT INTO `data_matching` VALUES (1520, 'MC03-10-AS', 'MC03-10-AS-US-FBA', 'X003D7J9G9', '量杯10件套', '水天色', 'HY', 24);
INSERT INTO `data_matching` VALUES (1521, 'KT02S-Set3-R', 'PremiumKT02S-Set3-R-US-FBA', 'X003C7W6MJ', '硅胶夹头食物夹3件套', '红色', 'FR', 30);
INSERT INTO `data_matching` VALUES (1522, 'KT02S-Set3-P', 'PremiumKT02S-Set3-P-US-FBA', 'X003C7W2ZF', '硅胶夹头食物夹3件套', '紫色', 'FR', 30);
INSERT INTO `data_matching` VALUES (1523, 'KT02S-Set3-O', 'PremiumKT02S-Set3-O-US-FBA', 'X003C7QAE9', '硅胶夹头食物夹3件套', '橙色', 'FR', 30);
INSERT INTO `data_matching` VALUES (1524, 'KT02S-Set3-MB', 'PremiumKT02S-Set3-MB-US-FBA', 'X003JAL8QJ', '硅胶夹头食物夹3件套', '午夜蓝', 'FR', 30);
INSERT INTO `data_matching` VALUES (1525, 'KT02S-Set3-BK', 'PremiumKT02S-Set3-BK-US-FBA', 'X003C7Q9T5', '硅胶夹头食物夹3件套', '黑色', 'FR', 30);
INSERT INTO `data_matching` VALUES (1526, 'KT02S-Set3-AS', 'PremiumKT02S-Set3-AS-US-FBA', 'X003C7W6GZ', '硅胶夹头食物夹3件套', '水天色', 'FR', 30);
INSERT INTO `data_matching` VALUES (1527, 'KT02S-Set2-R', 'PremiumKT02S-Set2-R-US-FBA', 'X003D6SE11', '硅胶夹头食物夹2件套', '红色', 'FR', 40);
INSERT INTO `data_matching` VALUES (1528, 'KT02S-Set2-P', 'PremiumKT02S-Set2-P-US-FBA', 'X003D7882Z', '硅胶夹头食物夹2件套', '紫色', 'FR', 40);
INSERT INTO `data_matching` VALUES (1529, 'KT02S-Set2-O', 'PremiumKT02S-Set2-O-US-FBA', 'X003D6XS53', '硅胶夹头食物夹2件套', '橙色', 'FR', 40);
INSERT INTO `data_matching` VALUES (1530, 'KT02S-Set2-MB', 'PremiumKT02S-Set2-MB-US-FBA', 'X003D6SE1B', '硅胶夹头食物夹2件套', '午夜蓝', 'FR', 40);
INSERT INTO `data_matching` VALUES (1531, 'KT02S-Set2-BK', 'PremiumKT02S-Set2-BK-US-FBA', 'X003D7DXP7', '硅胶夹头食物夹2件套', '黑色', 'FR', 40);
INSERT INTO `data_matching` VALUES (1532, 'KT02S-Set2-AS', 'PremiumKT02S-Set2-AS-US-FBA', 'X003D6SDZD', '硅胶夹头食物夹2件套', '水天色', 'FR', 40);
INSERT INTO `data_matching` VALUES (1533, 'KT02S-9-R', 'KT02S-9-R-US-FBA', 'X003D7DXON', '硅胶夹头食物夹9寸', '红色', 'FR', 90);
INSERT INTO `data_matching` VALUES (1534, 'KT02S-9-P', 'KT02S-9-P-US-FBA', 'X003D6XS4J', '硅胶夹头食物夹9寸', '紫色', 'FR', 90);
INSERT INTO `data_matching` VALUES (1535, 'KT02S-9-O', 'KT02S-9-O-US-FBA', 'X003D6SE07', '硅胶夹头食物夹9寸', '橙色', 'FR', 90);
INSERT INTO `data_matching` VALUES (1536, 'KT02S-9-MB', 'KT02S-9-MB-US-FBA', 'X003D7DXN9', '硅胶夹头食物夹9寸', '午夜蓝', 'FR', 90);
INSERT INTO `data_matching` VALUES (1537, 'KT02S-9-BK', 'KT02S-9-BK-US-FBA', 'X003D6XS3F', '硅胶夹头食物夹9寸', '黑色', 'FR', 90);
INSERT INTO `data_matching` VALUES (1538, 'KT02S-9-AS', 'KT02S-9-AS-US-FBA', 'X003D6XS2V', '硅胶夹头食物夹9寸', '水天色', 'FR', 90);
INSERT INTO `data_matching` VALUES (1539, 'KT02S-7-R', 'KT02S-7-R-US-FBA', 'X0046JY97H', '硅胶夹头食物夹7寸', '红色', 'FR', 90);
INSERT INTO `data_matching` VALUES (1540, 'KT02S-7-P', 'KT02S-7-P-US-FBA', 'X0046JVIU3', '硅胶夹头食物夹7寸', '紫色', 'FR', 90);
INSERT INTO `data_matching` VALUES (1541, 'KT02S-7-O', 'KT02S-7-O-US-FBA', 'X0046K2NZL', '硅胶夹头食物夹7寸', '橙色', 'FR', 90);
INSERT INTO `data_matching` VALUES (1542, 'KT02S-7-MB', 'KT02S-7-MB-US-FBA', 'X0046JVKF1', '硅胶夹头食物夹7寸', '午夜蓝', 'FR', 90);
INSERT INTO `data_matching` VALUES (1543, 'KT02S-7-BK', 'KT02S-7-BK-US-FBA', 'X0046JYCEH', '硅胶夹头食物夹7寸', '黑色', 'FR', 90);
INSERT INTO `data_matching` VALUES (1544, 'KT02S-7-AS', 'KT02S-7-AS-US-FBA', 'X0046JZRH3', '硅胶夹头食物夹7寸', '水天色', 'FR', 90);
INSERT INTO `data_matching` VALUES (1545, 'KT02S-16-R', 'KT02S-16-R-US-FBA', 'X003D6XS3Z', '硅胶夹头食物夹16寸', '红色', 'FR', 60);
INSERT INTO `data_matching` VALUES (1546, 'KT02S-16-P', 'KT02S-16-P-US-FBA', 'X003D78825', '硅胶夹头食物夹16寸', '紫色', 'FR', 60);
INSERT INTO `data_matching` VALUES (1547, 'KT02S-16-O', 'KT02S-16-O-US-FBA', 'X003D6XS35', '硅胶夹头食物夹16寸', '橙色', 'FR', 60);
INSERT INTO `data_matching` VALUES (1548, 'KT02S-16-MB', 'KT02S-16-MB-US-FBA', 'X003D6SDZ3', '硅胶夹头食物夹16寸', '午夜蓝', 'FR', 60);
INSERT INTO `data_matching` VALUES (1549, 'KT02S-16-BK', 'KT02S-16-BK-US-FBA', 'X003D6SDYT', '硅胶夹头食物夹16寸', '黑色', 'FR', 60);
INSERT INTO `data_matching` VALUES (1550, 'KT02S-16-AS', 'KT02S-16-AS-US-FBA', 'X003D7881B', '硅胶夹头食物夹16寸', '水天色', 'FR', 60);
INSERT INTO `data_matching` VALUES (1551, 'KT02S-12-R', 'KT02S-12-R-US-FBA', 'X003D6SDZX', '硅胶夹头食物夹12寸', '红色', 'FR', 70);
INSERT INTO `data_matching` VALUES (1552, 'KT02S-12-P', 'KT02S-12-P-US-FBA', 'X003D6XS49', '硅胶夹头食物夹12寸', '紫色', 'FR', 70);
INSERT INTO `data_matching` VALUES (1553, 'KT02S-12-O', 'KT02S-12-O-US-FBA', 'X003D7DXO3', '硅胶夹头食物夹12寸', '橙色', 'FR', 70);
INSERT INTO `data_matching` VALUES (1554, 'KT02S-12-MB', 'KT02S-12-MB-US-FBA', 'X003D7882P', '硅胶夹头食物夹12寸', '午夜蓝', 'FR', 70);
INSERT INTO `data_matching` VALUES (1555, 'KT02S-12-BK', 'KT02S-12-BK-US-FBA', 'X003D7DXOD', '硅胶夹头食物夹12寸', '黑色', 'FR', 70);
INSERT INTO `data_matching` VALUES (1556, 'KT02S-12-AS', 'KT02S-12-AS-US-FBA', 'X003D6SE0H', '硅胶夹头食物夹12寸', '水天色', 'FR', 70);
INSERT INTO `data_matching` VALUES (1557, 'KT02M-Set3-R', '', '', '金属夹头食物夹3件套', '红色', 'FR', 36);
INSERT INTO `data_matching` VALUES (1558, 'KT02M-Set3-P', '', '', '金属夹头食物夹3件套', '紫色', 'FR', 36);
INSERT INTO `data_matching` VALUES (1559, 'KT02M-Set3-O', '', '', '金属夹头食物夹3件套', '橙色', 'FR', 36);
INSERT INTO `data_matching` VALUES (1560, 'KT02M-Set3-MB', '', '', '金属夹头食物夹3件套', '午夜蓝', 'FR', 36);
INSERT INTO `data_matching` VALUES (1561, 'KT02M-Set3-BK', '', '', '金属夹头食物夹3件套', '黑色', 'FR', 36);
INSERT INTO `data_matching` VALUES (1562, 'KT02M-Set3-AS', '', '', '金属夹头食物夹3件套', '水天色', 'FR', 36);
INSERT INTO `data_matching` VALUES (1563, 'KT02M-Set2-R', '', '', '金属夹头食物夹2件套', '红色', 'FR', 45);
INSERT INTO `data_matching` VALUES (1564, 'KT02M-Set2-P', '', '', '金属夹头食物夹2件套', '紫色', 'FR', 45);
INSERT INTO `data_matching` VALUES (1565, 'KT02M-Set2-O', '', '', '金属夹头食物夹2件套', '橙色', 'FR', 45);
INSERT INTO `data_matching` VALUES (1566, 'KT02M-Set2-MB', '', '', '金属夹头食物夹2件套', '午夜蓝', 'FR', 45);
INSERT INTO `data_matching` VALUES (1567, 'KT02M-Set2-BK', '', '', '金属夹头食物夹2件套', '黑色', 'FR', 45);
INSERT INTO `data_matching` VALUES (1568, 'KT02M-Set2-AS', '', '', '金属夹头食物夹2件套', '水天色', 'FR', 45);
INSERT INTO `data_matching` VALUES (1569, 'KT02M-9-R', '', '', '金属夹头食物夹9寸', '红色', 'FR', 100);
INSERT INTO `data_matching` VALUES (1570, 'KT02M-9-P', '', '', '金属夹头食物夹9寸', '紫色', 'FR', 100);
INSERT INTO `data_matching` VALUES (1571, 'KT02M-9-O', '', '', '金属夹头食物夹9寸', '橙色', 'FR', 100);
INSERT INTO `data_matching` VALUES (1572, 'KT02M-9-MB', '', '', '金属夹头食物夹9寸', '午夜蓝', 'FR', 100);
INSERT INTO `data_matching` VALUES (1573, 'KT02M-9-BK', '', '', '金属夹头食物夹9寸', '黑色', 'FR', 100);
INSERT INTO `data_matching` VALUES (1574, 'KT02M-9-AS', '', '', '金属夹头食物夹9寸', '水天色', 'FR', 100);
INSERT INTO `data_matching` VALUES (1575, 'KT02M-7-R', '', '', '金属夹头食物夹7寸', '红色', 'FR', 100);
INSERT INTO `data_matching` VALUES (1576, 'KT02M-7-P', '', '', '金属夹头食物夹7寸', '紫色', 'FR', 100);
INSERT INTO `data_matching` VALUES (1577, 'KT02M-7-O', '', '', '金属夹头食物夹7寸', '橙色', 'FR', 100);
INSERT INTO `data_matching` VALUES (1578, 'KT02M-7-MB', '', '', '金属夹头食物夹7寸', '午夜蓝', 'FR', 100);
INSERT INTO `data_matching` VALUES (1579, 'KT02M-7-BK', '', '', '金属夹头食物夹7寸', '黑色', 'FR', 100);
INSERT INTO `data_matching` VALUES (1580, 'KT02M-7-AS', '', '', '金属夹头食物夹7寸', '水天色', 'FR', 100);
INSERT INTO `data_matching` VALUES (1581, 'KT02M-16-R', '', '', '金属夹头食物夹16寸', '红色', 'FR', 60);
INSERT INTO `data_matching` VALUES (1582, 'KT02M-16-P', '', '', '金属夹头食物夹16寸', '紫色', 'FR', 60);
INSERT INTO `data_matching` VALUES (1583, 'KT02M-16-O', '', '', '金属夹头食物夹16寸', '橙色', 'FR', 60);
INSERT INTO `data_matching` VALUES (1584, 'KT02M-16-MB', '', '', '金属夹头食物夹16寸', '午夜蓝', 'FR', 60);
INSERT INTO `data_matching` VALUES (1585, 'KT02M-16-BK', '', '', '金属夹头食物夹16寸', '黑色', 'FR', 60);
INSERT INTO `data_matching` VALUES (1586, 'KT02M-16-AS', '', '', '金属夹头食物夹16寸', '水天色', 'FR', 60);
INSERT INTO `data_matching` VALUES (1587, 'KT02M-12-R', '', '', '金属夹头食物夹12寸', '红色', 'FR', 80);
INSERT INTO `data_matching` VALUES (1588, 'KT02M-12-P', '', '', '金属夹头食物夹12寸', '紫色', 'FR', 80);
INSERT INTO `data_matching` VALUES (1589, 'KT02M-12-O', '', '', '金属夹头食物夹12寸', '橙色', 'FR', 80);
INSERT INTO `data_matching` VALUES (1590, 'KT02M-12-MB', '', '', '金属夹头食物夹12寸', '午夜蓝', 'FR', 80);
INSERT INTO `data_matching` VALUES (1591, 'KT02M-12-BK', '', '', '金属夹头食物夹12寸', '黑色', 'FR', 80);
INSERT INTO `data_matching` VALUES (1592, 'KT02M-12-AS', '', '', '金属夹头食物夹12寸', '水天色', 'FR', 80);
INSERT INTO `data_matching` VALUES (1593, 'IS02-S-R', '', '', '升级款金属抹刀小号', '红色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1594, 'IS02-S-P', '', '', '升级款金属抹刀小号', '紫色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1595, 'IS02-S-O', '', '', '升级款金属抹刀小号', '橙色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1596, 'IS02-S-MB', '', '', '升级款金属抹刀小号', '午夜蓝', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1597, 'IS02-S-BK', '', '', '升级款金属抹刀小号', '黑色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1598, 'IS02-S-AS', '', '', '升级款金属抹刀小号', '水天色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1599, 'IS02-M-R', '', '', '升级款金属抹刀中号', '红色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1600, 'IS02-M-P', '', '', '升级款金属抹刀中号', '紫色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1601, 'IS02-M-O', '', '', '升级款金属抹刀中号', '橙色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1602, 'IS02-M-MB', '', '', '升级款金属抹刀中号', '午夜蓝', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1603, 'IS02-M-BK', '', '', '升级款金属抹刀中号', '黑色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1604, 'IS02-M-AS', '', '', '升级款金属抹刀中号', '水天色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1605, 'IS02-L-R', '', '', '升级款金属抹刀大号', '红色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1606, 'IS02-L-P', '', '', '升级款金属抹刀大号', '紫色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1607, 'IS02-L-O', '', '', '升级款金属抹刀大号', '橙色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1608, 'IS02-L-MB', '', '', '升级款金属抹刀大号', '午夜蓝', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1609, 'IS02-L-BK', '', '', '升级款金属抹刀大号', '黑色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1610, 'IS02-L-AS', '', '', '升级款金属抹刀大号', '水天色', 'YJ', NULL);
INSERT INTO `data_matching` VALUES (1611, 'IS02-3-R', 'IS02-3-R-US-FBA', 'X0042X195R', '升级款金属抹刀3件套', '红色', 'YJ', 50);
INSERT INTO `data_matching` VALUES (1612, 'IS02-3-P', 'IS02-3-P-US-FBA', 'X0042X192Z', '升级款金属抹刀3件套', '紫色', 'YJ', 50);
INSERT INTO `data_matching` VALUES (1613, 'IS02-3-O', 'IS02-3-O-US-FBA', 'X0042WRMBX', '升级款金属抹刀3件套', '橙色', 'YJ', 50);
INSERT INTO `data_matching` VALUES (1614, 'IS02-3-MB', 'IS02-3-MB-US-FBA', 'X0046JR8G1', '升级款金属抹刀3件套', '午夜蓝', 'YJ', 50);
INSERT INTO `data_matching` VALUES (1615, 'IS02-3-BK', 'IS02-3-BK-US-FBA', 'X0042X1989', '升级款金属抹刀3件套', '黑色', 'YJ', 50);
INSERT INTO `data_matching` VALUES (1616, 'IS02-3-AS', 'IS02-3-AS-US-FBA', 'X0042X2KSH', '升级款金属抹刀3件套', '水天色', 'YJ', 50);
INSERT INTO `data_matching` VALUES (1617, 'IM01-Round-PK', '', '', '圆型小冰格', '粉色', 'RF', 125);
INSERT INTO `data_matching` VALUES (1618, 'IM01-Round-BG', '', '', '圆型小冰格', '米黄色', 'RF', 125);
INSERT INTO `data_matching` VALUES (1619, 'IM01-Round-AS', '', '', '圆型小冰格', '水天色', 'RF', 125);
INSERT INTO `data_matching` VALUES (1620, 'IM01-Cube-PK', '', '', '方型小冰格', '粉色', 'RF', 125);
INSERT INTO `data_matching` VALUES (1621, 'IM01-Cube-BG', '', '', '方型小冰格', '米黄色', 'RF', 125);
INSERT INTO `data_matching` VALUES (1622, 'IM01-Cube-AS', '', '', '方型小冰格', '水天色', 'RF', 125);
INSERT INTO `data_matching` VALUES (1623, 'G-SC02-SSet2-BK', '', '', '长手柄咖啡勺小号两件套黑色', '黑色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (1624, 'G-SC02-S30-BK', '', '', '长手柄咖啡勺小号30ml黑色', '黑色', 'YJ', 200);
INSERT INTO `data_matching` VALUES (1625, 'G-SC02-S15-BK', '', '', '长手柄咖啡勺小号15ml黑色', '黑色', 'YJ', 200);
INSERT INTO `data_matching` VALUES (1626, 'G-SC02-MSet2-S', '', '', '长手柄咖啡勺中号两件套银色', '银色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (1627, 'G-SC02-M30-S', '', '', '长手柄咖啡勺中号30ml银色', '银色', 'YJ', 180);
INSERT INTO `data_matching` VALUES (1628, 'G-SC02-M15-S', '', '', '长手柄咖啡勺中号15ml银色', '银色', 'YJ', 180);
INSERT INTO `data_matching` VALUES (1629, 'G-SC02-LSet2-S', '', '', '长手柄咖啡勺大号两件套银色', '银色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (1630, 'G-SC02-L30-S', '', '', '长手柄咖啡勺大号30ml银色', '银色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (1631, 'G-SC02-L15-S', '', '', '长手柄咖啡勺大号15ml银色', '银色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (1632, 'G-EW01B-M-R', '', '', '通用款搅拌器中号', '红色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1633, 'G-EW01B-M-P', '', '', '通用款搅拌器中号', '紫色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1634, 'G-EW01B-M-O', '', '', '通用款搅拌器中号', '橙色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1635, 'G-EW01B-M-MB', '', '', '通用款搅拌器中号', '午夜蓝', 'RF', 63);
INSERT INTO `data_matching` VALUES (1636, 'G-EW01B-M-BK', '', '', '通用款搅拌器中号', '黑色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1637, 'G-EW01B-M-AS', '', '', '通用款搅拌器中号', '水天色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1638, 'G-EW01B-L-R', '', '', '通用款搅拌器大号', '红色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1639, 'G-EW01B-L-P', '', '', '通用款搅拌器大号', '紫色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1640, 'G-EW01B-L-O', '', '', '通用款搅拌器大号', '橙色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1641, 'G-EW01B-L-MB', '', '', '通用款搅拌器大号', '午夜蓝', 'RF', 63);
INSERT INTO `data_matching` VALUES (1642, 'G-EW01B-L-BK', '', '', '通用款搅拌器大号', '黑色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1643, 'G-EW01B-L-AS', '', '', '通用款搅拌器大号', '水天色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1644, 'G-EW01C-S-R', '', '', '通用款搅拌器小号', '红色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1645, 'G-EW01C-S-BK', '', '', '通用款搅拌器小号', '黑色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1646, 'G-EW01C-S-AS', '', '', '通用款搅拌器小号', '水天色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1647, 'G-EW01C-S-O', '', '', '通用款搅拌器小号', '橙色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1648, 'G-EW01C-S-P', '', '', '通用款搅拌器小号', '紫色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1649, 'G-EW01C-S-MB', '', '', '通用款搅拌器小号', '午夜蓝', 'RF', 63);
INSERT INTO `data_matching` VALUES (1650, 'ET-EW01C-S-R', '', '', '搅拌器小号', '红色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1651, 'ET-EW01C-S-BK', '', '', '搅拌器小号', '黑色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1652, 'ET-EW01C-S-AS', '', '', '搅拌器小号', '水天色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1653, 'ET-EW01C-S-O', '', '', '搅拌器小号', '橙色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1654, 'ET-EW01C-S-P', '', '', '搅拌器小号', '紫色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1655, 'ET-EW01C-S-MB', '', '', '搅拌器小号', '午夜蓝', 'RF', 63);
INSERT INTO `data_matching` VALUES (1656, 'G-EW01-M-R', '', '', '打蛋器中号', '红色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1657, 'G-EW01-M-MB', '', '', '打蛋器中号', '午夜蓝', 'RF', 36);
INSERT INTO `data_matching` VALUES (1658, 'G-EW01-M-BK', '', '', '打蛋器中号', '黑色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1659, 'G-EW01-M-AS', '', '', '打蛋器中号', '水天色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1660, 'G-EW01-L-R', '', '', '打蛋器大号', '红色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1661, 'G-EW01-L-MB', '', '', '打蛋器大号', '午夜蓝', 'RF', 36);
INSERT INTO `data_matching` VALUES (1662, 'G-EW01-L-BK', '', '', '打蛋器大号', '黑色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1663, 'G-EW01-L-AS', '', '', '打蛋器大号', '水天色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1664, 'G-EUST06B-Set3-MUL5', '', '', '通用款欧标硅胶大勺3件套', '混色5', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1665, 'G-EUST06B-Set3-MUL4', '', '', '通用款欧标硅胶大勺3件套', '混色4', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1666, 'G-EUST06B-Set3-MUL3', '', '', '通用款欧标硅胶大勺3件套', '混色3', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1667, 'G-EUST06B-Set3-BK', '', '', '通用款欧标硅胶大勺3件套', '黑色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1668, 'G-EUST06B-Set3-AS', '', '', '通用款欧标硅胶大勺3件套', '水天色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1669, 'G-EUST05B-Spoon-R', '', '', '通用款欧标硅胶大勺', '红色', 'JLS', 145);
INSERT INTO `data_matching` VALUES (1670, 'G-EUST05B-Spoon-MB', '', '', '通用款欧标硅胶大勺', '午夜蓝', 'JLS', 145);
INSERT INTO `data_matching` VALUES (1671, 'G-EUST05B-Spoon-LB', '', '', '通用款欧标硅胶大勺', '湖蓝色', 'JLS', 145);
INSERT INTO `data_matching` VALUES (1672, 'G-EUST05B-Spoon-BK', '', '', '通用款欧标硅胶大勺', '黑色', 'JLS', 145);
INSERT INTO `data_matching` VALUES (1673, 'G-EUST05B-Spoon-AS', '', '', '通用款欧标硅胶大勺', '水天色', 'JLS', 145);
INSERT INTO `data_matching` VALUES (1674, 'G-EUST05B-Set4-MUL5', '', '', '通用款欧标硅胶刮刀4件套', '混色5', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1675, 'G-EUST05B-Set4-MUL4', '', '', '通用款欧标硅胶刮刀4件套', '混色4', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1676, 'G-EUST05B-Set4-MUL3', '', '', '通用款欧标硅胶刮刀4件套', '混色3', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1677, 'G-EUST05B-Set4-BK', '', '', '通用款欧标硅胶刮刀4件套', '黑色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1678, 'G-EUST05B-Set4-AS', '', '', '通用款欧标硅胶刮刀4件套', '水天色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1679, 'G-EUST05B-Set3-MUL5', '', '', '通用款欧标硅胶刮刀3件套', '混色5', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1680, 'G-EUST05B-Set3-MUL4', '', '', '通用款欧标硅胶刮刀3件套', '混色4', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1681, 'G-EUST05B-Set3-MUL3', '', '', '通用款欧标硅胶刮刀3件套', '混色3', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1682, 'G-EUST05B-Set3-BK', '', '', '通用款欧标硅胶刮刀3件套', '黑色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1683, 'G-EUST05B-Set3-AS', '', '', '通用款欧标硅胶刮刀3件套', '水天色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1684, 'G-EUST05B-Set2-MUL2', '', '', '通用款欧标硅胶刮刀2件套', '混色2', 'JLS', 72);
INSERT INTO `data_matching` VALUES (1685, 'G-EUST05B-Set2-MUL', '', '', '通用款欧标硅胶刮刀2件套', '混色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (1686, 'G-EUST05B-Set2-BK', '', '', '通用款欧标硅胶刮刀2件套', '黑色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (1687, 'G-EUST05B-Set2-AS', '', '', '通用款欧标硅胶刮刀2件套', '水天色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (1688, 'G-EUST05B-L-R', '', '', '通用款欧标硅胶刮刀大号', '红色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1689, 'G-EUST05B-L-MB', '', '', '通用款欧标硅胶刮刀大号', '午夜蓝', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1690, 'G-EUST05B-L-BK', '', '', '通用款欧标硅胶刮刀大号', '黑色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1691, 'G-EUST05B-L-AS', '', '', '通用款欧标硅胶刮刀大号', '水天色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1692, 'EUST10-Set3-R', 'EUST10-Set3-R-US-FBA', 'X004F91FH5', '铂金欧标硅胶大勺3件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1693, 'EUST10-Set3-P', 'EUST10-Set3-P-US-FBA', 'X004F8Y9Z1', '铂金欧标硅胶大勺3件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1694, 'EUST10-Set3-O', 'EUST10-Set3-O-US-FBA', 'X004F8Y7YT', '铂金欧标硅胶大勺3件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1695, 'EUST10-Set3-MUL2', 'EUST10-Set3-MUL2-US-FBA', 'X004F906A7', '铂金欧标硅胶大勺3件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (1696, 'EUST10-Set3-MUL', 'EUST10-Set3-MUL-US-FBA', 'X004F91F1B', '铂金欧标硅胶大勺3件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1697, 'EUST10-Set3-MB', 'EUST10-Set3-MB-US-FBA', 'X004F8Y843', '铂金欧标硅胶大勺3件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (1698, 'EUST10-Set3-BK', 'EUST10-Set3-BK-US-FBA', 'X004F9050D', '铂金欧标硅胶大勺3件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1699, 'EUST10-Set3-AS', 'EUST10-Set3-AS-US-FBA', 'X004F904XB', '铂金欧标硅胶大勺3件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1700, 'EUST09-XL-R', 'EUST09-XL-R-US-FBA', 'X004F9069N', '铂金欧标硅胶长手柄刮刀', '红色', 'RF', 100);
INSERT INTO `data_matching` VALUES (1701, 'EUST09-XL-P', 'EUST09-XL-P-US-FBA', 'X004F9050X', '铂金欧标硅胶长手柄刮刀', '紫色', 'RF', 100);
INSERT INTO `data_matching` VALUES (1702, 'EUST09-XL-O', '', '', '铂金欧标硅胶长手柄刮刀', '橙色', 'RF', 100);
INSERT INTO `data_matching` VALUES (1703, 'EUST09-XL-MB', 'EUST09-XL-MB-US-FBA', 'X004F906HF', '铂金欧标硅胶长手柄刮刀', '午夜蓝', 'RF', 100);
INSERT INTO `data_matching` VALUES (1704, 'EUST09-XL-BK', 'EUST09-XL-BK-US-FBA', 'X004F8YA2X', '铂金欧标硅胶长手柄刮刀', '黑色', 'RF', 100);
INSERT INTO `data_matching` VALUES (1705, 'EUST09-XL-AS', 'EUST09-XL-AS-US-FBA', 'X004F905AN', '铂金欧标硅胶长手柄刮刀', '水天色', 'RF', 100);
INSERT INTO `data_matching` VALUES (1706, 'EUST09-Spoon-R', 'EUST09-Spoon-R-US-SnL', 'X004F91FMZ', '铂金欧标硅胶大勺', '红色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1707, 'EUST09-Spoon-PK', 'EUST09-Spoon-PK-US-FBA', 'X004F94VUN', '铂金欧标硅胶大勺', '粉色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1708, 'EUST09-Spoon-P', 'EUST09-Spoon-P-US-SnL', 'X004F904Y5', '铂金欧标硅胶大勺', '紫色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1709, 'EUST09-Spoon-O', 'EUST09-Spoon-O-US-SnL', 'X004F90661', '铂金欧标硅胶大勺', '橙色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1710, 'EUST09-Spoon-MB', 'EUST09-Spoon-MB-US-SnL', 'X004F904OZ', '铂金欧标硅胶大勺', '午夜蓝', 'RF', 145);
INSERT INTO `data_matching` VALUES (1711, 'EUST09-Spoon-LG', 'EUST09-Spoon-LG-US-FBA', 'X004F9917L', '铂金欧标硅胶大勺', '浅绿色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1712, 'EUST09-Spoon-F', 'EUST09-Spoon-F-US-FBA', 'X004F8UKIL', '铂金欧标硅胶大勺', '玫红色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1713, 'EUST09-Spoon-CR', '', '', '铂金欧标硅胶大勺', '中国红', 'RF', 145);
INSERT INTO `data_matching` VALUES (1714, 'EUST09-Spoon-BK', 'EUST09-Spoon-BK-US-SnL', 'X004F906CZ', '铂金欧标硅胶大勺', '黑色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1715, 'EUST09-Spoon-AS', 'EUST09-Spoon-AS-US-SnL', 'X004F9056R', '铂金欧标硅胶大勺', '水天色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1716, 'EUST09-Set4-R', 'EUST09-Set4-R-US-FBA', 'X004F9057L', '铂金欧标硅胶刮刀4件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1717, 'EUST09-Set4-P', 'EUST09-Set4-P-US-FBA', 'X004F8YA91', '铂金欧标硅胶刮刀4件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1718, 'EUST09-Set4-O', 'EUST09-Set4-O-US-FBA', 'X004F906BB', '铂金欧标硅胶刮刀4件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1719, 'EUST09-Set4-MUL2', 'EUST09-Set4-MUL2-US-FBA', 'X004F90571', '铂金欧标硅胶刮刀4件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (1720, 'EUST09-Set4-MUL', 'EUST09-Set4-MUL-US-FBA', 'X004F8Y7ZD', '铂金欧标硅胶刮刀4件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1721, 'EUST09-Set4-MB', 'EUST09-Set4-MB-US-FBA', 'X004F8Y9YR', '铂金欧标硅胶刮刀4件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (1722, 'EUST09-Set4-BK', 'EUST09-Set4-BK-US-FBA', 'X004F8Y88T', '铂金欧标硅胶刮刀4件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1723, 'EUST09-Set4-AS', 'EUST09-Set4-AS-US-FBA', 'X004F904Q3', '铂金欧标硅胶刮刀4件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1724, 'EUST09-Set3-R', 'EUST09-Set3-R-US-FBA', 'X004F93WL7', '铂金欧标硅胶刮刀3件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1725, 'EUST09-Set3-P', 'EUST09-Set3-P-US-FBA', 'X004F906AR', '铂金欧标硅胶刮刀3件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1726, 'EUST09-Set3-O', 'EUST09-Set3-O-US-FBA', 'X004F91F5H', '铂金欧标硅胶刮刀3件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1727, 'EUST09-Set3-MUL2', 'EUST09-Set3-MUL2-US-FBA', 'X004F8Y9SN', '铂金欧标硅胶刮刀3件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (1728, 'EUST09-Set3-MUL', 'EUST09-Set3-MUL-US-FBA', 'X004F8YA9B', '铂金欧标硅胶刮刀3件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1729, 'EUST09-Set3-MB', 'EUST09-Set3-MB-US-FBA', 'X004F91FF7', '铂金欧标硅胶刮刀3件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (1730, 'EUST09-Set3-BK', 'EUST09-Set3-BK-US-FBA', 'X004F93WOJ', '铂金欧标硅胶刮刀3件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1731, 'EUST09-Set3-AS', 'EUST09-Set3-AS-US-FBA', 'X004F8Y8D9', '铂金欧标硅胶刮刀3件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1732, 'EUST09-Set2-R', 'EUST09-Set2-R-US-FBA', 'X004F8Y7WL', '铂金欧标硅胶刮刀2件套', '红色', 'RF', 72);
INSERT INTO `data_matching` VALUES (1733, 'EUST09-Set2-P', 'EUST09-Set2-P-US-FBA', 'X004F91F57', '铂金欧标硅胶刮刀2件套', '紫色', 'RF', 72);
INSERT INTO `data_matching` VALUES (1734, 'EUST09-Set2-O', 'EUST09-Set2-O-US-FBA', 'X004F8Y7WV', '铂金欧标硅胶刮刀2件套', '橙色', 'RF', 72);
INSERT INTO `data_matching` VALUES (1735, 'EUST09-Set2-MB', 'EUST09-Set2-MB-US-FBA', 'X004F906C5', '铂金欧标硅胶刮刀2件套', '午夜蓝', 'RF', 72);
INSERT INTO `data_matching` VALUES (1736, 'EUST09-Set2-BK', 'EUST09-Set2-BK-US-FBA', 'X004F8Y7ZX', '铂金欧标硅胶刮刀2件套', '黑色', 'RF', 72);
INSERT INTO `data_matching` VALUES (1737, 'EUST09-Set2-AS', 'EUST09-Set2-AS-US-FBA', 'X004F91F07', '铂金欧标硅胶刮刀2件套', '水天色', 'RF', 72);
INSERT INTO `data_matching` VALUES (1738, 'EUST09-S-R', 'EUST09-S-R-US-FBA', 'X004F93WLR', '铂金欧标硅胶刮刀小号', '红色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1739, 'EUST09-S-P', 'EUST09-S-P-US-FBA', 'X004F904W7', '铂金欧标硅胶刮刀小号', '紫色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1740, 'EUST09-S-O', 'EUST09-S-O-US-FBA', 'X004F8Y9RT', '铂金欧标硅胶刮刀小号', '橙色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1741, 'EUST09-S-MB', 'EUST09-S-MB-US-FBA', 'X004F9065R', '铂金欧标硅胶刮刀小号', '午夜蓝', 'RF', 200);
INSERT INTO `data_matching` VALUES (1742, 'EUST09-S-BK', 'EUST09-S-BK-US-FBA', 'X004F9052B', '铂金欧标硅胶刮刀小号', '黑色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1743, 'EUST09-S-AS', 'EUST09-S-AS-US-FBA', 'X004F91FGB', '铂金欧标硅胶刮刀小号', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1744, 'EUST09-L-R', 'EUST09-L-R-US-SnL', 'X004F8Y9P1', '铂金欧标硅胶刮刀大号', '红色', 'RF', 150);
INSERT INTO `data_matching` VALUES (1745, 'EUST09-L-P', 'EUST09-L-P-US-SnL', 'X004F9056H', '铂金欧标硅胶刮刀大号', '紫色', 'RF', 150);
INSERT INTO `data_matching` VALUES (1746, 'EUST09-L-O', 'EUST09-L-O-US-SnL', 'X004F8Y8DJ', '铂金欧标硅胶刮刀大号', '橙色', 'RF', 150);
INSERT INTO `data_matching` VALUES (1747, 'EUST09-L-MB', 'EUST09-L-MB-US-SnL', 'X004F93WM1', '铂金欧标硅胶刮刀大号', '午夜蓝', 'RF', 150);
INSERT INTO `data_matching` VALUES (1748, 'EUST09-L-BK', 'EUST09-L-BK-US-SnL', 'X004F90567', '铂金欧标硅胶刮刀大号', '黑色', 'RF', 150);
INSERT INTO `data_matching` VALUES (1749, 'EUST09-L-AS', 'EUST09-L-AS-US-SnL', 'X004F91FG1', '铂金欧标硅胶刮刀大号', '水天色', 'RF', 150);
INSERT INTO `data_matching` VALUES (1750, 'EUST09-Jar-R', 'EUST09-Jar-R-US-FBA', 'X004F8Y9W9', '铂金欧标硅胶罐头棒', '红色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1751, 'EUST09-Jar-P', 'EUST09-Jar-P-US-FBA', 'X004F8YA05', '铂金欧标硅胶罐头棒', '紫色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1752, 'EUST09-Jar-O', 'EUST09-Jar-O-US-FBA', 'X004F8Y9ZL', '铂金欧标硅胶罐头棒', '橙色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1753, 'EUST09-Jar-MB', 'EUST09-Jar-MB-US-FBA', 'X004F91FKH', '铂金欧标硅胶罐头棒', '午夜蓝', 'RF', 200);
INSERT INTO `data_matching` VALUES (1754, 'EUST09-Jar-BK', 'EUST09-Jar-BK-US-FBA', 'X004F93WKX', '铂金欧标硅胶罐头棒', '黑色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1755, 'EUST09-Jar-AS', 'EUST09-Jar-AS-US-FBA', 'X004F8Y9PV', '铂金欧标硅胶罐头棒', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1756, 'EUST08-Spoon-R', '', '', '抗菌铂金欧标硅胶大勺', '红色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1757, 'EUST08-Spoon-PK', '', '', '抗菌铂金欧标硅胶大勺', '粉色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1758, 'EUST08-Spoon-P', '', '', '抗菌铂金欧标硅胶大勺', '紫色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1759, 'EUST08-Spoon-O', '', '', '抗菌铂金欧标硅胶大勺', '橙色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1760, 'EUST08-Spoon-MUL3', '', '', '抗菌铂金欧标硅胶大勺', '混色3', 'RF', 145);
INSERT INTO `data_matching` VALUES (1761, 'EUST08-Spoon-MUL2', '', '', '抗菌铂金欧标硅胶大勺', '混色2', 'RF', 145);
INSERT INTO `data_matching` VALUES (1762, 'EUST08-Spoon-MUL', '', '', '抗菌铂金欧标硅胶大勺', '混色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1763, 'EUST08-Spoon-MB', '', '', '抗菌铂金欧标硅胶大勺', '午夜蓝', 'RF', 145);
INSERT INTO `data_matching` VALUES (1764, 'EUST08-Spoon-LG', '', '', '抗菌铂金欧标硅胶大勺', '浅绿色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1765, 'EUST08-Spoon-F', '', '', '抗菌铂金欧标硅胶大勺', '玫红色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1766, 'EUST08-Spoon-CR', '', '', '抗菌铂金欧标硅胶大勺', '中国红', 'RF', 145);
INSERT INTO `data_matching` VALUES (1767, 'EUST08-Spoon-BK', '', '', '抗菌铂金欧标硅胶大勺', '黑色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1768, 'EUST08-Spoon-AS', '', '', '抗菌铂金欧标硅胶大勺', '水天色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1769, 'EUST07-Spoon-AS', '', '', '抗菌升级欧标硅胶大勺', '水天色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1770, 'EUST07-S-AS', '', '', '抗菌升级欧标硅胶刮刀小号', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1771, 'EUST07-L-AS', '', '', '抗菌升级欧标硅胶刮刀大号', '水天色', 'RF', 150);
INSERT INTO `data_matching` VALUES (1772, 'EUST07-Jar-AS', '', '', '抗菌升级欧标硅胶罐头棒', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1773, 'EUST06B-Set3-R', 'EUST06B-Set3-R-US-FBA', 'X004C44VER', '第三代欧标硅胶大勺3件套', '红色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1774, 'EUST06B-Set3-P', 'EUST06B-Set3-P-US-FBA', 'X004C48ELD', '第三代欧标硅胶大勺3件套', '紫色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1775, 'EUST06B-Set3-O', 'EUST06B-Set3-O-US-FBA', 'X004C44V8X', '第三代欧标硅胶大勺3件套', '橙色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1776, 'EUST06B-Set3-MUL2', 'EUST06B-Set3-MUL2-US-FBA', 'X004C48ESL', '第三代欧标硅胶大勺3件套', '混色2', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1777, 'EUST06B-Set3-MUL', 'EUST06B-Set3-MUL-US-FBA', 'X004AG66GD', '第三代欧标硅胶大勺3件套', '混色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1778, 'EUST06B-Set3-MB', 'EUST06B-Set3-MB-US-FBA', 'X004C48EN1', '第三代欧标硅胶大勺3件套', '午夜蓝', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1779, 'EUST06B-Set3-BK', 'EUST06B-Set3-BK-US-FBA', 'X004AFZVTH', '第三代欧标硅胶大勺3件套', '黑色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1780, 'EUST06B-Set3-AS', 'EUST06B-Set3-AS-US-FBA', 'X004C44WLT', '第三代欧标硅胶大勺3件套', '水天色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1781, 'EUST06-Set3-R', 'EUST06-Set3-R-US-FBA', 'X003VVV81V', '升级欧标硅胶大勺3件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1782, 'EUST06-Set3-P', 'EUST06-Set3-P-US-FBA', 'X003VVS41X', '升级欧标硅胶大勺3件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1783, 'EUST06-Set3-O', 'EUST06-Set3-O-US-FBA', 'X003VVV5YL', '升级欧标硅胶大勺3件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1784, 'EUST06-Set3-MUL2', 'EUST06-Set3-MUL2-US-FBA', 'X0046JVJZH', '升级欧标硅胶大勺3件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (1785, 'EUST06-Set3-MUL', 'EUST06-Set3-MUL-US-FBA', 'X003VVS2QP', '升级欧标硅胶大勺3件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1786, 'EUST06-Set3-MB', 'EUST06-Set3-MB-US-FBA', 'X003VVS2N3', '升级欧标硅胶大勺3件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (1787, 'EUST06-Set3-BK', 'EUST06-Set3-BK-US-FBA', 'X003VVS3ZP', '升级欧标硅胶大勺3件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1788, 'EUST06-Set3-AS', 'EUST06-Set3-AS-US-FBA', 'X003VVS2LZ', '升级欧标硅胶大勺3件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1789, 'EUST05C-Spoon-R', '', '', '第四代欧标硅胶大勺', '红色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1790, 'EUST05C-Spoon-P', '', '', '第四代欧标硅胶大勺', '紫色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1791, 'EUST05C-Spoon-O', '', '', '第四代欧标硅胶大勺', '橙色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1792, 'EUST05C-Spoon-MB', '', '', '第四代欧标硅胶大勺', '午夜蓝', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1793, 'EUST05C-Spoon-BK', '', '', '第四代欧标硅胶大勺', '黑色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1794, 'EUST05C-Spoon-AS', '', '', '第四代欧标硅胶大勺', '水天色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1795, 'EUST05B-Spoon-R', 'EUST05B-Spoon-R-US-FBA', 'X004C4GVD1', '第三代欧标硅胶大勺', '红色', 'JLS', 145);
INSERT INTO `data_matching` VALUES (1796, 'EUST05B-Spoon-P', 'EUST05B-Spoon-P-US-FBA', 'X004C4GVEF', '第三代欧标硅胶大勺', '紫色', 'JLS', 145);
INSERT INTO `data_matching` VALUES (1797, 'EUST05B-Spoon-O', 'EUST05B-Spoon-O-US-FBA', 'X004C4GV9Z', '第三代欧标硅胶大勺', '橙色', 'JLS', 145);
INSERT INTO `data_matching` VALUES (1798, 'EUST05B-Spoon-MB', 'EUST05B-Spoon-MB-US-FBA', 'X004C48EK9', '第三代欧标硅胶大勺', '午夜蓝', 'JLS', 145);
INSERT INTO `data_matching` VALUES (1799, 'EUST05B-Spoon-BK', 'EUST05B-Spoon-BK-US-FBA', 'X004C44WMD', '第三代欧标硅胶大勺', '黑色', 'JLS', 145);
INSERT INTO `data_matching` VALUES (1800, 'EUST05B-Spoon-AS', 'EUST05B-Spoon-AS-US-FBA', 'X004C4GVGD', '第三代欧标硅胶大勺', '水天色', 'JLS', 145);
INSERT INTO `data_matching` VALUES (1801, 'EUST05B-Set4-R', 'EUST05B-Set4-R-US-FBA', 'X004C48EQX', '第三代欧标硅胶刮刀4件套', '红色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1802, 'EUST05B-Set4-P', 'EUST05B-Set4-P-US-FBA', 'X004C48EI1', '第三代欧标硅胶刮刀4件套', '紫色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1803, 'EUST05B-Set4-O', 'EUST05B-Set4-O-US-FBA', 'X004C44VF1', '第三代欧标硅胶刮刀4件套', '橙色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1804, 'EUST05B-Set4-MUL2', 'EUST05B-Set4-MUL2-US-FBA', 'X004C44VDN', '第三代欧标硅胶刮刀4件套', '混色2', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1805, 'EUST05B-Set4-MUL', 'EUST05B-Set4-MUL-US-FBA', 'X004C48ENB', '第三代欧标硅胶刮刀4件套', '混色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1806, 'EUST05B-Set4-MB', 'EUST05B-Set4-MB-US-FBA', 'X004C4GV7H', '第三代欧标硅胶刮刀4件套', '午夜蓝', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1807, 'EUST05B-Set4-BK', 'EUST05B-Set4-BK-US-FBA', 'X004C44WRN', '第三代欧标硅胶刮刀4件套', '黑色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1808, 'EUST05B-Set4-AS', 'EUST05B-Set4-AS-US-FBA', 'X004C4GV9F', '第三代欧标硅胶刮刀4件套', '水天色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1809, 'EUST05B-Set3-R', 'EUST05B-Set3-R-US-FBA', 'X004AG4CMD', '第三代欧标硅胶刮刀3件套', '红色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1810, 'EUST05B-Set3-P', 'EUST05B-Set3-P-US-FBA', 'X004AFXJWX', '第三代欧标硅胶刮刀3件套', '紫色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1811, 'EUST05B-Set3-O', 'EUST05B-Set3-O-US-FBA', 'X004AG4EWL', '第三代欧标硅胶刮刀3件套', '橙色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1812, 'EUST05B-Set3-MUL2', 'EUST05B-Set3-MUL2-US-FBA', 'X004C44WIH', '第三代欧标硅胶刮刀3件套', '混色2', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1813, 'EUST05B-Set3-MUL', 'EUST05B-Set3-MUL-US-FBA', 'X004C44WLJ', '第三代欧标硅胶刮刀3件套', '混色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1814, 'EUST05B-Set3-MB', 'EUST05B-Set3-MB-US-FBA', 'X004C48EM7', '第三代欧标硅胶刮刀3件套', '午夜蓝', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1815, 'EUST05B-Set3-BK', 'EUST05B-Set3-BK-US-FBA', 'X004AG4FCF', '第三代欧标硅胶刮刀3件套', '黑色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1816, 'EUST05B-Set3-AS', 'EUST05B-Set3-AS-US-FBA', 'X004C48EJZ', '第三代欧标硅胶刮刀3件套', '水天色', 'JLS', 45);
INSERT INTO `data_matching` VALUES (1817, 'EUST05B-Set2-R', 'EUST05B-Set2-R-US-FBA', 'X004C453P3', '第三代欧标硅胶刮刀2件套', '红色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (1818, 'EUST05B-Set2-P', 'EUST05B-Set2-P-US-FBA', 'X004C4ALEB', '第三代欧标硅胶刮刀2件套', '紫色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (1819, 'EUST05B-Set2-O', 'EUST05B-Set2-O-US-FBA', 'X004C4AHSV', '第三代欧标硅胶刮刀2件套', '橙色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (1820, 'EUST05B-Set2-MB', 'EUST05B-Set2-MB-US-FBA', 'X004C48MH9', '第三代欧标硅胶刮刀2件套', '午夜蓝', 'JLS', 72);
INSERT INTO `data_matching` VALUES (1821, 'EUST05B-Set2-BK', 'EUST05B-Set2-BK-US-FBA', 'X004C48MMT', '第三代欧标硅胶刮刀2件套', '黑色', 'RF', 72);
INSERT INTO `data_matching` VALUES (1822, 'EUST05B-Set2-AS', 'EUST05B-Set2-AS-US-FBA', 'X004C4ALRX', '第三代欧标硅胶刮刀2件套', '水天色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (1823, 'EUST05B-S-R', 'EUST05B-S-R-US-FBA', 'X004C48ZZ3', '第三代欧标硅胶刮刀小号', '红色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1824, 'EUST05B-S-P', 'EUST05B-S-P-US-FBA', 'X004C48ZVR', '第三代欧标硅胶刮刀小号', '紫色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1825, 'EUST05B-S-O', 'EUST05B-S-O-US-FBA', 'X004C4AM1X', '第三代欧标硅胶刮刀小号', '橙色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1826, 'EUST05B-S-MB', 'EUST05B-S-MB-US-FBA', 'X004C4EDQN', '第三代欧标硅胶刮刀小号', '午夜蓝', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1827, 'EUST05B-S-BK', 'EUST05B-S-BK-US-FBA', 'X004C48MJR', '第三代欧标硅胶刮刀小号', '黑色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1828, 'EUST05B-S-AS', 'EUST05B-S-AS-US-FBA', 'X004C4AKYH', '第三代欧标硅胶刮刀小号', '水天色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1829, 'EUST05B-L-R', 'EUST05B-L-R-US-FBA', 'X004C4GVB3', '第三代欧标硅胶刮刀大号', '红色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1830, 'EUST05B-L-P', 'EUST05B-L-P-US-FBA', 'X004C44VBF', '第三代欧标硅胶刮刀大号', '紫色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1831, 'EUST05B-L-O', 'EUST05B-L-O-US-FBA', 'X004C4GV6X', '第三代欧标硅胶刮刀大号', '橙色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1832, 'EUST05B-L-MB', 'EUST05B-L-MB-US-FBA', 'X004C44V5V', '第三代欧标硅胶刮刀大号', '午夜蓝', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1833, 'EUST05B-L-BK', 'EUST05B-L-BK-US-FBA', 'X004C44V6Z', '第三代欧标硅胶刮刀大号', '黑色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1834, 'EUST05B-L-AS', 'EUST05B-L-AS-US-FBA', 'X004C4GVBN', '第三代欧标硅胶刮刀大号', '水天色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (1835, 'EUST05B-Jar-R', 'EUST05B-Jar-R-US-FBA', 'X004C4AIFN', '第三代欧标硅胶罐头棒', '红色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1836, 'EUST05B-Jar-P', 'EUST05B-Jar-P-US-FBA', 'X004C4AJY3', '第三代欧标硅胶罐头棒', '紫色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1837, 'EUST05B-Jar-O', 'EUST05B-Jar-O-US-FBA', 'X004C48ND7', '第三代欧标硅胶罐头棒', '橙色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1838, 'EUST05B-Jar-MB', 'EUST05B-Jar-MB-US-FBA', 'X004C4AJFH', '第三代欧标硅胶罐头棒', '午夜蓝', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1839, 'EUST05B-Jar-BK', 'EUST05B-Jar-BK-US-FBA', 'X004C4GJJH', '第三代欧标硅胶罐头棒', '黑色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1840, 'EUST05B-Jar-AS', 'EUST05B-Jar-AS-US-FBA', 'X004C453HB', '第三代欧标硅胶罐头棒', '水天色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (1841, 'EUST05-XL-R', 'EUST05-XL-R-US-FBA', 'X003VVS2SN', '升级欧标硅胶长手柄刮刀', '红色', 'RF', 100);
INSERT INTO `data_matching` VALUES (1842, 'EUST05-XL-P', 'EUST05-XL-P-US-FBA', 'X003VVS2ND', '升级欧标硅胶长手柄刮刀', '紫色', 'RF', 100);
INSERT INTO `data_matching` VALUES (1843, 'EUST05-XL-O', '', '', '升级欧标硅胶长手柄刮刀', '橙色', 'RF', 100);
INSERT INTO `data_matching` VALUES (1844, 'EUST05-XL-MB', 'EUST05-XL-MB-US-FBA', 'X003VVV645', '升级欧标硅胶长手柄刮刀', '午夜蓝', 'RF', 100);
INSERT INTO `data_matching` VALUES (1845, 'EUST05-XL-BK', 'EUST05-XL-BK-US-FBA', 'X003VVS2M9', '升级欧标硅胶长手柄刮刀', '黑色', 'RF', 100);
INSERT INTO `data_matching` VALUES (1846, 'EUST05-XL-AS', 'EUST05-XL-AS-US-FBA', 'X003VVS2QZ', '升级欧标硅胶长手柄刮刀', '水天色', 'RF', 100);
INSERT INTO `data_matching` VALUES (1847, 'EUST05-Spoon-R', '', '', '升级欧标硅胶大勺', '红色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1848, 'EUST05-Spoon-PK', 'EUST05-Spoon-PK-US-FBA', 'X004EGUJML', '升级欧标硅胶大勺', '粉色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1849, 'EUST05-Spoon-P', 'EUST05-Spoon-P-US-SnL', 'X003VVV82P', '升级欧标硅胶大勺', '紫色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1850, 'EUST05-Spoon-O', 'EUST05-Spoon-O-US-SnL', 'X003VVS42H', '升级欧标硅胶大勺', '橙色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1851, 'EUST05-Spoon-MB', 'EUST05-Spoon-MB-US-SnL', 'X003VVS44P', '升级欧标硅胶大勺', '午夜蓝', 'RF', 145);
INSERT INTO `data_matching` VALUES (1852, 'EUST05-Spoon-LG', 'EUST05-Spoon-LG-US-FBA', 'X004EGUM5Z', '升级欧标硅胶大勺', '浅绿色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1853, 'EUST05-Spoon-F', 'EUST05-Spoon-F-US-FBA', 'X004EGW4S3', '升级欧标硅胶大勺', '玫红色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1854, 'EUST05-Spoon-CR', '', '', '升级欧标硅胶大勺', '中国红', 'RF', 145);
INSERT INTO `data_matching` VALUES (1855, 'EUST05-Spoon-BK', 'EUST05-Spoon-BK-US-SnL', 'X003VVS2L5', '升级欧标硅胶大勺', '黑色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1856, 'EUST05-Spoon-AS', 'EUST05-Spoon-AS-US-SnL', 'X003VVV5Z5', '升级欧标硅胶大勺', '水天色', 'RF', 145);
INSERT INTO `data_matching` VALUES (1857, 'EUST05-Set4-R', 'EUST05-Set4-R-US-FBA', 'X003VVV83T', '升级欧标硅胶刮刀4件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1858, 'EUST05-Set4-P', 'EUST05-Set4-P-US-FBA', 'X003VVS3ZZ', '升级欧标硅胶刮刀4件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1859, 'EUST05-Set4-O', 'EUST05-Set4-O-US-FBA', 'X003VVV861', '升级欧标硅胶刮刀4件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1860, 'EUST05-Set4-MUL2', '', '', '升级欧标硅胶刮刀4件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (1861, 'EUST05-Set4-MUL', 'EUST05-Set4-MUL-US-FBA', 'X0040D0OTL', '升级欧标硅胶刮刀4件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1862, 'EUST05-Set4-MB', 'EUST05-Set4-MB-US-FBA', 'X003VVV5UF', '升级欧标硅胶刮刀4件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (1863, 'EUST05-Set4-BK', 'EUST05-Set4-BK-US-FBA', 'X003VVV5TV', '升级欧标硅胶刮刀4件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1864, 'EUST05-Set4-AS', 'EUST05-Set4-AS-US-FBA', 'X003VVS2PB', '升级欧标硅胶刮刀4件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1865, 'EUST05-Set3-R', 'EUST05-Set3-R-US-FBA', 'X003VVVLV3', '升级欧标硅胶刮刀3件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1866, 'EUST05-Set3-P', 'EUST05-Set3-P-US-FBA', 'X003VVVM6H', '升级欧标硅胶刮刀3件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1867, 'EUST05-Set3-O', 'EUST05-Set3-O-US-FBA', 'X003VVISCX', '升级欧标硅胶刮刀3件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1868, 'EUST05-Set3-MUL2', 'EUST05-Set3-MUL2-US-FBA', 'X0046JRAEL', '升级欧标硅胶刮刀3件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (1869, 'EUST05-Set3-MUL', 'EUST05-Set3-MUL-US-FBA', 'X0046JYCTH', '升级欧标硅胶刮刀3件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1870, 'EUST05-Set3-MB', 'EUST05-Set3-MB-US-FBA', 'X003VVV81B', '升级欧标硅胶刮刀3件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (1871, 'EUST05-Set3-BK', 'EUST05-Set3-BK-US-FBA', 'X003VVS44Z', '升级欧标硅胶刮刀3件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1872, 'EUST05-Set3-AS', 'EUST05-Set3-AS-US-FBA', 'X003VVV5VT', '升级欧标硅胶刮刀3件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (1873, 'EUST05-Set2-R', 'EUST05-Set2-R-US-FBA', 'X004BQZWHL', '升级欧标硅胶刮刀2件套', '红色', 'RF', 72);
INSERT INTO `data_matching` VALUES (1874, 'EUST05-Set2-P', 'EUST05-Set2-P-US-FBA', 'X004BRDXD5', '升级欧标硅胶刮刀2件套', '紫色', 'RF', 72);
INSERT INTO `data_matching` VALUES (1875, 'EUST05-Set2-O', 'EUST05-Set2-O-US-FBA', 'X004BRDXIP', '升级欧标硅胶刮刀2件套', '橙色', 'RF', 72);
INSERT INTO `data_matching` VALUES (1876, 'EUST05-Set2-MB', 'EUST05-Set2-MB-US-FBA', 'X004BR2VOH', '升级欧标硅胶刮刀2件套', '午夜蓝', 'RF', 72);
INSERT INTO `data_matching` VALUES (1877, 'EUST05-Set2-BK', 'EUST05-Set2-BK-US-FBA', 'X004BQZV4F', '升级欧标硅胶刮刀2件套', '黑色', 'RF', 72);
INSERT INTO `data_matching` VALUES (1878, 'EUST05-Set2-AS', 'EUST05-Set2-AS-US-FBA', 'X004BRDYD9', '升级欧标硅胶刮刀2件套', '水天色', 'RF', 72);
INSERT INTO `data_matching` VALUES (1879, 'EUST05-S-R', 'EUST05-S-R-US-FBA', 'X004ADE8Z7', '升级欧标硅胶刮刀小号', '红色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1880, 'EUST05-S-P', 'EUST05-S-P-US-FBA', 'X004ADE9E7', '升级欧标硅胶刮刀小号', '紫色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1881, 'EUST05-S-O', 'EUST05-S-O-US-FBA', 'X004AD98Z7', '升级欧标硅胶刮刀小号', '橙色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1882, 'EUST05-S-MB', 'EUST05-S-MB-US-FBA', 'X004ADEDCP', '升级欧标硅胶刮刀小号', '午夜蓝', 'RF', 200);
INSERT INTO `data_matching` VALUES (1883, 'EUST05-S-BK', 'EUST05-S-BK-US-FBA', 'X004AD96SB', '升级欧标硅胶刮刀小号', '黑色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1884, 'EUST05-S-AS', 'EUST05-S-AS-US-FBA', 'X004AD9CJJ', '升级欧标硅胶刮刀小号', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1885, 'EUST05-L-R', 'EUST05-L-R-US-SnL', 'X003VVV5WX', '升级欧标硅胶刮刀大号', '红色', 'RF', 150);
INSERT INTO `data_matching` VALUES (1886, 'EUST05-L-P', 'EUST05-L-P-US-SnL', 'X003VVS2NX', '升级欧标硅胶刮刀大号', '紫色', 'RF', 150);
INSERT INTO `data_matching` VALUES (1887, 'EUST05-L-O', 'EUST05-L-O-US-SnL', 'X003VVV81L', '升级欧标硅胶刮刀大号', '橙色', 'RF', 150);
INSERT INTO `data_matching` VALUES (1888, 'EUST05-L-MB', 'EUST05-L-MB-US-SnL', 'X003VVS2K1', '升级欧标硅胶刮刀大号', '午夜蓝', 'RF', 150);
INSERT INTO `data_matching` VALUES (1889, 'EUST05-L-BK', 'EUST05-L-BK-US-SnL', 'X003VVV87Z', '升级欧标硅胶刮刀大号', '黑色', 'RF', 150);
INSERT INTO `data_matching` VALUES (1890, 'EUST05-L-AS', 'EUST05-L-AS-US-SnL', 'X003VVV5VJ', '升级欧标硅胶刮刀大号', '水天色', 'RF', 150);
INSERT INTO `data_matching` VALUES (1891, 'EUST05-Jar-R', 'EUST05-Jar-R-US-FBA', 'X004AD76BP', '升级欧标硅胶罐头棒', '红色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1892, 'EUST05-Jar-P', 'EUST05-Jar-P-US-FBA', 'X004ADEF0P', '升级欧标硅胶罐头棒', '紫色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1893, 'EUST05-Jar-O', 'EUST05-Jar-O-US-FBA', 'X004ADECYT', '升级欧标硅胶罐头棒', '橙色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1894, 'EUST05-Jar-MB', 'EUST05-Jar-MB-US-FBA', 'X004ADAGD5', '升级欧标硅胶罐头棒', '午夜蓝', 'RF', 200);
INSERT INTO `data_matching` VALUES (1895, 'EUST05-Jar-BK', 'EUST05-Jar-BK-US-FBA', 'X004ADCYYT', '升级欧标硅胶罐头棒', '黑色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1896, 'EUST05-Jar-AS', 'EUST05-Jar-AS-US-FBA', 'X004AD97JJ', '升级欧标硅胶罐头棒', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (1897, 'EUSL05B-S-R', '', '', '第二代硅胶汤勺抗菌小号', '红色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1898, 'EUSL05B-S-PK', '', '', '第二代硅胶汤勺抗菌小号', '粉色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1899, 'EUSL05B-S-P', '', '', '第二代硅胶汤勺抗菌小号', '紫色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1900, 'EUSL05B-S-O', '', '', '第二代硅胶汤勺抗菌小号', '橙色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1901, 'EUSL05B-S-MB', '', '', '第二代硅胶汤勺抗菌小号', '午夜蓝', 'RF', 120);
INSERT INTO `data_matching` VALUES (1902, 'EUSL05B-S-LG', '', '', '第二代硅胶汤勺抗菌小号', '浅绿色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1903, 'EUSL05B-S-F', '', '', '第二代硅胶汤勺抗菌小号', '玫红色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1904, 'EUSL05B-S-CR', '', '', '第二代硅胶汤勺抗菌小号', '中国红', 'RF', 120);
INSERT INTO `data_matching` VALUES (1905, 'EUSL05B-S-BK', '', '', '第二代硅胶汤勺抗菌小号', '黑色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1906, 'EUSL05B-S-AS', '', '', '第二代硅胶汤勺抗菌小号', '水天色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1907, 'EUSL03B-S-R', '', '', '第二代硅胶汤勺小号', '红色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1908, 'EUSL03B-S-PK', '', '', '第二代硅胶汤勺小号', '粉色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1909, 'EUSL03B-S-P', '', '', '第二代硅胶汤勺小号', '紫色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1910, 'EUSL03B-S-O', '', '', '第二代硅胶汤勺小号', '橙色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1911, 'EUSL03B-S-MB', '', '', '第二代硅胶汤勺小号', '午夜蓝', 'RF', 120);
INSERT INTO `data_matching` VALUES (1912, 'EUSL03B-S-LG', '', '', '第二代硅胶汤勺小号', '浅绿色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1913, 'EUSL03B-S-F', '', '', '第二代硅胶汤勺小号', '玫红色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1914, 'EUSL03B-S-CR', '', '', '第二代硅胶汤勺小号', '中国红', 'RF', 120);
INSERT INTO `data_matching` VALUES (1915, 'EUSL03B-S-BK', '', '', '第二代硅胶汤勺小号', '黑色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1916, 'EUSL03B-S-AS', '', '', '第二代硅胶汤勺小号', '水天色', 'RF', 120);
INSERT INTO `data_matching` VALUES (1917, 'ET-TB01-42-R', 'ET-TB01-42-R-US-FBA', 'X0031QS93B', '火鸡吸管', '红色', 'XH', 80);
INSERT INTO `data_matching` VALUES (1918, 'ET-TB01-42-P', 'ET-TB01-42-P-US-FBA', 'X0031QUZTH', '火鸡吸管', '紫色', 'XH', 80);
INSERT INTO `data_matching` VALUES (1919, 'ET-TB01-42-O', 'ET-TB01-42-O-US-FBA', 'X0031QT313', '火鸡吸管', '橙色', 'XH', 80);
INSERT INTO `data_matching` VALUES (1920, 'ET-TB01-42-MB', 'ET-TB01-42-MB-US-FBA', 'X003U51W41', '火鸡吸管', '午夜蓝', 'XH', 80);
INSERT INTO `data_matching` VALUES (1921, 'ET-TB01-42-BK', 'ET-TB01-42-BK-US-FBA', 'X0031QX8HN', '火鸡吸管', '黑色', 'XH', 80);
INSERT INTO `data_matching` VALUES (1922, 'ET-TB01-42-AS', 'ET-TB01-42-AS-US-FBA', 'X0031QUZU1', '火鸡吸管', '水天色', 'XH', 80);
INSERT INTO `data_matching` VALUES (1923, 'ET-FMS01B2-S-R', 'ET-FMS01B-S-R-US-FBA', 'X004321RAJ', '漏勺小号', '红色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1924, 'ET-FMS01B2-S-P', 'ET-FMS01B-S-P-US-FBA', 'X004321UF1', '漏勺小号', '紫色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1925, 'ET-FMS01B2-S-O', 'ET-FMS01B-S-O-US-FBA', 'X00431Q8T5', '漏勺小号', '橙色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1926, 'ET-FMS01B2-S-MB', 'ET-FMS01B-S-MB-US-FBA', 'X00431Q5QL', '漏勺小号', '午夜蓝', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1927, 'ET-FMS01B2-S-BK', 'ET-FMS01B-S-BK-US-FBA', 'X004329N0Z', '漏勺小号', '黑色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1928, 'ET-FMS01B2-S-AS', 'ET-FMS01B-S-AS-US-FBA', 'X00431Q5IJ', '漏勺小号', '水天色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1929, 'ET-FMS01B2-M-R', 'ET-FMS01B-M-R-US-FBA', 'X00431VA5H', '漏勺中号', '红色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1930, 'ET-FMS01B2-M-P', 'ET-FMS01B-M-P-US-FBA', 'X004322IEN', '漏勺中号', '紫色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1931, 'ET-FMS01B2-M-O', 'ET-FMS01B-M-O-US-FBA', 'X00431KP5D', '漏勺中号', '橙色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1932, 'ET-FMS01B2-M-MB', 'ET-FMS01B-M-MB-US-FBA', 'X004329TLX', '漏勺中号', '午夜蓝', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1933, 'ET-FMS01B2-M-BK', 'ET-FMS01B-M-BK-US-FBA', 'X004322BDB', '漏勺中号', '黑色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1934, 'ET-FMS01B2-M-AS', 'ET-FMS01B-M-AS-US-FBA', 'X004322J1F', '漏勺中号', '水天色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1935, 'ET-FMS01B-S-R', '', '', '面粉筛小号', '红色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1936, 'ET-FMS01B-S-P', '', '', '面粉筛小号', '紫色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1937, 'ET-FMS01B-S-O', '', '', '面粉筛小号', '橙色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1938, 'ET-FMS01B-S-MB', '', '', '面粉筛小号', '午夜蓝', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1939, 'ET-FMS01B-S-BK', '', '', '面粉筛小号', '黑色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1940, 'ET-FMS01B-S-AS', '', '', '面粉筛小号', '水天色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (1941, 'ET-FMS01B-M-R', '', '', '面粉筛中号', '红色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1942, 'ET-FMS01B-M-P', '', '', '面粉筛中号', '紫色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1943, 'ET-FMS01B-M-O', '', '', '面粉筛中号', '橙色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1944, 'ET-FMS01B-M-MB', '', '', '面粉筛中号', '午夜蓝', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1945, 'ET-FMS01B-M-BK', '', '', '面粉筛中号', '黑色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1946, 'ET-FMS01B-M-AS', '', '', '面粉筛中号', '水天色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1947, 'ET-FMS01B-L-R', '', '', '面粉筛大号', '红色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1948, 'ET-FMS01B-L-P', '', '', '面粉筛大号', '紫色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1949, 'ET-FMS01B-L-O', '', '', '面粉筛大号', '橙色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1950, 'ET-FMS01B-L-MB', '', '', '面粉筛大号', '午夜蓝', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1951, 'ET-FMS01B-L-BK', '', '', '面粉筛大号', '黑色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1952, 'ET-FMS01B-L-AS', '', '', '面粉筛大号', '水天色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (1953, 'ET-EW01B-M-R', 'ET-EW01B-M-R-US-FBA', 'X004BR67WJ', '搅拌器中号', '红色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1954, 'ET-EW01B-M-P', 'ET-EW01B-M-P-US-FBA', 'X004BRCFWF', '搅拌器中号', '紫色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1955, 'ET-EW01B-M-O', 'ET-EW01B-M-O-US-FBA', 'X004BR4WSF', '搅拌器中号', '橙色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1956, 'ET-EW01B-M-MB', 'ET-EW01B-M-MB-US-FBA', 'X004BR68AF', '搅拌器中号', '午夜蓝', 'RF', 63);
INSERT INTO `data_matching` VALUES (1957, 'ET-EW01B-M-BK', 'ET-EW01B-M-BK-US-FBA', 'X004BQQYNH', '搅拌器中号', '黑色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1958, 'ET-EW01B-M-AS', 'ET-EW01B-M-AS-US-FBA', 'X004BR2Y7V', '搅拌器中号', '水天色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1959, 'ET-EW01B-L-R', 'ET-EW01B-L-R-US-FBA', 'X004BR68MD', '搅拌器大号', '红色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1960, 'ET-EW01B-L-P', 'ET-EW01B-L-P-US-FBA', 'X004BQQTBT', '搅拌器大号', '紫色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1961, 'ET-EW01B-L-O', 'ET-EW01B-L-O-US-FBA', 'X004BR66VV', '搅拌器大号', '橙色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1962, 'ET-EW01B-L-MB', 'ET-EW01B-L-MB-US-FBA', 'X004BR4YNN', '搅拌器大号', '午夜蓝', 'RF', 63);
INSERT INTO `data_matching` VALUES (1963, 'ET-EW01B-L-BK', 'ET-EW01B-L-BK-US-FBA', 'X004BR68LJ', '搅拌器大号', '黑色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1964, 'ET-EW01B-L-AS', 'ET-EW01B-L-AS-US-FBA', 'X004BR68FP', '搅拌器大号', '水天色', 'RF', 63);
INSERT INTO `data_matching` VALUES (1965, 'ET-EW01-M-R', '', '', '打蛋器中号', '红色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1966, 'ET-EW01-M-P', '', '', '打蛋器中号', '紫色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1967, 'ET-EW01-M-O', '', '', '打蛋器中号', '橙色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1968, 'ET-EW01-M-MB', '', '', '打蛋器中号', '午夜蓝', 'RF', 36);
INSERT INTO `data_matching` VALUES (1969, 'ET-EW01-M-BK', '', '', '打蛋器中号', '黑色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1970, 'ET-EW01-M-AS', '', '', '打蛋器中号', '水天色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1971, 'ET-EW01-L-R', '', '', '打蛋器大号', '红色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1972, 'ET-EW01-L-P', '', '', '打蛋器大号', '紫色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1973, 'ET-EW01-L-O', '', '', '打蛋器大号', '橙色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1974, 'ET-EW01-L-MB', '', '', '打蛋器大号', '午夜蓝', 'RF', 36);
INSERT INTO `data_matching` VALUES (1975, 'ET-EW01-L-BK', '', '', '打蛋器大号', '黑色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1976, 'ET-EW01-L-AS', '', '', '打蛋器大号', '水天色', 'RF', 36);
INSERT INTO `data_matching` VALUES (1977, 'DS02-Semicircle-AS', '', '', '面粉切', '/', 'JLD', NULL);
INSERT INTO `data_matching` VALUES (1978, 'DPB01-1650-TS', '', '', '一次性裱花袋16寸', '数量：50', 'GNBE', 67);
INSERT INTO `data_matching` VALUES (1979, 'CTT01-12Set2-S', 'CTT01-12Set2-S-US-FBA', 'X004E8H9F9', '镊子12寸两件套', '12寸', 'HF', 65);
INSERT INTO `data_matching` VALUES (1980, 'CTT01-12R-S', 'CTT01-12R-S-US-FBA', 'X004E8G9ZP', '镊子12寸圆头', '造型：圆头', 'HF', 120);
INSERT INTO `data_matching` VALUES (1981, 'CTT01-12P-S', 'CTT01-12P-S-US-FBA', 'X004E8LXGP', '镊子12寸尖头', '造型：尖头', 'HF', 120);
INSERT INTO `data_matching` VALUES (1982, 'CR02-L-S', '', '', '双层框冷却架大号', 'L', 'YN', 32);
INSERT INTO `data_matching` VALUES (1983, 'CP01-2828-GN', '', '', '烤盘2828', '金色', 'YC', 20);
INSERT INTO `data_matching` VALUES (1984, 'BS01B2-3', '', '', '面粉杯', '/', '/', 36);
INSERT INTO `data_matching` VALUES (1985, 'BS01-3', '', '', '手摇面粉筛3杯', '/', '/', 36);
INSERT INTO `data_matching` VALUES (1986, 'BM03C-2828-R', '', '', '双面镂空烘焙垫2828', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (1987, 'BM03C-2828-P', '', '', '双面镂空烘焙垫2828', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (1988, 'BM03C-2828-BN', '', '', '双面镂空烘焙垫2828', '棕色', 'JS', 150);
INSERT INTO `data_matching` VALUES (1989, 'BM03C-2828-B', '', '', '双面镂空烘焙垫2828', '蓝色', 'JS', 150);
INSERT INTO `data_matching` VALUES (1990, 'BM03C-2828-AS', '', '', '双面镂空烘焙垫2828', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (1991, 'BM03-S80-P', '', '', '镂空烘焙垫S80', '紫色', 'JS', 100);
INSERT INTO `data_matching` VALUES (1992, 'BM03-i7-P', '', '', '镂空烘焙垫i7', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (1993, 'BM03-i7-BN', '', '', '镂空烘焙垫i7', '棕色', 'JS', 150);
INSERT INTO `data_matching` VALUES (1994, 'BM03-i7-B', '', '', '镂空烘焙垫i7', '蓝色', 'JS', 150);
INSERT INTO `data_matching` VALUES (1995, 'BM03-G80S-P', '', '', '镂空烘焙垫GBK80S', '紫色', 'JS', 100);
INSERT INTO `data_matching` VALUES (1996, 'BM03-G80S-BN', '', '', '镂空烘焙垫GBK80S', '棕色', 'JS', 100);
INSERT INTO `data_matching` VALUES (1997, 'BM03-G80S-B', '', '', '镂空烘焙垫GBK80S', '蓝色', 'JS', 100);
INSERT INTO `data_matching` VALUES (1998, 'BM03-G5A-P', '', '', '镂空烘焙垫GBK5A', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (1999, 'BM03-C45-R', '', '', '镂空烘焙垫C45', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2000, 'BM03-C45-P', '', '', '镂空烘焙垫C45', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2001, 'BM03-C45-BN', '', '', '镂空烘焙垫C45', '棕色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2002, 'BM03-C45-B', '', '', '镂空烘焙垫C45', '蓝色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2003, 'BM03-C45-AS', '', '', '镂空烘焙垫C45', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2004, 'BM03-2828-R', '', '', '镂空烘焙垫2828', '红色', 'JS', 200);
INSERT INTO `data_matching` VALUES (2005, 'BM03-2828-PK', '', '', '镂空烘焙垫2828', '粉色', 'JS', 200);
INSERT INTO `data_matching` VALUES (2006, 'BM03-2828-P', '', '', '镂空烘焙垫2828', '紫色', 'JS', 200);
INSERT INTO `data_matching` VALUES (2007, 'BM03-2828-O', '', '', '镂空烘焙垫2828', '橙色', 'JS', 200);
INSERT INTO `data_matching` VALUES (2008, 'BM03-2828-B', '', '', '镂空烘焙垫2828', '蓝色', 'JS', 200);
INSERT INTO `data_matching` VALUES (2009, 'BM03-2828-AS', '', '', '镂空烘焙垫2828', '水天色', 'JS', 200);
INSERT INTO `data_matching` VALUES (2010, 'BM02-XCM32-R', '', '', '烘焙垫XCM32', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2011, 'BM02-XCM32-P', '', '', '烘焙垫XCM32', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2012, 'BM02-XCM32-AS', '', '', '烘焙垫XCM32', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2013, 'BM02-T750-R', '', '', '烘焙垫T750', '红色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2014, 'BM02-T750-P', '', '', '烘焙垫T750', '紫色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2015, 'BM02-T750-AS', '', '', '烘焙垫T750', '水天色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2016, 'BM02-T535-R', '', '', '烘焙垫T535', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2017, 'BM02-T535-P', '', '', '烘焙垫T535', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2018, 'BM02-T535-AS', '', '', '烘焙垫T535', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2019, 'BM02-T38-R', '', '', '烘焙垫T38', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2020, 'BM02-T38-PK', '', '', '烘焙垫T38', '粉色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2021, 'BM02-T38-P', '', '', '烘焙垫T38', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2022, 'BM02-T38-O', '', '', '烘焙垫T38', '橙色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2023, 'BM02-T38-B', '', '', '烘焙垫T38', '蓝色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2024, 'BM02-T38-AS', '', '', '烘焙垫T38', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2025, 'BM02-S80-R', '', '', '烘焙垫S80', '红色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2026, 'BM02-S80-PK', '', '', '烘焙垫S80', '粉色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2027, 'BM02-S80-P', '', '', '烘焙垫S80', '紫色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2028, 'BM02-S80-O', '', '', '烘焙垫S80', '橙色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2029, 'BM02-S80-B', '', '', '烘焙垫S80', '蓝色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2030, 'BM02-S80-AS', '', '', '烘焙垫S80', '水天色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2031, 'BM02-KS540-R', '', '', '烘焙垫KS540', '红色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2032, 'BM02-KS540-P', '', '', '烘焙垫KS540', '紫色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2033, 'BM02-KS540-AS', '', '', '烘焙垫KS540', '水天色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2034, 'BM02-KS01-R', '', '', '烘焙垫KS01', '红色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2035, 'BM02-KS01-PK', '', '', '烘焙垫KS01', '粉色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2036, 'BM02-KS01-P', '', '', '烘焙垫KS01', '紫色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2037, 'BM02-KS01-O', '', '', '烘焙垫KS01', '橙色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2038, 'BM02-KS01-B', '', '', '烘焙垫KS01', '蓝色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2039, 'BM02-KS01-AS', '', '', '烘焙垫KS01', '水天色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2040, 'BM02-K55P-R', '', '', '烘焙垫K55P', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2041, 'BM02-K55P-P', '', '', '烘焙垫K55P', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2042, 'BM02-K55P-AS', '', '', '烘焙垫K55P', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2043, 'BM02-i7-R', '', '', '烘焙垫i7', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2044, 'BM02-i7-PK', '', '', '烘焙垫i7', '粉色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2045, 'BM02-i7-P', '', '', '烘焙垫i7', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2046, 'BM02-i7-O', '', '', '烘焙垫i7', '橙色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2047, 'BM02-i7-B', '', '', '烘焙垫i7', '蓝色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2048, 'BM02-i7-AS', '', '', '烘焙垫i7', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2049, 'BM02-f40-R', '', '', '烘焙垫f40', '红色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2050, 'BM02-f40-P', '', '', '烘焙垫f40', '紫色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2051, 'BM02-f40-AS', '', '', '烘焙垫f40', '水天色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2052, 'BM02-CD42-R', '', '', '烘焙垫CD42', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2053, 'BM02-CD42-P', '', '', '烘焙垫CD42', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2054, 'BM02-CD42-AS', '', '', '烘焙垫CD42', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2055, 'BM02-c76-R', '', '', '烘焙垫c76', '红色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2056, 'BM02-c76-PK', '', '', '烘焙垫c76', '粉色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2057, 'BM02-c76-P', '', '', '烘焙垫c76', '紫色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2058, 'BM02-c76-O', '', '', '烘焙垫c76', '橙色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2059, 'BM02-c76-B', '', '', '烘焙垫c76', '蓝色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2060, 'BM02-c76-AS', '', '', '烘焙垫c76', '水天色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2061, 'BM02-c45-R', '', '', '烘焙垫c45', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2062, 'BM02-c45-PK', '', '', '烘焙垫c45', '粉色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2063, 'BM02-c45-P', '', '', '烘焙垫c45', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2064, 'BM02-c45-O', '', '', '烘焙垫c45', '橙色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2065, 'BM02-c45-B', '', '', '烘焙垫c45', '蓝色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2066, 'BM02-c45-AS', '', '', '烘焙垫c45', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2067, 'BM02-c40-R', '', '', '烘焙垫c40', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2068, 'BM02-c40-PK', '', '', '烘焙垫c40', '粉色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2069, 'BM02-c40-P', '', '', '烘焙垫c40', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2070, 'BM02-c40-O', '', '', '烘焙垫c40', '橙色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2071, 'BM02-c40-B', '', '', '烘焙垫c40', '蓝色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2072, 'BM02-c40-AS', '', '', '烘焙垫c40', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2073, 'BM02-5400-R', '', '', '烘焙垫5400', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2074, 'BM02-5400-P', '', '', '烘焙垫5400', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2075, 'BM02-5400-AS', '', '', '烘焙垫5400', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2076, 'BM02-2828B2-R', 'BM02-2828B2-R-US-FBA', 'X004ADAE23', '烘焙垫2828英文版2个装', '红色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2077, 'BM02-2828B2-PK', 'BM02-2828B2-PK-US-FBA', 'X004ADA7QL', '烘焙垫2828英文版2个装', '粉色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2078, 'BM02-2828B2-P', '', '', '烘焙垫2828英文版2个装', '紫色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2079, 'BM02-2828B2-O', '', '', '烘焙垫2828英文版2个装', '橙色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2080, 'BM02-2828B2-B', 'BM02-2828B2-B-US-FBA', 'X004ADBBTX', '烘焙垫2828英文版2个装', '蓝色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2081, 'BM02-2828B2-AS', 'BM02-2828B2-AS-US-FBA', 'X003THTLK7', '烘焙垫2828英文版2个装', '水天色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2082, 'BM02-2828B-R', '', '', '烘焙垫2828英文版', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2083, 'BM02-2828B-P', '', '', '烘焙垫2828英文版', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2084, 'BM02-2828B-AS', 'BM02-2828B-AS-US-FBA', 'X004ADKDNN', '烘焙垫2828英文版', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2085, 'BM02-2828-R', '', '', '烘焙垫2828', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2086, 'BM02-2828-PK', '', '', '烘焙垫2828', '粉色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2087, 'BM02-2828-P', '', '', '烘焙垫2828', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2088, 'BM02-2828-O', '', '', '烘焙垫2828', '橙色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2089, 'BM02-2828-B', '', '', '烘焙垫2828', '蓝色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2090, 'BM02-2828-AS', '', '', '烘焙垫2828', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2091, 'BM01-S2-Red', '', '', '烘焙垫小号2件套', '红色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2092, 'BM01-S2-Purple', '', '', '烘焙垫小号2件套', '紫色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2093, 'BM01-S2-AquaSky', '', '', '烘焙垫小号2件套', '水天色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2094, 'BM01-S1M1L1-Red', '', '', '烘焙垫3件套', '红色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2095, 'BM01-S1M1L1-Purple', '', '', '烘焙垫3件套', '紫色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2096, 'BM01-S1M1L1-AquaSky', 'BM01-S1M1L1-AquaSky-US-FBA', 'X002RARQXB', '烘焙垫3件套', '水天色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2097, 'BM01-S-Red', '', '', '烘焙垫小号', '红色', 'JS', 200);
INSERT INTO `data_matching` VALUES (2098, 'BM01-S-Purple', '', '', '烘焙垫小号', '紫色', 'JS', 200);
INSERT INTO `data_matching` VALUES (2099, 'BM01-S-AquaSky', 'BM01-S-AquaSky-US01-FBA', 'X004D4ASD9', '烘焙垫小号', '水天色', 'JS', 200);
INSERT INTO `data_matching` VALUES (2100, 'BM01-M2-Red', '', '', '烘焙垫中号2件套', '红色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2101, 'BM01-M2-Purple', '', '', '烘焙垫中号2件套', '紫色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2102, 'BM01-M2-AquaSky', '', '', '烘焙垫中号2件套', '水天色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2103, 'BM01-M-Red', 'BM01-M-Red-US01-FBA', 'X004D4FV4F', '烘焙垫中号', '红色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2104, 'BM01-M-Purple', '', '', '烘焙垫中号', '紫色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2105, 'BM01-M-AquaSky', 'BM01-M-AquaSky-US01-FBA', 'X004D4B8B5', '烘焙垫中号', '水天色', 'JS', 150);
INSERT INTO `data_matching` VALUES (2106, 'BM01-L3-Red', '', '', '烘焙垫大号3件套', '红色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2107, 'BM01-L3-Purple', '', '', '烘焙垫大号3件套', '紫色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2108, 'BM01-L3-AquaSky', '', '', '烘焙垫大号3件套', '水天色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2109, 'BM01-L2-Red', 'BM01-L2-Red-US-FBA', 'X002RAZPAH', '烘焙垫大号2件套', '红色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2110, 'BM01-L2-Purple', 'BM01-L2-Purple-US-FBA', 'X002RAZPBB', '烘焙垫大号2件套', '紫色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2111, 'BM01-L2-AquaSky', 'BM01-L2-AquaSky-US-FBA', 'X002RB2KXL', '烘焙垫大号2件套', '水天色', 'JS', 40);
INSERT INTO `data_matching` VALUES (2112, 'BM01-L-Red', '', '', '烘焙垫大号红', '红色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2113, 'BM01-L-Purple', '', '', '烘焙垫大号', '紫色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2114, 'BM01-L-AquaSky', '', '', '烘焙垫大号', '水天色', 'JS', 100);
INSERT INTO `data_matching` VALUES (2115, 'SIS01-Set3-R', '', '', '直款金属抹刀3件套', '红色', 'YJ', 50);
INSERT INTO `data_matching` VALUES (2116, 'SIS01-Set3-BK', '', '', '直款金属抹刀3件套', '黑色', 'YJ', 50);
INSERT INTO `data_matching` VALUES (2117, 'SIS01-Set3-AS', '', '', '直款金属抹刀3件套', '水天色', 'YJ', 50);
INSERT INTO `data_matching` VALUES (2118, 'SIS01-Set3-O', '', '', '直款金属抹刀3件套', '橙色', 'YJ', 50);
INSERT INTO `data_matching` VALUES (2119, 'SIS01-Set3-P', '', '', '直款金属抹刀3件套', '紫色', 'YJ', 50);
INSERT INTO `data_matching` VALUES (2120, 'SIS01-Set3-MB', '', '', '直款金属抹刀3件套', '午夜蓝', 'YJ', 50);
INSERT INTO `data_matching` VALUES (2121, 'SIS01-S-R', '', '', '直款金属抹刀小号', '红色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2122, 'SIS01-S-BK', '', '', '直款金属抹刀小号', '黑色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2123, 'SIS01-S-AS', '', '', '直款金属抹刀小号', '水天色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2124, 'SIS01-S-O', '', '', '直款金属抹刀小号', '橙色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2125, 'SIS01-S-P', '', '', '直款金属抹刀小号', '紫色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2126, 'SIS01-S-MB', '', '', '直款金属抹刀小号', '午夜蓝', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2127, 'SIS01-M-R', '', '', '直款金属抹刀中号', '红色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2128, 'SIS01-M-BK', '', '', '直款金属抹刀中号', '黑色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2129, 'SIS01-M-AS', '', '', '直款金属抹刀中号', '水天色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2130, 'SIS01-M-O', '', '', '直款金属抹刀中号', '橙色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2131, 'SIS01-M-P', '', '', '直款金属抹刀中号', '紫色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2132, 'SIS01-M-MB', '', '', '直款金属抹刀中号', '午夜蓝', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2133, 'SIS01-L-R', '', '', '直款金属抹刀大号', '红色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2134, 'SIS01-L-BK', '', '', '直款金属抹刀大号', '黑色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2135, 'SIS01-L-AS', '', '', '直款金属抹刀大号', '水天色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2136, 'SIS01-L-O', '', '', '直款金属抹刀大号', '橙色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2137, 'SIS01-L-P', '', '', '直款金属抹刀大号', '紫色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2138, 'SIS01-L-MB', '', '', '直款金属抹刀大号', '午夜蓝', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2139, 'EUST05-XL-B-AS', '', '', '升级欧标硅胶长手柄刮刀', '水天色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2140, 'EUST05-XL-B-BK', '', '', '升级欧标硅胶长手柄刮刀', '黑色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2141, 'EUST05-XL-B-MB', '', '', '升级欧标硅胶长手柄刮刀', '午夜蓝', 'RF', 100);
INSERT INTO `data_matching` VALUES (2142, 'EUST05-XL-B-P', '', '', '升级欧标硅胶长手柄刮刀', '紫色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2143, 'EUST05-XL-B-R', '', '', '升级欧标硅胶长手柄刮刀', '红色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2144, 'EUST05-XL-B-O', '', '', '升级欧标硅胶长手柄刮刀', '橙色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2145, 'EUST05-Jar-B-AS', '', '', '升级欧标硅胶罐头棒', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2146, 'EUST05-Jar-B-BK', '', '', '升级欧标硅胶罐头棒', '黑色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2147, 'EUST05-Jar-B-MB', '', '', '升级欧标硅胶罐头棒', '午夜蓝', 'RF', 200);
INSERT INTO `data_matching` VALUES (2148, 'EUST05-Jar-B-P', '', '', '升级欧标硅胶罐头棒', '紫色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2149, 'EUST05-Jar-B-R', '', '', '升级欧标硅胶罐头棒', '红色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2150, 'EUST05-Jar-B-O', '', '', '升级欧标硅胶罐头棒', '橙色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2151, 'EUST05-Spoon-B-AS', '', '', '升级欧标硅胶大勺', '水天色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2152, 'EUST05-Spoon-B-BK', '', '', '升级欧标硅胶大勺', '黑色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2153, 'EUST05-Spoon-B-MB', '', '', '升级欧标硅胶大勺', '午夜蓝', 'RF', 145);
INSERT INTO `data_matching` VALUES (2154, 'EUST05-Spoon-B-P', '', '', '升级欧标硅胶大勺', '紫色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2155, 'EUST05-Spoon-B-R', '', '', '升级欧标硅胶大勺', '红色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2156, 'EUST05-Spoon-B-O', '', '', '升级欧标硅胶大勺', '橙色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2157, 'EUST05-Spoon-B-LG', '', '', '升级欧标硅胶大勺', '浅绿色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2158, 'EUST05-Spoon-B-TR', '', '', '升级欧标硅胶大勺', '番茄红', 'RF', 145);
INSERT INTO `data_matching` VALUES (2159, 'EUST05-Spoon-B-F', '', '', '升级欧标硅胶大勺', '玫红色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2160, 'EUST05-Spoon-B-PK', '', '', '升级欧标硅胶大勺', '粉色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2161, 'EUST05-S-B-AS', '', '', '升级欧标硅胶刮刀小号', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2162, 'EUST05-S-B-BK', '', '', '升级欧标硅胶刮刀小号', '黑色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2163, 'EUST05-S-B-MB', '', '', '升级欧标硅胶刮刀小号', '午夜蓝', 'RF', 200);
INSERT INTO `data_matching` VALUES (2164, 'EUST05-S-B-P', '', '', '升级欧标硅胶刮刀小号', '紫色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2165, 'EUST05-S-B-R', '', '', '升级欧标硅胶刮刀小号', '红色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2166, 'EUST05-S-B-O', '', '', '升级欧标硅胶刮刀小号', '橙色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2167, 'EUST05-L-B-AS', '', '', '升级欧标硅胶刮刀大号', '水天色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2168, 'EUST05-L-B-BK', '', '', '升级欧标硅胶刮刀大号', '黑色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2169, 'EUST05-L-B-MB', '', '', '升级欧标硅胶刮刀大号', '午夜蓝', 'RF', 150);
INSERT INTO `data_matching` VALUES (2170, 'EUST05-L-B-P', '', '', '升级欧标硅胶刮刀大号', '紫色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2171, 'EUST05-L-B-R', '', '', '升级欧标硅胶刮刀大号', '红色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2172, 'EUST05-L-B-O', '', '', '升级欧标硅胶刮刀大号', '橙色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2173, 'EUST05-Set2-B-AS', '', '', '升级欧标硅胶刮刀2件套', '水天色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2174, 'EUST05-Set2-B-BK', '', '', '升级欧标硅胶刮刀2件套', '黑色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2175, 'EUST05-Set2-B-MB', '', '', '升级欧标硅胶刮刀2件套', '午夜蓝', 'RF', 72);
INSERT INTO `data_matching` VALUES (2176, 'EUST05-Set2-B-P', '', '', '升级欧标硅胶刮刀2件套', '紫色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2177, 'EUST05-Set2-B-R', '', '', '升级欧标硅胶刮刀2件套', '红色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2178, 'EUST05-Set2-B-O', '', '', '升级欧标硅胶刮刀2件套', '橙色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2179, 'EUST05-Set3-B-AS', '', '', '升级欧标硅胶刮刀3件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2180, 'EUST05-Set3-B-BK', '', '', '升级欧标硅胶刮刀3件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2181, 'EUST05-Set3-B-MB', '', '', '升级欧标硅胶刮刀3件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (2182, 'EUST05-Set3-B-P', '', '', '升级欧标硅胶刮刀3件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2183, 'EUST05-Set3-B-R', '', '', '升级欧标硅胶刮刀3件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2184, 'EUST05-Set3-B-O', '', '', '升级欧标硅胶刮刀3件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2185, 'EUST05-Set3-B-MUL', '', '', '升级欧标硅胶刮刀3件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2186, 'EUST05-Set3-B-MUL2', '', '', '升级欧标硅胶刮刀3件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (2187, 'EUST05-Set4-B-AS', '', '', '升级欧标硅胶刮刀4件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2188, 'EUST05-Set4-B-BK', '', '', '升级欧标硅胶刮刀4件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2189, 'EUST05-Set4-B-MB', '', '', '升级欧标硅胶刮刀4件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (2190, 'EUST05-Set4-B-P', '', '', '升级欧标硅胶刮刀4件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2191, 'EUST05-Set4-B-R', '', '', '升级欧标硅胶刮刀4件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2192, 'EUST05-Set4-B-O', '', '', '升级欧标硅胶刮刀4件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2193, 'EUST05-Set4-B-MUL', '', '', '升级欧标硅胶刮刀4件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2194, 'EUST05-Set4-B-MUL2', '', '', '升级欧标硅胶刮刀4件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (2195, 'EUST06-Set3-B-AS', '', '', '升级欧标硅胶大勺3件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2196, 'EUST06-Set3-B-BK', '', '', '升级欧标硅胶大勺3件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2197, 'EUST06-Set3-B-MB', '', '', '升级欧标硅胶大勺3件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (2198, 'EUST06-Set3-B-P', '', '', '升级欧标硅胶大勺3件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2199, 'EUST06-Set3-B-R', '', '', '升级欧标硅胶大勺3件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2200, 'EUST06-Set3-B-O', '', '', '升级欧标硅胶大勺3件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2201, 'EUST06-Set3-B-MUL', '', '', '升级欧标硅胶大勺3件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2202, 'EUST06-Set3-B-MUL2', '', '', '升级欧标硅胶大勺3件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (2203, 'OP-EUSL03-M-B-AS', '', '', '升级款欧标硅胶汤勺', '水天色', 'RF', 80);
INSERT INTO `data_matching` VALUES (2204, 'OP-EUSL03-M-B-BK', '', '', '升级款欧标硅胶汤勺', '黑色', 'RF', 80);
INSERT INTO `data_matching` VALUES (2205, 'OP-EUSL03-M-B-MB', '', '', '升级款欧标硅胶汤勺', '午夜蓝', 'RF', 80);
INSERT INTO `data_matching` VALUES (2206, 'OP-EUSL03-M-B-P', '', '', '升级款欧标硅胶汤勺', '紫色', 'RF', 80);
INSERT INTO `data_matching` VALUES (2207, 'OP-EUSL03-M-B-R', '', '', '升级款欧标硅胶汤勺', '红色', 'RF', 80);
INSERT INTO `data_matching` VALUES (2208, 'OP-EUSL03-M-B-O', '', '', '升级款欧标硅胶汤勺', '橙色', 'RF', 80);
INSERT INTO `data_matching` VALUES (2209, 'OP-EUSP0304-Set2-B-AS', '', '', '升级款欧标硅胶分餐勺组合2件套', '水天色', 'RF', 55);
INSERT INTO `data_matching` VALUES (2210, 'OP-EUSP0304-Set2-B-BK', '', '', '升级款欧标硅胶分餐勺组合2件套', '黑色', 'RF', 55);
INSERT INTO `data_matching` VALUES (2211, 'OP-EUSP0304-Set2-B-MB', '', '', '升级款欧标硅胶分餐勺组合2件套', '午夜蓝', 'RF', 55);
INSERT INTO `data_matching` VALUES (2212, 'OP-EUSP0304-Set2-B-P', '', '', '升级款欧标硅胶分餐勺组合2件套', '紫色', 'RF', 55);
INSERT INTO `data_matching` VALUES (2213, 'OP-EUSP0304-Set2-B-R', '', '', '升级款欧标硅胶分餐勺组合2件套', '红色', 'RF', 55);
INSERT INTO `data_matching` VALUES (2214, 'OP-EUSP0304-Set2-B-O', '', '', '升级款欧标硅胶分餐勺组合2件套', '橙色', 'RF', 55);
INSERT INTO `data_matching` VALUES (2215, 'OP-EUSP03-M-B-AS', '', '', '升级款欧标硅胶分餐勺', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2216, 'OP-EUSP03-M-B-BK', '', '', '升级款欧标硅胶分餐勺', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2217, 'OP-EUSP03-M-B-MB', '', '', '升级款欧标硅胶分餐勺', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (2218, 'OP-EUSP03-M-B-P', '', '', '升级款欧标硅胶分餐勺', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2219, 'OP-EUSP03-M-B-R', '', '', '升级款欧标硅胶分餐勺', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2220, 'OP-EUSP03-M-B-O', '', '', '升级款欧标硅胶分餐勺', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2221, 'OP-EUSP04-M-B-AS', '', '', '升级款欧标硅胶镂空分餐勺', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2222, 'OP-EUSP04-M-B-BK', '', '', '升级款欧标硅胶镂空分餐勺', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2223, 'OP-EUSP04-M-B-MB', '', '', '升级款欧标硅胶镂空分餐勺', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (2224, 'OP-EUSP04-M-B-P', '', '', '升级款欧标硅胶镂空分餐勺', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2225, 'OP-EUSP04-M-B-R', '', '', '升级款欧标硅胶镂空分餐勺', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2226, 'OP-EUSP04-M-B-O', '', '', '升级款欧标硅胶镂空分餐勺', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2227, 'OP-EUUT03-Set5-B-AS', '', '', '升级款欧标硅胶厨具5件套', '水天色', 'RF', 15);
INSERT INTO `data_matching` VALUES (2228, 'OP-EUUT03-Set5-B-BK', '', '', '升级款欧标硅胶厨具5件套', '黑色', 'RF', 15);
INSERT INTO `data_matching` VALUES (2229, 'OP-EUUT03-Set5-B-MB', '', '', '升级款欧标硅胶厨具5件套', '午夜蓝', 'RF', 15);
INSERT INTO `data_matching` VALUES (2230, 'OP-EUUT03-Set5-B-P', '', '', '升级款欧标硅胶厨具5件套', '紫色', 'RF', 15);
INSERT INTO `data_matching` VALUES (2231, 'OP-EUUT03-Set5-B-R', '', '', '升级款欧标硅胶厨具5件套', '红色', 'RF', 15);
INSERT INTO `data_matching` VALUES (2232, 'OP-EUUT03-Set5-B-O', '', '', '升级款欧标硅胶厨具5件套', '橙色', 'RF', 15);
INSERT INTO `data_matching` VALUES (2233, 'OP-EUUT03A-Set5-B-AS', '', '', '升级款欧标硅胶厨具5件套', '水天色', 'RF', 15);
INSERT INTO `data_matching` VALUES (2234, 'OP-EUUT03A-Set5-B-BK', '', '', '升级款欧标硅胶厨具5件套', '黑色', 'RF', 15);
INSERT INTO `data_matching` VALUES (2235, 'OP-EUUT03A-Set5-B-MB', '', '', '升级款欧标硅胶厨具5件套', '午夜蓝', 'RF', 15);
INSERT INTO `data_matching` VALUES (2236, 'OP-EUUT03A-Set5-B-P', '', '', '升级款欧标硅胶厨具5件套', '紫色', 'RF', 15);
INSERT INTO `data_matching` VALUES (2237, 'OP-EUUT03A-Set5-B-R', '', '', '升级款欧标硅胶厨具5件套', '红色', 'RF', 15);
INSERT INTO `data_matching` VALUES (2238, 'OP-EUUT03A-Set5-B-O', '', '', '升级款欧标硅胶厨具5件套', '橙色', 'RF', 15);
INSERT INTO `data_matching` VALUES (2239, 'EUST07-Jar-B-AS', '', '', '抗菌升级欧标硅胶罐头棒', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2240, 'EUST07-L-B-AS', '', '', '抗菌升级欧标硅胶刮刀大号', '水天色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2241, 'EUST07-S-B-AS', '', '', '抗菌升级欧标硅胶刮刀小号', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2242, 'EUST07-Spoon-B-AS', '', '', '抗菌升级欧标硅胶大勺', '水天色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2243, 'OP-EUTN03-M-B-AS', '', '', '升级款欧标硅胶翻铲', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2244, 'OP-EUTN03-M-B-BK', '', '', '升级款欧标硅胶翻铲', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2245, 'OP-EUTN03-M-B-MB', '', '', '升级款欧标硅胶翻铲', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (2246, 'OP-EUTN03-M-B-P', '', '', '升级款欧标硅胶翻铲', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2247, 'OP-EUTN03-M-B-R', '', '', '升级款欧标硅胶翻铲', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2248, 'OP-EUTN03-M-B-O', '', '', '升级款欧标硅胶翻铲', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2249, 'OP-EUTN04-M-B-AS', '', '', '升级款欧标硅胶镂铲', '水天色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2250, 'OP-EUTN04-M-B-BK', '', '', '升级款欧标硅胶镂铲', '黑色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2251, 'OP-EUTN04-M-B-MB', '', '', '升级款欧标硅胶镂铲', '午夜蓝', 'RF', 110);
INSERT INTO `data_matching` VALUES (2252, 'OP-EUTN04-M-B-P', '', '', '升级款欧标硅胶镂铲', '紫色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2253, 'OP-EUTN04-M-B-R', '', '', '升级款欧标硅胶镂铲', '红色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2254, 'OP-EUTN04-M-B-O', '', '', '升级款欧标硅胶镂铲', '橙色', 'RF', 110);
INSERT INTO `data_matching` VALUES (2255, 'OP-EUTN0304-Set2-B-R', '', '', '升级款欧标硅胶铲组合2件套', '红色', 'RF', 55);
INSERT INTO `data_matching` VALUES (2256, 'OP-EUTN0304-Set2-B-P', '', '', '升级款欧标硅胶铲组合2件套', '紫色', 'RF', 55);
INSERT INTO `data_matching` VALUES (2257, 'OP-EUTN0304-Set2-B-BK', '', '', '升级款欧标硅胶铲组合2件套', '黑色', 'RF', 55);
INSERT INTO `data_matching` VALUES (2258, 'OP-EUTN0304-Set2-B-AS', '', '', '升级款欧标硅胶铲组合2件套', '水天色', 'RF', 55);
INSERT INTO `data_matching` VALUES (2259, 'OP-EUTN0304-Set2-B-O', '', '', '升级款欧标硅胶铲组合2件套', '橙色', 'RF', 55);
INSERT INTO `data_matching` VALUES (2260, 'OP-EUTN0304-Set2-B-MB', '', '', '升级款欧标硅胶铲组合2件套', '午夜蓝', 'RF', 55);
INSERT INTO `data_matching` VALUES (2261, 'FCS-R-2X6oz-AS', '', '', '硅胶储藏盒R款2件套6oz', '水天色', 'RF', 32);
INSERT INTO `data_matching` VALUES (2262, 'FCS-R-2X3oz-AS', '', '', '硅胶储藏盒R款2件套3oz', '水天色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2263, 'FCS-R-2X6#2X3oz-AS', '', '', '硅胶储藏盒R款4件套A', '水天色', 'RF', 32);
INSERT INTO `data_matching` VALUES (2264, 'FCS-R-6oz-AS', '', '', '硅胶储藏盒R款1件套6oz', '水天色', 'RF', 32);
INSERT INTO `data_matching` VALUES (2265, 'FCS-R-3oz-AS', '', '', '硅胶储藏盒R款1件套3oz', '水天色', 'RF', 32);
INSERT INTO `data_matching` VALUES (2266, 'WS-Si-AS', '', '', '中华铲', '水天色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2267, 'RP03-27-BN', '', '', '木擀面杖', '27*3CM', 'JZZM', NULL);
INSERT INTO `data_matching` VALUES (2268, 'RP03-30-BN', '', '', '木擀面杖', '30*3CM', 'JZZM', NULL);
INSERT INTO `data_matching` VALUES (2269, 'RP03-40-BN', '', '', '木擀面杖', '40*3CM', 'JZZM', NULL);
INSERT INTO `data_matching` VALUES (2270, 'G-EUST05C-Spoon-R', '', '', '通用款第四代欧标硅胶大勺', '红色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2271, 'G-EUST05C-Spoon-BK', '', '', '通用款第四代欧标硅胶大勺', '黑色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2272, 'G-EUST05C-Spoon-AS', '', '', '通用款第四代欧标硅胶大勺', '水天色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2273, 'G-EUST05C-Spoon-O', '', '', '通用款第四代欧标硅胶大勺', '橙色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2274, 'G-EUST05C-Spoon-P', '', '', '通用款第四代欧标硅胶大勺', '紫色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2275, 'G-EUST05C-Spoon-MB', '', '', '通用款第四代欧标硅胶大勺', '午夜蓝', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2276, 'A-EUST05C-Spoon-AS', '', '', '第四代欧标硅胶大勺', '水天色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2277, 'A-EUST05C-Spoon-BK', '', '', '第四代欧标硅胶大勺', '黑色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2278, 'A-EUST05C-Spoon-MB', '', '', '第四代欧标硅胶大勺', '午夜蓝', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2279, 'A-EUST05C-Spoon-P', '', '', '第四代欧标硅胶大勺', '紫色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2280, 'A-EUST05C-Spoon-O', '', '', '第四代欧标硅胶大勺', '橙色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2281, 'A-EUST05C-Spoon-R', '', '', '第四代欧标硅胶大勺', '红色', 'JLS', 150);
INSERT INTO `data_matching` VALUES (2282, 'EUST06BC-Set2-R', '', '', '硅胶大勺BC2件套', '红色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2283, 'EUST06BC-Set2-BK', '', '', '硅胶大勺BC2件套', '黑色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2284, 'EUST06BC-Set2-AS', '', '', '硅胶大勺BC2件套', '水天色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2285, 'EUST06BC-Set2-O', '', '', '硅胶大勺BC2件套', '橙色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2286, 'EUST06BC-Set2-P', '', '', '硅胶大勺BC2件套', '紫色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2287, 'EUST06BC-Set2-MB', '', '', '硅胶大勺BC2件套', '午夜蓝', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2288, 'G-EUST06BC-Set2-AS', '', '', '通用款硅胶大勺BC2件套', '水天色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2289, 'G-EUST06BC-Set2-BK', '', '', '通用款硅胶大勺BC2件套', '黑色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2290, 'G-EUST06BC-Set2-MB', '', '', '通用款硅胶大勺BC2件套', '午夜蓝', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2291, 'G-EUST06BC-Set2-P', '', '', '通用款硅胶大勺BC2件套', '紫色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2292, 'G-EUST06BC-Set2-R', '', '', '通用款硅胶大勺BC2件套', '红色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2293, 'G-EUST06BC-Set2-O', '', '', '通用款硅胶大勺BC2件套', '橙色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2294, 'A-EUST06BC-Set2-AS', '', '', '硅胶大勺BC2件套', '水天色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2295, 'A-EUST06BC-Set2-BK', '', '', '硅胶大勺BC2件套', '黑色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2296, 'A-EUST06BC-Set2-MB', '', '', '硅胶大勺BC2件套', '午夜蓝', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2297, 'A-EUST06BC-Set2-P', '', '', '硅胶大勺BC2件套', '紫色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2298, 'A-EUST06BC-Set2-R', '', '', '硅胶大勺BC2件套', '红色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2299, 'A-EUST06BC-Set2-O', '', '', '硅胶大勺BC2件套', '橙色', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2300, 'G-SMS01-Set6', '', '', '通用款方形量勺6件套', '数量：6件套', 'YJ', 60);
INSERT INTO `data_matching` VALUES (2301, 'G-SMS01-Set7', '', '', '通用款方形量勺7件套', '数量：7件套', 'YJ', 60);
INSERT INTO `data_matching` VALUES (2302, 'G-SMS01-Set8', '', '', '通用款方形量勺8件套', '数量：8件套', 'YJ', 60);
INSERT INTO `data_matching` VALUES (2303, 'N-DS01-Trapezoid-W', '', '', '梯形面团刮板', '', 'ZYX', 800);
INSERT INTO `data_matching` VALUES (2304, 'MEW01-18-S', '', '', '迷你打蛋器', '', 'ZF', 1000);
INSERT INTO `data_matching` VALUES (2305, 'HCCM01-4-S', '', '', '不锈钢半熟芝士模具', '4件套', 'XZY', NULL);
INSERT INTO `data_matching` VALUES (2306, 'PM01-5070-TSB', '', '', '揉面垫5070', '磨砂透明', 'RF', 24);
INSERT INTO `data_matching` VALUES (2307, 'PM01-5070-AS', '', '', '揉面垫5070', '水天色', 'RF', 24);
INSERT INTO `data_matching` VALUES (2308, 'PM01-4050-TSB', '', '', '揉面垫4050', '磨砂透明', 'RF', 24);
INSERT INTO `data_matching` VALUES (2309, 'PM01-4050-AS', '', '', '揉面垫4050', '水天色', 'RF', 24);
INSERT INTO `data_matching` VALUES (2310, 'PM02B-4050-TSB', '', '', '揉面垫印刷款4050B', '磨砂透明', 'RF', 24);
INSERT INTO `data_matching` VALUES (2311, 'PM02B-5070-TSB', '', '', '揉面垫印刷款5070B', '磨砂透明', 'RF', 24);
INSERT INTO `data_matching` VALUES (2312, 'PM01B-4050-TSB', '', '', '揉面垫4050B', '磨砂透明', 'RF', 24);
INSERT INTO `data_matching` VALUES (2313, 'PM01-4050-TSB2', '', '', '揉面垫4050磨砂透明款', '磨砂透明', 'RF', 24);
INSERT INTO `data_matching` VALUES (2314, 'PM01-5070-TSB2', '', '', '揉面垫5070磨砂透明款', '磨砂透明', 'RF', 20);
INSERT INTO `data_matching` VALUES (2315, 'ET-FMS01-S-AS', '', '', '面粉筛小号', '水天色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (2316, 'ET-FMS01-S-BK', '', '', '面粉筛小号', '黑色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (2317, 'ET-FMS01-S-R', '', '', '面粉筛小号', '红色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (2318, 'ET-FMS01-S-P', '', '', '面粉筛小号', '紫色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (2319, 'ET-FMS01-S-O', '', '', '面粉筛小号', '橙色', 'HXY', 100);
INSERT INTO `data_matching` VALUES (2320, 'ET-FMS01-S-MB', '', '', '面粉筛小号', '午夜蓝', 'HXY', 100);
INSERT INTO `data_matching` VALUES (2321, 'ET-FMS01-M-R', '', '', '面粉筛中号', '红色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (2322, 'ET-FMS01-M-BK', '', '', '面粉筛中号', '黑色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (2323, 'ET-FMS01-M-AS', '', '', '面粉筛中号', '水天色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (2324, 'ET-FMS01-M-O', '', '', '面粉筛中号', '橙色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (2325, 'ET-FMS01-M-P', '', '', '面粉筛中号', '紫色', 'HXY', 80);
INSERT INTO `data_matching` VALUES (2326, 'ET-FMS01-M-MB', '', '', '面粉筛中号', '午夜蓝', 'HXY', 80);
INSERT INTO `data_matching` VALUES (2327, 'G-KT02S-7-AS', '', '', '通用款硅胶夹头食物夹7寸', '水天色', 'FR', 90);
INSERT INTO `data_matching` VALUES (2328, 'G-KT02S-7-BK', '', '', '通用款硅胶夹头食物夹7寸', '黑色', 'FR', 90);
INSERT INTO `data_matching` VALUES (2329, 'G-KT02S-7-MB', '', '', '通用款硅胶夹头食物夹7寸', '午夜蓝', 'FR', 90);
INSERT INTO `data_matching` VALUES (2330, 'G-KT02S-7-R', '', '', '通用款硅胶夹头食物夹7寸', '红色', 'FR', 90);
INSERT INTO `data_matching` VALUES (2331, 'G-KT02S-7-P', '', '', '通用款硅胶夹头食物夹7寸', '紫色', 'FR', 90);
INSERT INTO `data_matching` VALUES (2332, 'G-KT02S-7-O', '', '', '通用款硅胶夹头食物夹7寸', '橙色', 'FR', 90);
INSERT INTO `data_matching` VALUES (2333, 'G-KT02S-9-AS', '', '', '通用款硅胶夹头食物夹9寸', '水天色', 'FR', 90);
INSERT INTO `data_matching` VALUES (2334, 'G-KT02S-9-BK', '', '', '通用款硅胶夹头食物夹9寸', '黑色', 'FR', 90);
INSERT INTO `data_matching` VALUES (2335, 'G-KT02S-9-MB', '', '', '通用款硅胶夹头食物夹9寸', '午夜蓝', 'FR', 90);
INSERT INTO `data_matching` VALUES (2336, 'G-KT02S-9-R', '', '', '通用款硅胶夹头食物夹9寸', '红色', 'FR', 90);
INSERT INTO `data_matching` VALUES (2337, 'G-KT02S-9-P', '', '', '通用款硅胶夹头食物夹9寸', '紫色', 'FR', 90);
INSERT INTO `data_matching` VALUES (2338, 'G-KT02S-9-O', '', '', '通用款硅胶夹头食物夹9寸', '橙色', 'FR', 90);
INSERT INTO `data_matching` VALUES (2339, 'G-KT02S-12-AS', '', '', '通用款硅胶夹头食物夹12寸', '水天色', 'FR', 70);
INSERT INTO `data_matching` VALUES (2340, 'G-KT02S-12-BK', '', '', '通用款硅胶夹头食物夹12寸', '黑色', 'FR', 70);
INSERT INTO `data_matching` VALUES (2341, 'G-KT02S-12-MB', '', '', '通用款硅胶夹头食物夹12寸', '午夜蓝', 'FR', 70);
INSERT INTO `data_matching` VALUES (2342, 'G-KT02S-12-R', '', '', '通用款硅胶夹头食物夹12寸', '红色', 'FR', 70);
INSERT INTO `data_matching` VALUES (2343, 'G-KT02S-12-P', '', '', '通用款硅胶夹头食物夹12寸', '紫色', 'FR', 70);
INSERT INTO `data_matching` VALUES (2344, 'G-KT02S-12-O', '', '', '通用款硅胶夹头食物夹12寸', '橙色', 'FR', 70);
INSERT INTO `data_matching` VALUES (2345, 'G-KT02S-16-AS', '', '', '通用款硅胶夹头食物夹16寸', '水天色', 'FR', 60);
INSERT INTO `data_matching` VALUES (2346, 'G-KT02S-16-BK', '', '', '通用款硅胶夹头食物夹16寸', '黑色', 'FR', 60);
INSERT INTO `data_matching` VALUES (2347, 'G-KT02S-16-MB', '', '', '通用款硅胶夹头食物夹16寸', '午夜蓝', 'FR', 60);
INSERT INTO `data_matching` VALUES (2348, 'G-KT02S-16-R', '', '', '通用款硅胶夹头食物夹16寸', '红色', 'FR', 60);
INSERT INTO `data_matching` VALUES (2349, 'G-KT02S-16-P', '', '', '通用款硅胶夹头食物夹16寸', '紫色', 'FR', 60);
INSERT INTO `data_matching` VALUES (2350, 'G-KT02S-16-O', '', '', '通用款硅胶夹头食物夹16寸', '橙色', 'FR', 60);
INSERT INTO `data_matching` VALUES (2351, 'G-KT02S-Set2-AS', '', '', '通用款硅胶夹头食物夹2件套', '水天色', 'FR', 40);
INSERT INTO `data_matching` VALUES (2352, 'G-KT02S-Set2-BK', '', '', '通用款硅胶夹头食物夹2件套', '黑色', 'FR', 40);
INSERT INTO `data_matching` VALUES (2353, 'G-KT02S-Set2-MB', '', '', '通用款硅胶夹头食物夹2件套', '午夜蓝', 'FR', 40);
INSERT INTO `data_matching` VALUES (2354, 'G-KT02S-Set2-R', '', '', '通用款硅胶夹头食物夹2件套', '红色', 'FR', 40);
INSERT INTO `data_matching` VALUES (2355, 'G-KT02S-Set2-P', '', '', '通用款硅胶夹头食物夹2件套', '紫色', 'FR', 40);
INSERT INTO `data_matching` VALUES (2356, 'G-KT02S-Set2-O', '', '', '通用款硅胶夹头食物夹2件套', '橙色', 'FR', 40);
INSERT INTO `data_matching` VALUES (2357, 'G-KT02S-Set3-AS', '', '', '通用款硅胶夹头食物夹3件套', '水天色', 'FR', 30);
INSERT INTO `data_matching` VALUES (2358, 'G-KT02S-Set3-BK', '', '', '通用款硅胶夹头食物夹3件套', '黑色', 'FR', 30);
INSERT INTO `data_matching` VALUES (2359, 'G-KT02S-Set3-MB', '', '', '通用款硅胶夹头食物夹3件套', '午夜蓝', 'FR', 30);
INSERT INTO `data_matching` VALUES (2360, 'G-KT02S-Set3-R', '', '', '通用款硅胶夹头食物夹3件套', '红色', 'FR', 30);
INSERT INTO `data_matching` VALUES (2361, 'G-KT02S-Set3-P', '', '', '通用款硅胶夹头食物夹3件套', '紫色', 'FR', 30);
INSERT INTO `data_matching` VALUES (2362, 'G-KT02S-Set3-O', '', '', '通用款硅胶夹头食物夹3件套', '橙色', 'FR', 30);
INSERT INTO `data_matching` VALUES (2363, 'G-EUST05B-S-AS', '', '', '通用款硅胶刮刀小号', '水天色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (2364, 'G-EUST05B-S-R', '', '', '通用款硅胶刮刀小号', '红色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (2365, 'G-EUST05B-S-BK', '', '', '通用款硅胶刮刀小号', '黑色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (2366, 'G-EUST05B-S-O', '', '', '通用款硅胶刮刀小号', '橙色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (2367, 'G-EUST05B-S-P', '', '', '通用款硅胶刮刀小号', '紫色', 'JLS', 200);
INSERT INTO `data_matching` VALUES (2368, 'G-EUST05B-S-MB', '', '', '通用款硅胶刮刀小号', '午夜蓝', 'JLS', 200);
INSERT INTO `data_matching` VALUES (2369, 'G-SC01-15-S', '', '', '通用款咖啡勺15ml', '15ml', 'YJ', 150);
INSERT INTO `data_matching` VALUES (2370, 'G-SC01-30-S', '', '', '通用款咖啡勺30ml', '30ml', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2371, 'G-SC01-15Set2-S', '', '', '通用款咖啡勺2件套15ml', '15ml', 'YJ', 120);
INSERT INTO `data_matching` VALUES (2372, 'G-SC01-30Set2-S', '', '', '通用款咖啡勺2件套30ml', '30ml', 'YJ', 80);
INSERT INTO `data_matching` VALUES (2373, 'G-MS01-5', '', '', '通用款量勺5件套', '数量：5件套', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2374, 'G-MS01-6', '', '', '通用款量勺6件套', '数量：6件套', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2375, 'G-MS01-7', '', '', '通用款量勺7件套', '数量：7件套', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2376, 'G-MS01-8', '', '', '通用款量勺8件套', '数量：8件套', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2377, 'G-MS01-9', '', '', '通用款量勺9件套', '数量：9件套', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2378, 'G-SC01-Set2-S', '', '', '通用款咖啡勺2件套', '2件套', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2379, 'A-DDW-Si-R01-R', '', '', '面团搅拌器', '红色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2380, 'A-DDW-Si-R01-BK', '', '', '面团搅拌器', '黑色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2381, 'A-DDW-Si-R01-AS', '', '', '面团搅拌器', '水天色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2382, 'A-DDW-Si-R01-O', '', '', '面团搅拌器', '橙色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2383, 'A-DDW-Si-R01-P', '', '', '面团搅拌器', '紫色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2384, 'A-DDW-Si-R01-MB', '', '', '面团搅拌器', '午夜蓝', 'RF', 100);
INSERT INTO `data_matching` VALUES (2385, 'DDW-Si-R01-R', '', '', '面团搅拌器', '红色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2386, 'DDW-Si-R01-BK', '', '', '面团搅拌器', '黑色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2387, 'DDW-Si-R01-AS', '', '', '面团搅拌器', '水天色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2388, 'DDW-Si-R01-O', '', '', '面团搅拌器', '橙色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2389, 'DDW-Si-R01-P', '', '', '面团搅拌器', '紫色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2390, 'DDW-Si-R01-MB', '', '', '面团搅拌器', '午夜蓝', 'RF', 100);
INSERT INTO `data_matching` VALUES (2391, 'G-DDW-Si-R01-R', '', '', '通用款面团搅拌器', '红色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2392, 'G-DDW-Si-R01-BK', '', '', '通用款面团搅拌器', '黑色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2393, 'G-DDW-Si-R01-AS', '', '', '通用款面团搅拌器', '水天色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2394, 'G-DDW-Si-R01-O', '', '', '通用款面团搅拌器', '橙色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2395, 'G-DDW-Si-R01-P', '', '', '通用款面团搅拌器', '紫色', 'RF', 100);
INSERT INTO `data_matching` VALUES (2396, 'G-DDW-Si-R01-MB', '', '', '通用款面团搅拌器', '午夜蓝', 'RF', 100);
INSERT INTO `data_matching` VALUES (2397, 'FCS-J-2z-AS', '', '', '硅胶储藏盒J款1件套2oz', '水天色', 'JLS', NULL);
INSERT INTO `data_matching` VALUES (2398, 'FCS-J-4z-AS', '', '', '硅胶储藏盒J款1件套4oz', '水天色', 'JLS', NULL);
INSERT INTO `data_matching` VALUES (2399, 'FCS-J-1c-AS', '', '', '硅胶储藏盒J款1件套1cup', '水天色', 'JLS', NULL);
INSERT INTO `data_matching` VALUES (2400, 'FCS-J-2c-AS', '', '', '硅胶储藏盒J款1件套2cup', '水天色', 'JLS', NULL);
INSERT INTO `data_matching` VALUES (2401, 'FCS-J-2X2z-AS', '', '', '硅胶储藏盒J款2件套2oz', '水天色', 'JLS', 90);
INSERT INTO `data_matching` VALUES (2402, 'FCS-J-2X4z-AS', '', '', '硅胶储藏盒J款2件套4oz', '水天色', 'JLS', 50);
INSERT INTO `data_matching` VALUES (2403, 'FCS-J-2X1c-AS', '', '', '硅胶储藏盒J款2件套1cup', '水天色', 'JLS', 30);
INSERT INTO `data_matching` VALUES (2404, 'FCS-J-2X2c-AS', '', '', '硅胶储藏盒J款2件套2cup', '水天色', 'JLS', 24);
INSERT INTO `data_matching` VALUES (2405, 'FCS-J-FullSet-AS', '', '', '硅胶储藏盒J款4件套A', '水天色', 'JLS', NULL);
INSERT INTO `data_matching` VALUES (2406, 'G-EUST05-R-Set4-AS', '', '', '通用款刮刀4件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2407, 'G-EUST05-R-Set4-MB', '', '', '通用款刮刀4件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (2408, 'G-EUST05-R-Set4-R', '', '', '通用款刮刀4件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2409, 'G-EUST05-R-Set4-BK', '', '', '通用款刮刀4件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2410, 'G-EUST05-R-Set4-O', '', '', '通用款刮刀4件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2411, 'G-EUST05-R-Set4-P', '', '', '通用款刮刀4件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2412, 'G-EUST05-R-Set4-MUL', '', '', '通用款刮刀4件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2413, 'G-EUST05-R-Set4-MUL2', '', '', '通用款刮刀4件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (2414, 'G-EUST05-R-Set4-MUL3', '', '', '通用款刮刀4件套', '混色3', 'RF', 45);
INSERT INTO `data_matching` VALUES (2415, 'G-EUST05-R-Set4-MUL4', '', '', '通用款刮刀4件套', '混色4', 'RF', 45);
INSERT INTO `data_matching` VALUES (2416, 'G-EUST05-R-Set3-AS', '', '', '通用款刮刀3件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2417, 'G-EUST05-R-Set3-MB', '', '', '通用款刮刀3件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (2418, 'G-EUST05-R-Set3-R', '', '', '通用款刮刀3件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2419, 'G-EUST05-R-Set3-BK', '', '', '通用款刮刀3件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2420, 'G-EUST05-R-Set3-O', '', '', '通用款刮刀3件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2421, 'G-EUST05-R-Set3-P', '', '', '通用款刮刀3件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2422, 'G-EUST05-R-Set3-MUL', '', '', '通用款刮刀3件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2423, 'G-EUST05-R-Set3-MUL2', '', '', '通用款刮刀3件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (2424, 'G-EUST05-R-Set2-AS', '', '', '通用款刮刀2件套', '水天色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2425, 'G-EUST05-R-Set2-MB', '', '', '通用款刮刀2件套', '午夜蓝', 'RF', 72);
INSERT INTO `data_matching` VALUES (2426, 'G-EUST05-R-Set2-R', '', '', '通用款刮刀2件套', '红色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2427, 'G-EUST05-R-Set2-BK', '', '', '通用款刮刀2件套', '黑色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2428, 'G-EUST05-R-Set2-O', '', '', '通用款刮刀2件套', '橙色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2429, 'G-EUST05-R-Set2-P', '', '', '通用款刮刀2件套', '紫色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2430, 'G-EUST05-R-Set2-MUL', '', '', '通用款刮刀2件套', '混色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2431, 'G-EUST05-R-Set2-MUL2', '', '', '通用款刮刀2件套', '混色2', 'RF', 72);
INSERT INTO `data_matching` VALUES (2432, 'G-EUST06-R-Set3-AS', '', '', '通用款大勺3件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2433, 'G-EUST06-R-Set3-MB', '', '', '通用款大勺3件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (2434, 'G-EUST06-R-Set3-R', '', '', '通用款大勺3件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2435, 'G-EUST06-R-Set3-BK', '', '', '通用款大勺3件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2436, 'G-EUST06-R-Set3-O', '', '', '通用款大勺3件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2437, 'G-EUST06-R-Set3-P', '', '', '通用款大勺3件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2438, 'G-EUST06-R-Set3-MUL', '', '', '通用款大勺3件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2439, 'G-EUST06-R-Set3-MUL2', '', '', '通用款大勺3件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (2440, 'G-EUST06-R-Set3-MUL3', '', '', '通用款大勺3件套', '混色3', 'RF', 45);
INSERT INTO `data_matching` VALUES (2441, 'G-EUST05-R-L-AS', '', '', '通用款硅胶刮刀大号', '水天色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2442, 'G-EUST05-R-L-MB', '', '', '通用款硅胶刮刀大号', '午夜蓝', 'RF', 150);
INSERT INTO `data_matching` VALUES (2443, 'G-EUST05-R-L-R', '', '', '通用款硅胶刮刀大号', '红色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2444, 'G-EUST05-R-L-BK', '', '', '通用款硅胶刮刀大号', '黑色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2445, 'G-EUST05-R-L-O', '', '', '通用款硅胶刮刀大号', '橙色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2446, 'G-EUST05-R-L-P', '', '', '通用款硅胶刮刀大号', '紫色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2447, 'G-EUST05-R-Spoon-AS', '', '', '通用款硅胶大勺', '水天色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2448, 'G-EUST05-R-Spoon-MB', '', '', '通用款硅胶大勺', '午夜蓝', 'RF', 145);
INSERT INTO `data_matching` VALUES (2449, 'G-EUST05-R-Spoon-R', '', '', '通用款硅胶大勺', '红色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2450, 'G-EUST05-R-Spoon-BK', '', '', '通用款硅胶大勺', '黑色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2451, 'G-EUST05-R-Spoon-O', '', '', '通用款硅胶大勺', '橙色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2452, 'G-EUST05-R-Spoon-P', '', '', '通用款硅胶大勺', '紫色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2453, 'G-EUST05-R-S-AS', '', '', '通用款硅胶刮刀小号', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2454, 'G-EUST05-R-S-MB', '', '', '通用款硅胶刮刀小号', '午夜蓝', 'RF', 200);
INSERT INTO `data_matching` VALUES (2455, 'G-EUST05-R-S-R', '', '', '通用款硅胶刮刀小号', '红色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2456, 'G-EUST05-R-S-BK', '', '', '通用款硅胶刮刀小号', '黑色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2457, 'G-EUST05-R-S-O', '', '', '通用款硅胶刮刀小号', '橙色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2458, 'G-EUST05-R-S-P', '', '', '通用款硅胶刮刀小号', '紫色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2459, 'A-EUST05-R-L-AS', '', '', '升级欧标硅胶刮刀大号', '水天色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2460, 'A-EUST05-R-L-MB', '', '', '升级欧标硅胶刮刀大号', '午夜蓝', 'RF', 150);
INSERT INTO `data_matching` VALUES (2461, 'A-EUST05-R-L-R', '', '', '升级欧标硅胶刮刀大号', '红色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2462, 'A-EUST05-R-L-BK', '', '', '升级欧标硅胶刮刀大号', '黑色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2463, 'A-EUST05-R-L-O', '', '', '升级欧标硅胶刮刀大号', '橙色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2464, 'A-EUST05-R-L-P', '', '', '升级欧标硅胶刮刀大号', '紫色', 'RF', 150);
INSERT INTO `data_matching` VALUES (2465, 'A-EUST05-R-Spoon-AS', '', '', '升级欧标硅胶大勺', '水天色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2466, 'A-EUST05-R-Spoon-MB', '', '', '升级欧标硅胶大勺', '午夜蓝', 'RF', 145);
INSERT INTO `data_matching` VALUES (2467, 'A-EUST05-R-Spoon-R', '', '', '升级欧标硅胶大勺', '红色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2468, 'A-EUST05-R-Spoon-BK', '', '', '升级欧标硅胶大勺', '黑色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2469, 'A-EUST05-R-Spoon-O', '', '', '升级欧标硅胶大勺', '橙色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2470, 'A-EUST05-R-Spoon-P', '', '', '升级欧标硅胶大勺', '紫色', 'RF', 145);
INSERT INTO `data_matching` VALUES (2471, 'A-EUST05-R-S-AS', '', '', '升级欧标硅胶刮刀小号', '水天色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2472, 'A-EUST05-R-S-MB', '', '', '升级欧标硅胶刮刀小号', '午夜蓝', 'RF', 200);
INSERT INTO `data_matching` VALUES (2473, 'A-EUST05-R-S-R', '', '', '升级欧标硅胶刮刀小号', '红色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2474, 'A-EUST05-R-S-BK', '', '', '升级欧标硅胶刮刀小号', '黑色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2475, 'A-EUST05-R-S-O', '', '', '升级欧标硅胶刮刀小号', '橙色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2476, 'A-EUST05-R-S-P', '', '', '升级欧标硅胶刮刀小号', '紫色', 'RF', 200);
INSERT INTO `data_matching` VALUES (2477, 'A-EUST05-R-Set4-AS', '', '', '升级欧标硅胶刮刀4件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2478, 'A-EUST05-R-Set4-MB', '', '', '升级欧标硅胶刮刀4件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (2479, 'A-EUST05-R-Set4-R', '', '', '升级欧标硅胶刮刀4件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2480, 'A-EUST05-R-Set4-BK', '', '', '升级欧标硅胶刮刀4件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2481, 'A-EUST05-R-Set4-O', '', '', '升级欧标硅胶刮刀4件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2482, 'A-EUST05-R-Set4-P', '', '', '升级欧标硅胶刮刀4件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2483, 'A-EUST05-R-Set4-MUL', '', '', '升级欧标硅胶刮刀4件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2484, 'A-EUST05-R-Set4-MUL2', '', '', '升级欧标硅胶刮刀4件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (2485, 'A-EUST05-R-Set3-AS', '', '', '升级欧标硅胶刮刀3件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2486, 'A-EUST05-R-Set3-MB', '', '', '升级欧标硅胶刮刀3件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (2487, 'A-EUST05-R-Set3-R', '', '', '升级欧标硅胶刮刀3件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2488, 'A-EUST05-R-Set3-BK', '', '', '升级欧标硅胶刮刀3件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2489, 'A-EUST05-R-Set3-O', '', '', '升级欧标硅胶刮刀3件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2490, 'A-EUST05-R-Set3-P', '', '', '升级欧标硅胶刮刀3件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2491, 'A-EUST05-R-Set3-MUL', '', '', '升级欧标硅胶刮刀3件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2492, 'A-EUST05-R-Set3-MUL2', '', '', '升级欧标硅胶刮刀3件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (2493, 'A-EUST05-R-Set2-AS', '', '', '升级欧标硅胶刮刀2件套', '水天色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2494, 'A-EUST05-R-Set2-MB', '', '', '升级欧标硅胶刮刀2件套', '午夜蓝', 'RF', 72);
INSERT INTO `data_matching` VALUES (2495, 'A-EUST05-R-Set2-R', '', '', '升级欧标硅胶刮刀2件套', '红色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2496, 'A-EUST05-R-Set2-BK', '', '', '升级欧标硅胶刮刀2件套', '黑色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2497, 'A-EUST05-R-Set2-O', '', '', '升级欧标硅胶刮刀2件套', '橙色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2498, 'A-EUST05-R-Set2-P', '', '', '升级欧标硅胶刮刀2件套', '紫色', 'RF', 72);
INSERT INTO `data_matching` VALUES (2499, 'A-EUST06-R-Set3-AS', '', '', '升级欧标硅胶大勺3件套', '水天色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2500, 'A-EUST06-R-Set3-MB', '', '', '升级欧标硅胶大勺3件套', '午夜蓝', 'RF', 45);
INSERT INTO `data_matching` VALUES (2501, 'A-EUST06-R-Set3-R', '', '', '升级欧标硅胶大勺3件套', '红色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2502, 'A-EUST06-R-Set3-BK', '', '', '升级欧标硅胶大勺3件套', '黑色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2503, 'A-EUST06-R-Set3-O', '', '', '升级欧标硅胶大勺3件套', '橙色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2504, 'A-EUST06-R-Set3-P', '', '', '升级欧标硅胶大勺3件套', '紫色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2505, 'A-EUST06-R-Set3-MUL', '', '', '升级欧标硅胶大勺3件套', '混色', 'RF', 45);
INSERT INTO `data_matching` VALUES (2506, 'A-EUST06-R-Set3-MUL2', '', '', '升级欧标硅胶大勺3件套', '混色2', 'RF', 45);
INSERT INTO `data_matching` VALUES (2507, 'SC02-S15-S', '', '', '长手柄咖啡勺小号', '银色/容量:15ml', 'YJ', 200);
INSERT INTO `data_matching` VALUES (2508, 'SC02-S30-S', '', '', '长手柄咖啡勺小号', '银色/容量:30ml', 'YJ', 200);
INSERT INTO `data_matching` VALUES (2509, 'G-SC02-S15-S', '', '', '通用款长手柄咖啡勺小号', '银色/容量:15ml', 'YJ', 200);
INSERT INTO `data_matching` VALUES (2510, 'G-SC02-S30-S', '', '', '通用款长手柄咖啡勺小号', '银色/容量:30ml', 'YJ', 200);
INSERT INTO `data_matching` VALUES (2511, 'SC02-SSet2-S', '', '', '长手柄咖啡勺小号两件套', '数量：2件套', 'YJ', 150);
INSERT INTO `data_matching` VALUES (2512, 'G-SC02-SSet2-S', '', '', '通用款长手柄咖啡勺小号两件套', '数量：2件套', 'YJ', 150);
INSERT INTO `data_matching` VALUES (2513, 'RS-Tpx-TSB', '', '', '不沾饭勺', '磨砂透明', 'RF', 120);
INSERT INTO `data_matching` VALUES (2514, 'SM-3-S', '', '', '雪媚娘模具', '银色', 'ZY', 100);
INSERT INTO `data_matching` VALUES (2515, 'G-SC03-S15-S', '', '', '通用款长手柄咖啡勺小号', '15ml/银色', 'YJ', 200);
INSERT INTO `data_matching` VALUES (2516, 'G-SC03-S30-S', '', '', '通用款长手柄咖啡勺小号', '30ml/银色', 'YJ', 200);
INSERT INTO `data_matching` VALUES (2517, 'G-SC03-SSet2-S', '', '', '通用款长手柄咖啡勺小号2件套', '2件套/银色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (2518, 'G-SC03-L15-S', '', '', '通用款长手柄咖啡勺大号', '15ml/银色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (2519, 'G-SC03-L30-S', '', '', '通用款长手柄咖啡勺大号', '30ml/银色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (2520, 'G-SC03-LSet2-S', '', '', '通用款长手柄咖啡勺大号2件套', '2件套/银色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2521, 'SC03-S15-S', '', '', '长手柄咖啡勺小号', '15ml/银色', 'YJ', 200);
INSERT INTO `data_matching` VALUES (2522, 'SC03-S30-S', '', '', '长手柄咖啡勺小号', '30ml/银色', 'YJ', 200);
INSERT INTO `data_matching` VALUES (2523, 'SC03-SSet2-S', '', '', '长手柄咖啡勺小号2件套', '2件套/银色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (2524, 'SC03-L15-S', '', '', '长手柄咖啡勺大号', '15ml/银色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (2525, 'SC03-L30-S', '', '', '长手柄咖啡勺大号', '30ml/银色', 'YJ', 150);
INSERT INTO `data_matching` VALUES (2526, 'SC03-LSet2-S', '', '', '长手柄咖啡勺大号2件套', '2件套/银色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2527, 'G-SC03-M15-S', '', '', '通用款长手柄咖啡勺中号', '15ml/银色', 'YJ', 180);
INSERT INTO `data_matching` VALUES (2528, 'G-SC03-M30-S', '', '', '通用款长手柄咖啡勺中号', '30ml/银色', 'YJ', 180);
INSERT INTO `data_matching` VALUES (2529, 'G-SC03-MSet2-S', '', '', '通用款长手柄咖啡勺中号2件套', '2件套/银色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2530, 'SC03-M15-S', '', '', '长手柄咖啡勺中号', '15ml/银色', 'YJ', 180);
INSERT INTO `data_matching` VALUES (2531, 'SC03-M30-S', '', '', '长手柄咖啡勺中号', '30ml/银色', 'YJ', 180);
INSERT INTO `data_matching` VALUES (2532, 'SC03-MSet2-S', '', '', '长手柄咖啡勺中号2件套', '2件套/银色', 'YJ', 100);
INSERT INTO `data_matching` VALUES (2533, 'DML-P-S100-W', '', '', '一次性玛芬纸杯', '白色', 'AJ', 500);
INSERT INTO `data_matching` VALUES (2534, 'WS-Si-R', '', '', '中华铲', '红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2535, 'WS-Si-BK', '', '', '中华铲', '黑色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2536, 'WS-Si-O', '', '', '中华铲', '橙色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2537, 'WS-Si-P', '', '', '中华铲', '紫色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2538, 'WS-Si-MB', '', '', '中华铲', '午夜蓝', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2539, 'WS-Si-PK', '', '', '中华铲', '粉色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2540, 'WS-Si-TR', '', '', '中华铲', '番茄红', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2541, 'WS-Si-F', '', '', '中华铲', '玫红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2542, 'G-WS-Si-AS', '', '', '通用款中华铲', '水天色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2543, 'G-WS-Si-R', '', '', '通用款中华铲', '红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2544, 'G-WS-Si-BK', '', '', '通用款中华铲', '黑色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2545, 'G-WS-Si-O', '', '', '通用款中华铲', '橙色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2546, 'G-WS-Si-P', '', '', '通用款中华铲', '紫色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2547, 'G-WS-Si-MB', '', '', '通用款中华铲', '午夜蓝', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2548, 'G-WS-Si-PK', '', '', '通用款中华铲', '粉色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2549, 'G-WS-Si-TR', '', '', '通用款中华铲', '番茄红', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2550, 'G-WS-Si-F', '', '', '通用款中华铲', '玫红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2551, 'A-WS-Si-AS', '', '', '中华铲', '水天色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2552, 'A-WS-Si-R', '', '', '中华铲', '红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2553, 'A-WS-Si-BK', '', '', '中华铲', '黑色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2554, 'A-WS-Si-O', '', '', '中华铲', '橙色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2555, 'A-WS-Si-P', '', '', '中华铲', '紫色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2556, 'A-WS-Si-MB', '', '', '中华铲', '午夜蓝', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2557, 'A-WS-Si-PK', '', '', '中华铲', '粉色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2558, 'A-WS-Si-TR', '', '', '中华铲', '番茄红', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2559, 'A-WS-Si-F', '', '', '中华铲', '玫红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2560, 'RP02-20-BN', '', '', '木擀面杖', '20cm', 'QJ', NULL);
INSERT INTO `data_matching` VALUES (2561, 'ET-EW01C-L-BK', '', '', '搅拌器大号', '黑色', 'RF', 60);
INSERT INTO `data_matching` VALUES (2562, 'ET-EW01C-L-R', '', '', '搅拌器大号', '红色', 'RF', 60);
INSERT INTO `data_matching` VALUES (2563, 'ET-EW01C-L-AS', '', '', '搅拌器大号', '水天色', 'RF', 60);
INSERT INTO `data_matching` VALUES (2564, 'ET-EW01C-L-O', '', '', '搅拌器大号', '橙色', 'RF', 60);
INSERT INTO `data_matching` VALUES (2565, 'ET-EW01C-L-P', '', '', '搅拌器大号', '紫色', 'RF', 60);
INSERT INTO `data_matching` VALUES (2566, 'ET-EW01C-L-MB', '', '', '搅拌器大号', '午夜蓝', 'RF', 60);
INSERT INTO `data_matching` VALUES (2567, 'ET-EW01C-M-R', '', '', '搅拌器中号', '红色', 'RF', 70);
INSERT INTO `data_matching` VALUES (2568, 'ET-EW01C-M-BK', '', '', '搅拌器中号', '黑色', 'RF', 70);
INSERT INTO `data_matching` VALUES (2569, 'ET-EW01C-M-AS', '', '', '搅拌器中号', '水天色', 'RF', 70);
INSERT INTO `data_matching` VALUES (2570, 'ET-EW01C-M-O', '', '', '搅拌器中号', '橙色', 'RF', 70);
INSERT INTO `data_matching` VALUES (2571, 'ET-EW01C-M-P', '', '', '搅拌器中号', '紫色', 'RF', 70);
INSERT INTO `data_matching` VALUES (2572, 'ET-EW01C-M-MB', '', '', '搅拌器中号', '午夜蓝', 'RF', 70);
INSERT INTO `data_matching` VALUES (2573, 'G-EW01C-L-R', '', '', '通用款搅拌器大号', '红色', 'RF', 60);
INSERT INTO `data_matching` VALUES (2574, 'G-EW01C-L-BK', '', '', '通用款搅拌器大号', '黑色', 'RF', 60);
INSERT INTO `data_matching` VALUES (2575, 'G-EW01C-L-AS', '', '', '通用款搅拌器大号', '水天色', 'RF', 60);
INSERT INTO `data_matching` VALUES (2576, 'G-EW01C-L-O', '', '', '通用款搅拌器大号', '橙色', 'RF', 60);
INSERT INTO `data_matching` VALUES (2577, 'G-EW01C-L-P', '', '', '通用款搅拌器大号', '紫色', 'RF', 60);
INSERT INTO `data_matching` VALUES (2578, 'G-EW01C-L-MB', '', '', '通用款搅拌器大号', '午夜蓝', 'RF', 60);
INSERT INTO `data_matching` VALUES (2579, 'G-EW01C-M-R', '', '', '通用款搅拌器中号', '红色', 'RF', 70);
INSERT INTO `data_matching` VALUES (2580, 'G-EW01C-M-BK', '', '', '通用款搅拌器中号', '黑色', 'RF', 70);
INSERT INTO `data_matching` VALUES (2581, 'G-EW01C-M-AS', '', '', '通用款搅拌器中号', '水天色', 'RF', 70);
INSERT INTO `data_matching` VALUES (2582, 'G-EW01C-M-O', '', '', '通用款搅拌器中号', '橙色', 'RF', 70);
INSERT INTO `data_matching` VALUES (2583, 'G-EW01C-M-P', '', '', '通用款搅拌器中号', '紫色', 'RF', 70);
INSERT INTO `data_matching` VALUES (2584, 'G-EW01C-M-MB', '', '', '通用款搅拌器中号', '午夜蓝', 'RF', 70);
INSERT INTO `data_matching` VALUES (2585, 'G-EUST05B-Set4-MB', '', '', '通用款欧标硅胶刮刀4件套', '午夜蓝', 'JLS', 45);
INSERT INTO `data_matching` VALUES (2586, 'G-EUST06B-Set3-MB', '', '', '通用款欧标硅胶大勺3件套', '午夜蓝', 'JLS', 45);
INSERT INTO `data_matching` VALUES (2587, 'G-EUST05B-Set3-MB', '', '', '通用款欧标硅胶刮刀3件套', '午夜蓝', 'JLS', 45);
INSERT INTO `data_matching` VALUES (2588, 'G-EUST05B-Set2-MB', '', '', '通用款欧标硅胶刮刀2件套', '午夜蓝', 'JLS', 72);
INSERT INTO `data_matching` VALUES (2589, 'OP-EUSP04A-M-B-P', '', '', '升级款欧标硅胶镂空分餐勺', '紫色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2590, 'OP-EUSP04A-M-B-MB', '', '', '升级款欧标硅胶镂空分餐勺', '午夜蓝', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2591, 'OP-EUTN03A-M-B-BK', '', '', '升级款欧标硅胶翻铲', '黑色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2592, 'OP-EUTN03A-M-B-R', '', '', '升级款欧标硅胶翻铲', '红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2593, 'OP-EUTN03A-M-B-AS', '', '', '升级款欧标硅胶翻铲', '水天色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2594, 'OP-EUTN03A-M-B-O', '', '', '升级款欧标硅胶翻铲', '橙色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2595, 'OP-EUTN03A-M-B-P', '', '', '升级款欧标硅胶翻铲', '紫色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2596, 'OP-EUTN03A-M-B-MB', '', '', '升级款欧标硅胶翻铲', '午夜蓝', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2597, 'OP-EUTN04A-M-B-BK', '', '', '升级款欧标硅胶镂铲', '黑色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2598, 'OP-EUTN04A-M-B-R', '', '', '升级款欧标硅胶镂铲', '红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2599, 'OP-EUTN04A-M-B-AS', '', '', '升级款欧标硅胶镂铲', '水天色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2600, 'OP-EUTN04A-M-B-O', '', '', '升级款欧标硅胶镂铲', '橙色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2601, 'OP-EUTN04A-M-B-P', '', '', '升级款欧标硅胶镂铲', '紫色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2602, 'OP-EUTN04A-M-B-MB', '', '', '升级款欧标硅胶镂铲', '午夜蓝', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2603, 'A-EUST05-XLSpoon-B-BK', '', '', '升级欧标硅胶长手柄大勺', '黑色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2604, 'A-EUST05-XLSpoon-B-R', '', '', '升级欧标硅胶长手柄大勺', '红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2605, 'A-EUST05-XLSpoon-B-AS', '', '', '升级欧标硅胶长手柄大勺', '水天色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2606, 'A-EUST05-XLSpoon-B-O', '', '', '升级欧标硅胶长手柄大勺', '橙色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2607, 'A-EUST05-XLSpoon-B-P', '', '', '升级欧标硅胶长手柄大勺', '紫色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2608, 'A-EUST05-XLSpoon-B-MB', '', '', '升级欧标硅胶长手柄大勺', '午夜蓝', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2609, 'G-EUST05-XLSpoon-B-BK', '', '', '通用款硅胶长手柄大勺', '黑色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2610, 'G-EUST05-XLSpoon-B-R', '', '', '通用款硅胶长手柄大勺', '红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2611, 'G-EUST05-XLSpoon-B-AS', '', '', '通用款硅胶长手柄大勺', '水天色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2612, 'G-EUST05-XLSpoon-B-O', '', '', '通用款硅胶长手柄大勺', '橙色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2613, 'G-EUST05-XLSpoon-B-P', '', '', '通用款硅胶长手柄大勺', '紫色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2614, 'G-EUST05-XLSpoon-B-MB', '', '', '通用款硅胶长手柄大勺', '午夜蓝', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2615, 'FCSA-J-2z-AS', '', '', '硅胶储藏盒J款1件套2oz', '水天色', 'JLS', NULL);
INSERT INTO `data_matching` VALUES (2616, 'FCSA-J-4z-AS', '', '', '硅胶储藏盒J款1件套4oz', '水天色', 'JLS', NULL);
INSERT INTO `data_matching` VALUES (2617, 'FCSA-J-1c-AS', '', '', '硅胶储藏盒J款1件套1cup', '水天色', 'JLS', NULL);
INSERT INTO `data_matching` VALUES (2618, 'FCSA-J-2c-AS', '', '', '硅胶储藏盒J款1件套2cup', '水天色', 'JLS', NULL);
INSERT INTO `data_matching` VALUES (2619, 'OP-EUSP03A-M-B-BK', '', '', '升级款欧标硅胶分餐勺', '黑色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2620, 'OP-EUSP03A-M-B-R', '', '', '升级款欧标硅胶分餐勺', '红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2621, 'OP-EUSP03A-M-B-AS', '', '', '升级款欧标硅胶分餐勺', '水天色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2622, 'OP-EUSP03A-M-B-O', '', '', '升级款欧标硅胶分餐勺', '橙色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2623, 'EUST05-XLSpoon-B-BK', '', '', '升级欧标硅胶长手柄大勺', '黑色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2624, 'EUST05-XLSpoon-B-R', '', '', '升级欧标硅胶长手柄大勺', '红色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2625, 'EUST05-XLSpoon-B-AS', '', '', '升级欧标硅胶长手柄大勺', '水天色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2626, 'EUST05-XLSpoon-B-O', '', '', '升级欧标硅胶长手柄大勺', '橙色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2627, 'EUST05-XLSpoon-B-P', '', '', '升级欧标硅胶长手柄大勺', '紫色', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2628, 'EUST05-XLSpoon-B-MB', '', '', '升级欧标硅胶长手柄大勺', '午夜蓝', 'RF', NULL);
INSERT INTO `data_matching` VALUES (2629, 'G-HCCM01-4-S', '', '', '通用款半熟芝士模具', '4件套', 'DN', NULL);
INSERT INTO `data_matching` VALUES (2630, 'SM-88-BK', '', '', '2.6L雪融冰沙机', '黑色', 'DZL', NULL);
INSERT INTO `data_matching` VALUES (2631, '1', NULL, NULL, '1', NULL, '1', 1);
INSERT INTO `data_matching` VALUES (2632, '1', NULL, NULL, '1', NULL, '1', 1);
INSERT INTO `data_matching` VALUES (2633, '1', NULL, NULL, '1', NULL, '1', 1);

-- ----------------------------
-- Table structure for invitation_code
-- ----------------------------
DROP TABLE IF EXISTS `invitation_code`;
CREATE TABLE `invitation_code`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邀请码',
  `generator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '生成者（SYSTEM表示系统生成）',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '0-未使用 1-已使用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `use_count` int NOT NULL DEFAULT 1 COMMENT '最大使用次数',
  `used_count` int NOT NULL DEFAULT 0 COMMENT '已使用次数',
  `user_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ADMIN' COMMENT '允许注册的用户类型',
  `bind_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '绑定邮箱（当需要特定邮箱使用时）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邀请码表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of invitation_code
-- ----------------------------

-- ----------------------------
-- Table structure for invite_application
-- ----------------------------
DROP TABLE IF EXISTS `invite_application`;
CREATE TABLE `invite_application`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `applicant_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申请邮箱（必须为企业邮箱）',
  `apply_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '申请理由',
  `status` enum('PENDING','APPROVED','REJECTED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `invite_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成的邀请码',
  `reviewer_id` int NULL DEFAULT NULL COMMENT '审核人ID（关联user.id）',
  `review_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '审核意见',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_applicant_email`(`applicant_email` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邀请码申请表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of invite_application
-- ----------------------------

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '今天系统正式上线，开始内测', '今天系统正式上线，开始内测', '2023-09-05', 'admin');
INSERT INTO `notice` VALUES (2, '所有功能都已完成，可以正常使用', '所有功能都已完成，可以正常使用', '2023-09-05', 'admin');
INSERT INTO `notice` VALUES (3, '今天天气很不错，可以出去一起玩了', '今天天气很不错，可以出去一起玩了', '2023-09-05', 'admin');

-- ----------------------------
-- Table structure for procurement_needs
-- ----------------------------
DROP TABLE IF EXISTS `procurement_needs`;
CREATE TABLE `procurement_needs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `input_date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据输入日期',
  `plan_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计划编号',
  `plan_auxiliary_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计划编号辅助列',
  `SKU` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品名',
  `attribute` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '颜色及规格',
  `expected_arrival_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '期望到货时间',
  `factory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '工厂',
  `warehouse` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '仓库',
  `shop` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '店铺',
  `purchase_volume` int NULL DEFAULT NULL COMMENT '采购量',
  `carton_number` int NULL DEFAULT NULL COMMENT '装箱数',
  `has_full` tinyint(1) NULL DEFAULT NULL COMMENT '是否整箱',
  `has_new` tinyint(1) NULL DEFAULT NULL COMMENT '是否新增',
  `has_urgent` tinyint(1) NULL DEFAULT NULL COMMENT '是否加急',
  `operation_remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运营备注',
  `delivery_date_response` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '交期答复1',
  `delivery_date_response_feishu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '交期答复2（飞书）',
  `ordered_quantity` int NULL DEFAULT NULL COMMENT '已下单数量',
  `pending_arrival_quantity` int NULL DEFAULT NULL COMMENT '待到货数量',
  `received_quantity` int NULL DEFAULT NULL COMMENT '已到货量',
  `remaining_unprocured_quantity` int NULL DEFAULT NULL COMMENT '剩余未采购量',
  `has_full_procurement` tinyint(1) NULL DEFAULT NULL COMMENT '是否完全采购',
  `has_all_items_arrived` tinyint(1) NULL DEFAULT NULL COMMENT '是否全部到货',
  `purchase_notes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '采购备注',
  `deliver_or_product_time` int NULL DEFAULT NULL COMMENT '交货/生产时长',
  `expect_arrival_time_countdown` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '期望到货时间倒计时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '采购需求' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of procurement_needs
-- ----------------------------
INSERT INTO `procurement_needs` VALUES (125, '2025-04-29', '', '', 'UTSPOONS01-9', '量勺9件套', '/', '', 'YJ', '', '', NULL, 100, 0, 0, 0, '', '', '', NULL, NULL, NULL, NULL, 0, 0, '', NULL, NULL);
INSERT INTO `procurement_needs` VALUES (126, '2025-04-29', '', '', 'UTSPOONS01-8', '量勺8件套', '/', '', 'YJ', '', '', NULL, 100, 0, 0, 0, '', '', '', NULL, NULL, NULL, NULL, 0, 0, '', NULL, NULL);
INSERT INTO `procurement_needs` VALUES (127, '2025-04-29', '', '', 'UTSPOONS01-7', '量勺7件套', '/', '', 'YJ', '', '', NULL, 100, 0, 0, 0, '', '', '', NULL, NULL, NULL, NULL, 0, 0, '', NULL, NULL);
INSERT INTO `procurement_needs` VALUES (128, '2025-04-29', '', '', 'UTSPOONS01-9', '量勺9件套', '/', '', 'YJ', '', '', NULL, 100, 0, 0, 0, '', '', '', NULL, NULL, NULL, NULL, 0, 0, '', NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `feishu_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飞书开放平台用户唯一标识',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'BCrypt加密密码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像URL',
  `role` enum('USER','ADMIN','SUPER_ADMIN') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `sex` enum('MALE','FEMALE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '飞书企业邮箱',
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '扩展信息',
  `birth` date NULL DEFAULT NULL,
  `salt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码盐（如使用加盐算法）',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '注册IP',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_feishu_user_id`(`feishu_user_id` ASC) USING BTREE,
  UNIQUE INDEX `uniq_email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `uniq_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
