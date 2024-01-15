/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:3306
 Source Schema         : ai

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 15/01/2024 16:21:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` bigint NOT NULL,
  `banner_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `jump_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `is_deleted` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1704562802910, '上线', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-06/fb0c6895-2be7-437f-a96d-d23041190015.jpg', NULL, '1', '2024-01-07 01:40:03', '2024-01-07 01:40:03', 0);
INSERT INTO `banner` VALUES (1704562863106, 'GPTX即将上线', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-06/54e30976-b51e-4aeb-b699-392b80dd5dff.jpg', NULL, '1', '2024-01-07 01:41:03', '2024-01-07 01:41:03', 0);
INSERT INTO `banner` VALUES (1704562896615, 'AI元年', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-06/8d79a372-38e8-48bd-a278-7e4d4c5dac7c.jpg', NULL, '1', '2024-01-07 01:41:37', '2024-01-07 01:41:37', 0);
INSERT INTO `banner` VALUES (1704562935276, 'AIX挖矿', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-06/827b7b45-6eed-4a91-9b0b-ca608a84b9fe.jpg', NULL, '1', '2024-01-07 01:42:15', '2024-01-07 01:42:15', 0);

-- ----------------------------
-- Table structure for contract_transaction_event
-- ----------------------------
DROP TABLE IF EXISTS `contract_transaction_event`;
CREATE TABLE `contract_transaction_event`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tx_hash` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易HASH',
  `contract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合约',
  `network_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网络类型',
  `block_number` bigint NULL DEFAULT NULL COMMENT '区块位置',
  `block_hash` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区块HASH',
  `from_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款钱包',
  `to_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款钱包',
  `token_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合约名称',
  `token_symbol` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合约符号',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易金额（包含token_decimal 个 0）',
  `token_decimal` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易指数（合约单位0个数）',
  `status` tinyint NULL DEFAULT 1 COMMENT '事件处理状态（1：待处理，2：已处理）',
  `time_stamp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件时间戳',
  `transaction_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '交易详情（JSONString）',
  `wallet_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1745070467452092417 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Web3合约交易事件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of contract_transaction_event
-- ----------------------------
INSERT INTO `contract_transaction_event` VALUES (1742834047749672962, '0xad5aedd91b20421f01ae9b190ec4d8c2db9a3d6098f60f04d6043cc00a00b5fc', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36522840, '0x404b6612c4f52998f1b633dd9325b2bdfc5b3b8e66d85266e629288d0f2711fd', '0xc3794b3f741418612d2ebf35245209995596bfc8', '0xda77018ec185aa0913dacf4cf5522588e242a37c', 'BBB', NULL, '162520000000000000000', '18', 1, '1704277939', NULL, 1);
INSERT INTO `contract_transaction_event` VALUES (1742834650542465025, '0xceed4a4d7710c11e05229c7041d3c35d3f6effe6260b1c5d270a23f2d2fde51d', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36549866, '0x2027056b77dd2fc54316d5f6269db4a225ae96f14e43afb2ec67833da5559a6c', '0xce229dbc19a03cb664534ff69121203e44799863', '0x59d4acb9d136964380954ff52fd3b85eb08eab89', 'BBB', NULL, '160000000000000000000', '18', 1, '1704359130', NULL, 8286040677156480);
INSERT INTO `contract_transaction_event` VALUES (1742835008257875970, '0x9a5fc39fc1bec2912a2e60c918691d2edd88a47c3e3990389406177821dba4d8', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36549895, '0x02c8c1f62dfb9341a76ee3caa5daf7bd89699fb3a19023a70365736931abd672', '0xce229dbc19a03cb664534ff69121203e44799863', '0x59d4acb9d136964380954ff52fd3b85eb08eab89', 'BBB', NULL, '50000000000000000000', '18', 1, '1704359217', NULL, 8286040677156480);
INSERT INTO `contract_transaction_event` VALUES (1742853880822337537, '0xecd000d800c97fd53b36f259a08934684f384793db78bf499d50b79ae3d308be', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36551394, '0x85118a4d3d95bb2b3e80085dfec384e02d95710be26b5bf6a70c5dbe71542fdc', '0xc3794b3f741418612d2ebf35245209995596bfc8', '0xda77018ec185aa0913dacf4cf5522588e242a37c', 'BBB', NULL, '13600000000000000000', '18', 1, '1704363714', NULL, 1);
INSERT INTO `contract_transaction_event` VALUES (1742864279676379138, '0x264002add2deabd06fafc56724f815c92cf84442598a2b1d7127f810bb51535a', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36142215, '0xecdd7bc64a1a899e0bf4cbc7bc1661c0adec797e59ba5e94a54b264162444e6f', '0xce229dbc19a03cb664534ff69121203e44799863', '0xda77018ec185aa0913dacf4cf5522588e242a37c', 'BBB', NULL, '100000000000000000000', '18', 1, '1703136058', NULL, 1);
INSERT INTO `contract_transaction_event` VALUES (1742864281337323521, '0x1f05125bfa9bb29fd85d7920e11f3913aaf26b3ec213eb7b9639f9e53a55b4ff', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36202808, '0xf40315675e98a25f958bb8921e69c3b7a8192c3b25d491d972a2d19469fd1ee5', '0xce229dbc19a03cb664534ff69121203e44799863', '0xda77018ec185aa0913dacf4cf5522588e242a37c', 'BBB', NULL, '1000000000000000000000', '18', 1, '1703317843', NULL, 1);
INSERT INTO `contract_transaction_event` VALUES (1742864283044405250, '0x9820fc3d391656b75b701690f490076b7f20a8a6288628ae918586e3402c09b8', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36202831, '0xd7897807d40ebfe1819765851b328dd601a2d52e2261d43a66600b78853da5c6', '0xce229dbc19a03cb664534ff69121203e44799863', '0xda77018ec185aa0913dacf4cf5522588e242a37c', 'BBB', NULL, '5000000000000000000000', '18', 1, '1703317912', NULL, 1);
INSERT INTO `contract_transaction_event` VALUES (1742864314631708674, '0xa786715587062472ef796ce737eec9167b295b5a241f3791508817ec171c6a0f', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36552129, '0xbf489a1b3594c9af174c8a9981a2cbc374cdb9cb1229088c16b60be38caa7288', '0xce229dbc19a03cb664534ff69121203e44799863', '0x59d4acb9d136964380954ff52fd3b85eb08eab89', 'BBB', NULL, '100000000000000000000000', '18', 1, '1704365919', NULL, 8286040677156480);
INSERT INTO `contract_transaction_event` VALUES (1743102271980539906, '0x4e90b65f3fa3cf69951aa7c9e1ca79258566fb56a669870c2fa811c307f6d533', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36571073, '0x371747e812f60590fcfac18aa67400be9f4adc7cf9e07cbd1fd10e920573a804', '0xce229dbc19a03cb664534ff69121203e44799863', '0x994c7ddac35bf4e79511fdfb4a0a5ceffcdae7eb', 'BBB', NULL, '20000000000000000000000', '18', 1, '1704422751', NULL, 8295884517082368);
INSERT INTO `contract_transaction_event` VALUES (1743505568470126593, '0x59e5c9b07d8bfd2bab6c7e682d558aeff716bd68e074213024adcd30b136cabc', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36601790, '0x19f16da1717af881e8a76e3480874c847cf34d8fab86cb389da3ae49561ada8e', '0xaa5529ff54e0a6591cce6ebf99be81065821b8e6', '0x369012c3926ce2a40a5fd180589a4578b405987c', 'BBB', NULL, '20000000000000000000000', '18', 1, '1704514902', NULL, 8298197992603968);
INSERT INTO `contract_transaction_event` VALUES (1743505593543675906, '0x28ba6e17501246af9bec26913572e1b18330fd0660826a938ebb275c57e3edae', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36602770, '0x4e0a9704294beea96305e021d5b45de45e49b2349652f2ed5e2657cc6c588487', '0xaa5529ff54e0a6591cce6ebf99be81065821b8e6', '0x0eee9363ca0c77e3809be2b403515d7ff541c0b6', 'BBB', NULL, '5000000000000000000000', '18', 1, '1704517842', NULL, 8302080698483008);
INSERT INTO `contract_transaction_event` VALUES (1743536616008564738, '0x670d8bc04e5244af1f5922662637ccfd63f31d6c25138b279bcac9d51af54d82', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36605525, '0x1f7cb477a44a289b8096a5f1179987f88203cb7576f5d2d0b30f0c7f7290f5a9', '0xce229dbc19a03cb664534ff69121203e44799863', '0x4e73ed7cd6febadfbe3457687835c565a5f44760', 'BBB', NULL, '1000000000000000000000', '18', 1, '1704526107', NULL, 8302534483378496);
INSERT INTO `contract_transaction_event` VALUES (1743536824931041282, '0x50d79a3a71f80235062f92a2ad3344fb59fd47cf1b1701af966c65023d641f76', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36605669, '0x0475d5427985e4fea5ac6947a153dcff5de6b3a7464e0e26d03bcdd7a9d73f8b', '0xce229dbc19a03cb664534ff69121203e44799863', '0x4e73ed7cd6febadfbe3457687835c565a5f44760', 'BBB', NULL, '50000000000000000000', '18', 1, '1704526539', NULL, 8302534483378496);
INSERT INTO `contract_transaction_event` VALUES (1745070467452092417, '0xdc3e650d3401489aa1b857cd6a944e63bc602f27f7fae723aa0c92c5e71a9135', '0xde680d903631c88768e80a0e12ec79ebe83a651f', 'BEP20', 36727357, '0x07e550841407803021d0a062f4962f76b0f770d20dca6bbe0b4aeec07c8309a6', '0xaa5529ff54e0a6591cce6ebf99be81065821b8e6', '0xe2ff4b3753b00cee3484c2f404447e27e53c40e3', 'BBB', NULL, '1000000000000000000000', '18', 1, '1704891813', NULL, 8316524510511808);

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recall` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `recall_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, '12121', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2023-12-29/cb311c72-df05-4f91-9f53-e77830dbc984.png', '123123', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2023-12-29/beec32cb-6b7e-4526-8ae6-1a2724f2698d.png', '2024-01-03 18:08:39', 1, 8217866366560064);
INSERT INTO `feedback` VALUES (2, '11111', '', NULL, NULL, '2024-01-03 18:08:39', 1, 8217921427810240);
INSERT INTO `feedback` VALUES (3, '1', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2023-12-30/342e9bec-95a2-4ffb-bdd0-c981017b990b.jpg', NULL, NULL, '2024-01-03 18:08:39', 1, 8217866366560064);
INSERT INTO `feedback` VALUES (4, '2313213', '', '21312312', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-03/70303cac-2bc2-4a29-aeea-29a2c3c41e11.jpg', '2024-01-03 18:08:39', 1, 8217921427810240);
INSERT INTO `feedback` VALUES (5, '2312', '', '231321321', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-02/11e36970-2859-4688-9a84-eaa57d94c9ab.jpg', '2024-01-03 18:08:39', 1, 8217921427810240);
INSERT INTO `feedback` VALUES (6, '121', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-02/8e217666-4491-4efb-a774-09e81ba6f4e7.png', '1111', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-02/21ea45f2-2a32-488d-b665-677c88b27893.jpg', '2024-01-03 18:08:39', 1, 8217921427810240);
INSERT INTO `feedback` VALUES (7, '2131231211111', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-03/99f12744-7c70-4574-91ed-5725baee39a8.jpg', NULL, NULL, '2024-01-03 18:08:39', 0, 8286040614438528);
INSERT INTO `feedback` VALUES (8, '111111', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-03/a80a4c33-417c-4cb2-b226-cc1175665210.jpg', NULL, NULL, '2024-01-03 18:08:39', 0, 8286040614438528);
INSERT INTO `feedback` VALUES (9, '6666666', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-03/de162e91-5d42-4ea1-83ef-3b43c01bf22e.jpg', NULL, NULL, '2024-01-03 18:08:39', 0, 8286040614438528);
INSERT INTO `feedback` VALUES (10, '77777', '', '11111999999', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-03/ca6886db-58ed-4549-a732-e893f6cb1e23.jpg', '2024-01-03 18:08:39', 1, 8286040614438528);
INSERT INTO `feedback` VALUES (11, '12234', '', NULL, NULL, '2024-01-05 23:48:53', -1, 8295884452332800);
INSERT INTO `feedback` VALUES (12, '123', '', '123', NULL, '2024-01-07 01:20:57', 1, 8298197955510592);
INSERT INTO `feedback` VALUES (13, '', '', NULL, NULL, '2024-01-08 23:34:50', 0, 8298197955510592);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notice_title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `notice_body` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `is_deleted` int NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT 0 COMMENT '0 不发布 1 发布',
  `language` int NULL DEFAULT NULL,
  `type` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1704819823330 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1703951945908, '测试消息', '<p>11111</p>', '2023-12-30 23:59:06', '2023-12-30 23:59:06', 0, '', 0, NULL, 0);
INSERT INTO `notice` VALUES (1703951969075, '测试消息2', '<p>111111</p>', '2023-12-30 23:59:29', '2023-12-30 23:59:29', 0, '', 0, NULL, 0);
INSERT INTO `notice` VALUES (1704275312540, '999999', '<p>111111</p><div class=\"media-wrap image-wrap\"><img id=\"xxx\" title=\"xxx\" alt=\"xxx\" loop=\"\" autoplay=\"\" controls=\"\" poster=\"http://xxx/xx.png\" src=\"https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-03/bdd2a036-d3f9-4f4a-a9c8-987c6b5bd153.jpg\"/></div><p></p>', '2024-01-03 17:48:33', '2024-01-03 17:48:33', 0, 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-03/bdd2a036-d3f9-4f4a-a9c8-987c6b5bd153.jpg', 0, NULL, 0);
INSERT INTO `notice` VALUES (1704275408284, '第一篇文章发布', '<p>12312312312</p>', '2024-01-03 17:50:08', '2024-01-03 17:50:08', 0, '', 0, NULL, 0);
INSERT INTO `notice` VALUES (1704275748154, '测试', '<p>11111</p>', '2024-01-03 17:55:48', '2024-01-03 17:55:48', 0, '', 0, NULL, 0);
INSERT INTO `notice` VALUES (1704275852928, '12312312', '<p>421312312312312</p>', '2024-01-03 17:57:33', '2024-01-03 17:57:33', 0, '', 0, NULL, 0);
INSERT INTO `notice` VALUES (1704275869977, '4444', '<p>44444</p>', '2024-01-03 17:57:50', '2024-01-03 17:57:50', 0, '', 0, NULL, 0);
INSERT INTO `notice` VALUES (1704275894423, '第一篇文章发布eqeqw', '<p>qweqweqweqweqw</p>', '2024-01-03 17:58:14', '2024-01-03 17:58:14', 0, '', 0, NULL, 0);
INSERT INTO `notice` VALUES (1704275940339, '第一篇文章发布', '<blockquote>2131231231312312<br/></blockquote><hr/><p>qweqweqweqwe</p>', '2024-01-03 17:59:00', '2024-01-03 17:59:00', 0, '', 0, NULL, 0);
INSERT INTO `notice` VALUES (1704561594583, '12334', '<p>12333</p>', '2024-01-07 01:19:55', '2024-01-07 01:19:55', 0, '', 0, NULL, 0);
INSERT INTO `notice` VALUES (1704819823330, 'ChatBaseX上线通知', '<p style=\"text-align:left;\"><span style=\"letter-spacing:1px\"><span style=\"line-height:1.5\"><span style=\"font-size:18px\">尊敬的用户:</span></span></span></p><p style=\"text-align:left;\"><span style=\"letter-spacing:1px\"><span style=\"line-height:1.5\"><span style=\"font-size:18px\">我们激动地宣布，ChatBaseX正式上线啦！作为一款专业的AI产品技术软件，ChatBaseX汇聚了我们技术团队10多年的经验，致力于为您提供卓越的智能体验。</span></span></span></p><p style=\"text-align:left;\"><span style=\"letter-spacing:1px\"><span style=\"line-height:1.5\"><span style=\"font-size:18px\">ChatBaseX的专业优势体现在其先进的AI技术，包括深度学习、自然语言处理等领域的前沿技术。我们的技术团队拥有丰富的经验，精通领域内专业术语，为ChatBaseX的研发奠定了坚实的基础。</span></span></span></p><p style=\"text-align:left;\"><span style=\"letter-spacing:1px\"><span style=\"line-height:1.5\"><span style=\"font-size:18px\">刚刚上线的ChatBaseX可能在数据准确性方面面临一些挑战，但请您放心，这属于正常情况。我们将会在接下来的一周时间内进行精密的数据校对，确保系统的稳定性和准确性。如果您在使用过程中遇到任何问题，欢迎及时提交反馈，我们将迅速处理并改进。</span></span></span></p><p style=\"text-align:left;\"><span style=\"letter-spacing:1px\"><span style=\"line-height:1.5\"><span style=\"font-size:18px\">我们坚信，通过不断的优化和升级，ChatBaseX将为您提供更智能、高效的服务。我们对这款AI产品的未来充满信心，并期待着在未来将平台延伸至更多智能领域，为您打造更为美好的体验。</span></span></span></p><p style=\"text-align:left;\"><span style=\"letter-spacing:1px\"><span style=\"line-height:1.5\"><span style=\"font-size:18px\">感谢您对ChatBaseX的支持，让我们一同迎接智能未来！</span></span></span></p><p><span style=\"letter-spacing:1px\"><span style=\"line-height:1.5\"><span style=\"font-size:18px\">                                                                                                                                                 诚挚致意</span></span></span></p><p></p><p><span style=\"letter-spacing:1px\"><span style=\"line-height:1.5\"><span style=\"font-size:18px\"> <span style=\"color:#4e5969\"><span style=\"background-color:#ffffff\">                                                                                                                                             ChatBaseX团队</span></span></span></span></span></p><p></p><p> </p><p></p><div class=\"media-wrap image-wrap\"><img id=\"xxx\" title=\"xxx\" alt=\"xxx\" loop=\"\" autoplay=\"\" controls=\"\" poster=\"http://xxx/xx.png\" src=\"https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-10/d472eb7a-3395-47b6-8652-08ba46c2ef78.jpg\"/></div><p></p>', '2024-01-10 01:03:43', '2024-01-10 01:03:43', 0, 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-09/44149193-bff6-43df-8e3b-c9fcea6ec8fd.jpg', 0, NULL, 0);

-- ----------------------------
-- Table structure for sku
-- ----------------------------
DROP TABLE IF EXISTS `sku`;
CREATE TABLE `sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `level` int NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `is_deleted` int NULL DEFAULT 0,
  `rate` decimal(64, 4) NULL DEFAULT NULL,
  `price` decimal(64, 4) NULL DEFAULT NULL,
  `surplus` decimal(64, 4) NULL DEFAULT 0.0000,
  `origin_surplus` decimal(64, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sku
-- ----------------------------
INSERT INTO `sku` VALUES (10, '体验算力模块', 0, 'KYC', '2024-01-04 18:21:55', NULL, 0, 0.0000, 0.0000, 0.0000, 0.0000);
INSERT INTO `sku` VALUES (11, '微力CPU', 1, 'AI_COLLECT', '2023-12-23 14:53:06', NULL, 0, 0.0070, 100.0000, 9999.0000, NULL);
INSERT INTO `sku` VALUES (12, '轻算GPU', 2, 'AI_COLLECT', '2023-12-23 14:53:06', NULL, 0, 0.0080, 500.0000, 9999.0000, NULL);
INSERT INTO `sku` VALUES (13, '中力TPU', 3, 'AI_COLLECT', '2023-12-23 14:53:06', NULL, 0, 0.0090, 1000.0000, 9999.0000, NULL);
INSERT INTO `sku` VALUES (14, '50', 0, 'AI_POOL', '2023-12-23 14:56:10', NULL, 0, 0.0100, NULL, 314.0250, 20000.0000);
INSERT INTO `sku` VALUES (15, '强算FPGA', 4, 'AI_COLLECT', '2023-12-24 13:43:29', NULL, 0, 0.0100, 120000.0000, 9.0000, NULL);
INSERT INTO `sku` VALUES (16, '威力ASIC', 5, 'AI_COLLECT', '2023-12-24 13:43:29', NULL, 0, 0.0110, 200000.0000, 3.0000, NULL);
INSERT INTO `sku` VALUES (17, '超算NPU', 6, 'AI_COLLECT', '2023-12-24 13:43:29', NULL, 0, 0.0120, 2000000.0000, 7.0000, NULL);
INSERT INTO `sku` VALUES (18, '30', 0, 'AI_POOL', '2023-12-24 13:43:29', NULL, 0, 0.0070, NULL, 18188.4150, 30000.0000);
INSERT INTO `sku` VALUES (19, '20', 0, 'AI_POOL', '2023-12-24 13:43:29', NULL, 0, 0.0050, NULL, 42125.6100, 50000.0000);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `config_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `descs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (15, '1', 'POOL_AMOUNT_BLOCK', '2023-12-26 16:13:33', 'pool排队启用', 'poolAmountBlock');
INSERT INTO `sys_config` VALUES (16, '100000', 'POOL_AMOUNT', '2023-12-26 16:13:33', '算力池总额度', 'poolAmount');
INSERT INTO `sys_config` VALUES (17, '2023-12-07 00:00|2024-01-31 00:00', 'POOL_ACTIVE_TIME', '2023-12-26 16:13:34', '活动起止时间', 'poolActiveTime');
INSERT INTO `sys_config` VALUES (18, '0.2', 'SUPPER_POOL_AMOUNT', '2023-12-26 16:13:34', '超算力池额度', 'supperPoolAmount');
INSERT INTO `sys_config` VALUES (19, '0.01', 'SUPPER_POOL_AMOUNT_RATE', '2023-12-26 16:13:34', '超算力池收益率', 'supperPoolAmountRate');
INSERT INTO `sys_config` VALUES (20, '0.3', 'MID_POOL_AMOUNT', '2023-12-26 16:13:35', '中算力池额度', 'midPoolAmount');
INSERT INTO `sys_config` VALUES (21, '0.007', 'MID_POOL_AMOUNT_RATE', '2023-12-26 16:13:35', '中算力池收益率', 'midPoolAmountRate');
INSERT INTO `sys_config` VALUES (22, '0.5', 'LOW_POOL_AMOUNT', '2023-12-26 16:13:35', '低算力池额度', 'lowPoolAmount');
INSERT INTO `sys_config` VALUES (23, '0.005', 'LOW_POOL_AMOUNT_RATE', '2023-12-26 16:13:36', '低算力池收益率', 'lowPoolAmountRate');
INSERT INTO `sys_config` VALUES (24, '1', 'DRAP_USDT_RATE', '2023-12-26 16:13:36', '踢出结算USDT比列', 'drapUsdtRate');
INSERT INTO `sys_config` VALUES (25, '0.01', 'REDEMPTION_FEE', '2023-12-26 16:13:36', '赎回手续费', 'redemptionFee');
INSERT INTO `sys_config` VALUES (26, '1', 'REDEMPTION_INCOME_AIX', '2023-12-26 16:13:37', '赎回赠送AIX', 'redemptionIncomeAix');
INSERT INTO `sys_config` VALUES (27, '1', 'EVENT_FLAG', '2023-12-26 16:29:39', '活动启用', 'eventFlag');
INSERT INTO `sys_config` VALUES (28, '2023-12-07 00:00|2024-01-25 00:00', 'EVENT_TIME', '2023-12-26 16:29:39', '活动起止时间', 'eventTime');
INSERT INTO `sys_config` VALUES (29, '100', 'MODEL_L1_AMOUNT', '2023-12-26 16:44:59', '一级模块额度', 'modelL1Amount');
INSERT INTO `sys_config` VALUES (30, '0.007', 'MODEL_L1_RATE', '2023-12-26 16:45:00', '一级模块奖励比列', 'modelL1Rate');
INSERT INTO `sys_config` VALUES (31, '500', 'MODEL_L2_AMOUNT', '2023-12-26 16:45:00', '二级模块额度', 'modelL2Amount');
INSERT INTO `sys_config` VALUES (32, '0.008', 'MODEL_L2_RATE', '2023-12-26 16:45:01', '二级模块奖励比列', 'modelL2Rate');
INSERT INTO `sys_config` VALUES (33, '1000', 'MODEL_L3_AMOUNT', '2023-12-26 16:45:01', '三级模块额度', 'modelL3Amount');
INSERT INTO `sys_config` VALUES (34, '0.009', 'MODEL_L3_RATE', '2023-12-26 16:45:01', '三级模块奖励比列', 'modelL3Rate');
INSERT INTO `sys_config` VALUES (35, '120000', 'MODEL_L4_AMOUNT', '2023-12-26 16:45:02', '四级模块额度', 'modelL4Amount');
INSERT INTO `sys_config` VALUES (36, '0.01', 'MODEL_L4_RATE', '2023-12-26 16:45:02', '四级模块奖励比列', 'modelL4Rate');
INSERT INTO `sys_config` VALUES (37, '200000', 'MODEL_L5_AMOUNT', '2023-12-26 16:45:02', '五级模块额度', 'modelL5Amount');
INSERT INTO `sys_config` VALUES (38, '0.011', 'MODEL_L5_RATE', '2023-12-26 16:45:03', '五级模块奖励比列', 'modelL5Rate');
INSERT INTO `sys_config` VALUES (39, '2000000', 'MODEL_L6_AMOUNT', '2023-12-26 16:45:03', '六级模块额度', 'modelL6Amount');
INSERT INTO `sys_config` VALUES (40, '0.012', 'MODEL_L6_RATE', '2023-12-26 16:45:03', '六级模块奖励比列', 'modelL6Rate');
INSERT INTO `sys_config` VALUES (41, '3', 'MODEL_L5_DAILY_IN', '2023-12-26 16:45:04', '五级模块限额', 'modelL5DailyIn');
INSERT INTO `sys_config` VALUES (42, '7', 'MODEL_L6_DAILY_IN', '2023-12-26 16:45:04', '六级模块限额', 'modelL6DailyIn');
INSERT INTO `sys_config` VALUES (43, '1', 'KYC_REWARD_FLAG', '2023-12-26 17:12:49', '实名奖励开关', 'kycRewardFlag');
INSERT INTO `sys_config` VALUES (44, '50', 'KYC_REWARD_AMOUNT', '2023-12-26 17:12:49', '实名奖励模块', 'kycRewardAmount');
INSERT INTO `sys_config` VALUES (45, '0.005', 'KYC_REWARD_RATE', '2023-12-26 17:12:50', '实名奖励比例', 'kycRewardRate');
INSERT INTO `sys_config` VALUES (46, '60', 'KYC_REWARD_PER', '2023-12-26 17:12:50', '实名奖励持续时间', 'kycRewardPer');
INSERT INTO `sys_config` VALUES (47, '1', 'CBU2USDT', '2023-12-29 14:58:27', 'CBU闪兑比列', 'cbu2usdt');
INSERT INTO `sys_config` VALUES (48, '0.02', 'CBU2USDT_FEE', '2023-12-29 14:58:27', 'CBU闪兑手续费', 'cbu2usdtFee');
INSERT INTO `sys_config` VALUES (49, '20', 'USDT_WITHDRAW_LOW', '2023-12-29 14:58:27', '最低提现额度', 'usdtWithdrawLow');
INSERT INTO `sys_config` VALUES (50, '10000', 'USDT_WITHDRAW_MAX', '2023-12-29 14:58:27', '最高提现额度', 'usdtWithdrawMax');
INSERT INTO `sys_config` VALUES (54, '10', 'AIX2COIN', '2023-12-29 16:23:33', 'AIX兑换积分比列', 'aix2coin');
INSERT INTO `sys_config` VALUES (55, '0.01', 'WITHDRAW_FEE', '2023-12-29 16:23:33', '提现手续费', 'withdrawFee');
INSERT INTO `sys_config` VALUES (56, '1', 'POOL_ACTIVE', '2024-01-05 15:42:42', 'pool活动开关', 'poolActive');

-- ----------------------------
-- Table structure for team_tree
-- ----------------------------
DROP TABLE IF EXISTS `team_tree`;
CREATE TABLE `team_tree`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `parent_id` bigint NULL DEFAULT 0,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of team_tree
-- ----------------------------
INSERT INTO `team_tree` VALUES (3, '2023-12-29 15:19:52', 0, 8217866366560064);
INSERT INTO `team_tree` VALUES (4, '2023-12-29 15:19:52', 8217866366560064, 8217921427810240);
INSERT INTO `team_tree` VALUES (5, '2023-12-29 15:19:52', 8217866366560064, 8235340173484032);
INSERT INTO `team_tree` VALUES (6, '2024-01-05 11:11:53', 8286040614438528, 8295884452332800);
INSERT INTO `team_tree` VALUES (7, '2024-01-06 15:41:08', 0, 8286040614438528);
INSERT INTO `team_tree` VALUES (11, '2024-01-06 16:20:40', 8302803512525120, 8302883729768768);
INSERT INTO `team_tree` VALUES (12, '2024-01-06 16:30:06', 8302803512525120, 8302920857747776);
INSERT INTO `team_tree` VALUES (13, '2024-01-06 16:34:17', 0, 8302803512525120);
INSERT INTO `team_tree` VALUES (14, '2024-01-06 16:34:17', 8302803512525120, 8302937163571456);
INSERT INTO `team_tree` VALUES (15, '2024-01-06 16:36:24', 8302803512525120, 8302945529438464);
INSERT INTO `team_tree` VALUES (16, '2024-01-07 16:31:49', 8302803512525120, 8308589886702528);
INSERT INTO `team_tree` VALUES (17, '2024-01-08 13:45:26', 8217921427810240, 8313597986472896);
INSERT INTO `team_tree` VALUES (18, '2024-01-08 22:59:53', 8286040614438528, 8315778129200896);
INSERT INTO `team_tree` VALUES (19, '2024-01-08 23:26:57', 8315778129200896, 8315884527682240);
INSERT INTO `team_tree` VALUES (20, '2024-01-08 23:29:10', 8315778129200896, 8315893343126208);
INSERT INTO `team_tree` VALUES (21, '2024-01-08 23:34:34', 8315778129200896, 8315914552935104);
INSERT INTO `team_tree` VALUES (22, '2024-01-08 23:36:57', 8315778129200896, 8315923946668736);
INSERT INTO `team_tree` VALUES (23, '2024-01-08 23:38:26', 8315778129200896, 8315929736184512);
INSERT INTO `team_tree` VALUES (24, '2024-01-08 23:40:29', 8315884527682240, 8315937831912128);
INSERT INTO `team_tree` VALUES (25, '2024-01-08 23:42:51', 8315893343126208, 8315947148116672);
INSERT INTO `team_tree` VALUES (26, '2024-01-08 23:44:25', 8315937831912128, 8315953302733504);
INSERT INTO `team_tree` VALUES (27, '2024-01-08 23:45:41', 8315947148116672, 8315958229271232);
INSERT INTO `team_tree` VALUES (28, '2024-01-08 23:47:02', 8315937831912128, 8315963590050496);
INSERT INTO `team_tree` VALUES (29, '2024-01-08 23:48:28', 8315947148116672, 8315969186693824);
INSERT INTO `team_tree` VALUES (30, '2024-01-08 23:49:48', 8315884527682240, 8315974446088896);
INSERT INTO `team_tree` VALUES (31, '2024-01-08 23:51:13', 8315893343126208, 8315979987944128);
INSERT INTO `team_tree` VALUES (32, '2024-01-08 23:52:38', 8315953302733504, 8315985613816512);
INSERT INTO `team_tree` VALUES (33, '2024-01-08 23:54:06', 8315963590050496, 8315991385244352);
INSERT INTO `team_tree` VALUES (34, '2024-01-08 23:55:22', 8315958229271232, 8315996332360384);
INSERT INTO `team_tree` VALUES (35, '2024-01-08 23:56:42', 8315969186693824, 8316001585857216);
INSERT INTO `team_tree` VALUES (36, '2024-01-09 01:09:16', 8315893343126208, 8316286927962816);
INSERT INTO `team_tree` VALUES (37, '2024-01-09 01:13:13', 8315937831912128, 8316302486536896);
INSERT INTO `team_tree` VALUES (38, '2024-01-09 01:18:27', 8315947148116672, 8316323037577920);
INSERT INTO `team_tree` VALUES (39, '2024-01-09 02:09:41', 0, 8298197955510592);
INSERT INTO `team_tree` VALUES (40, '2024-01-09 02:09:41', 8298197955510592, 8316524508283584);
INSERT INTO `team_tree` VALUES (41, '2024-01-09 02:14:31', 8316524508283584, 8316543520801472);
INSERT INTO `team_tree` VALUES (42, '2024-01-09 02:20:23', 8316524508283584, 8316566578987712);
INSERT INTO `team_tree` VALUES (43, '2024-01-09 02:26:00', 8316524508283584, 8316588668945088);
INSERT INTO `team_tree` VALUES (44, '2024-01-09 02:29:47', 8316524508283584, 8316603497841344);
INSERT INTO `team_tree` VALUES (45, '2024-01-09 02:32:51', 8316524508283584, 8316615588446912);
INSERT INTO `team_tree` VALUES (46, '2024-01-09 02:37:24', 8316524508283584, 8316633455329984);
INSERT INTO `team_tree` VALUES (47, '2024-01-09 02:45:19', 8316543520801472, 8316664617173696);
INSERT INTO `team_tree` VALUES (48, '2024-01-09 02:55:22', 8298197955510592, 8316704158515904);
INSERT INTO `team_tree` VALUES (49, '2024-01-09 03:00:07', 8316704158515904, 8316722783912640);
INSERT INTO `team_tree` VALUES (50, '2024-01-09 03:11:46', 8298197955510592, 8316768585188032);
INSERT INTO `team_tree` VALUES (51, '2024-01-09 03:18:09', 8316768585188032, 8316793716015808);
INSERT INTO `team_tree` VALUES (52, '2024-01-09 03:22:30', 8316768585188032, 8316810811671232);
INSERT INTO `team_tree` VALUES (53, '2024-01-09 03:25:30', 8316793716015808, 8316822604677824);
INSERT INTO `team_tree` VALUES (54, '2024-01-09 03:29:19', 8316822604677824, 8316837647418048);
INSERT INTO `team_tree` VALUES (55, '2024-01-09 03:34:01', 8316822604677824, 8316856099930816);
INSERT INTO `team_tree` VALUES (56, '2024-01-09 13:27:52', 0, 8319191122388928);
INSERT INTO `team_tree` VALUES (57, '2024-01-11 01:47:49', 8316543520801472, 8327762295990016);
INSERT INTO `team_tree` VALUES (101, '2024-01-12 17:56:31', 0, 8337234471747968);
INSERT INTO `team_tree` VALUES (102, '2024-01-12 18:11:44', 0, 8337294312997440);
INSERT INTO `team_tree` VALUES (103, '2024-01-12 18:52:11', 8315953302733504, 8337453443056192);
INSERT INTO `team_tree` VALUES (104, '2024-01-12 19:02:04', 8315985613816512, 8337492298957376);
INSERT INTO `team_tree` VALUES (105, '2024-01-12 19:06:56', 8315985613816512, 8337511400342080);
INSERT INTO `team_tree` VALUES (106, '2024-01-12 19:11:01', 8315985613816512, 8337527473504832);
INSERT INTO `team_tree` VALUES (107, '2024-01-12 19:20:47', 8315985613816512, 8337565902045760);
INSERT INTO `team_tree` VALUES (108, '2024-01-12 19:26:30', 8337565902045760, 8337588323025472);
INSERT INTO `team_tree` VALUES (109, '2024-01-12 19:47:54', 8337565902045760, 8337672509522496);
INSERT INTO `team_tree` VALUES (110, '2024-01-12 20:55:03', 8316810811671232, 8337936537223744);
INSERT INTO `team_tree` VALUES (111, '2024-01-12 20:56:44', 8316810811671232, 8337943167631936);
INSERT INTO `team_tree` VALUES (112, '2024-01-12 21:02:41', 8316837647418048, 8337966576828992);
INSERT INTO `team_tree` VALUES (113, '2024-01-12 21:05:09', 8337966576828992, 8337976273404480);
INSERT INTO `team_tree` VALUES (114, '2024-01-12 21:07:13', 8337966576828992, 8337984330596800);
INSERT INTO `team_tree` VALUES (115, '2024-01-13 17:07:49', 8298197955510592, 8342705322001088);
INSERT INTO `team_tree` VALUES (116, '2024-01-13 17:12:21', 8342705322001088, 8342723133244096);
INSERT INTO `team_tree` VALUES (117, '2024-01-13 17:14:02', 8342705322001088, 8342729767715520);
INSERT INTO `team_tree` VALUES (118, '2024-01-13 17:15:48', 8342705322001088, 8342736702014144);
INSERT INTO `team_tree` VALUES (119, '2024-01-13 17:17:27', 8342705322001088, 8342743198663360);
INSERT INTO `team_tree` VALUES (120, '2024-01-13 17:20:24', 8342743198663360, 8342754820358848);
INSERT INTO `team_tree` VALUES (121, '2024-01-13 17:22:05', 8342743198663360, 8342761418261184);
INSERT INTO `team_tree` VALUES (122, '2024-01-13 17:26:21', 8342761418261184, 8342778194035392);
INSERT INTO `team_tree` VALUES (123, '2024-01-13 17:31:00', 8342761418261184, 8342796507022016);
INSERT INTO `team_tree` VALUES (124, '2024-01-13 17:34:00', 8342796507022016, 8342808315560640);
INSERT INTO `team_tree` VALUES (125, '2024-01-13 17:37:10', 8342796507022016, 8342820766810816);
INSERT INTO `team_tree` VALUES (126, '2024-01-13 17:41:06', 8342820766810816, 8342836240777920);
INSERT INTO `team_tree` VALUES (127, '2024-01-13 17:43:45', 8342820766810816, 8342846662640320);
INSERT INTO `team_tree` VALUES (128, '2024-01-13 17:45:49', 8342820766810816, 8342854744146624);
INSERT INTO `team_tree` VALUES (129, '2024-01-13 17:48:23', 8342820766810816, 8342864827908800);
INSERT INTO `team_tree` VALUES (130, '2024-01-13 17:50:53', 8342864827908800, 8342874669187776);
INSERT INTO `team_tree` VALUES (131, '2024-01-13 17:53:23', 8342864827908800, 8342884512301760);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL COMMENT '用户id',
  `mobile_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `area_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机地区编号',
  `email` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
  `payment_password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '123456' COMMENT '支付密码',
  `nick_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `language` tinyint NULL DEFAULT NULL COMMENT '语言',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别',
  `head_pic` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '头像',
  `introduce` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '自我介绍',
  `level` tinyint NULL DEFAULT 0 COMMENT '用户等级 1:普通用户，2:会员用户',
  `expire_time` timestamp NULL DEFAULT NULL COMMENT 'VIP过期时间',
  `regions` bigint NULL DEFAULT NULL COMMENT '地区',
  `country_list` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '国家列表',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `ext_info` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '扩展信息',
  `ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `background` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `usdt` decimal(64, 2) NULL DEFAULT 0.00 COMMENT '可操作',
  `withdraw_cbu` decimal(64, 2) NULL DEFAULT 0.00 COMMENT '可操作',
  `aix` decimal(64, 2) NULL DEFAULT 0.00,
  `frezz_cbu` decimal(64, 2) NULL DEFAULT 0.00 COMMENT '冻结',
  `onetap_resub` int NULL DEFAULT 0,
  `total_cbu` decimal(64, 2) NULL DEFAULT 0.00 COMMENT 'cbu总收益',
  `active` int NULL DEFAULT 0,
  `referral_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `market` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `aix_reward` decimal(64, 2) NULL DEFAULT 0.00,
  `total_collect_usdt` decimal(64, 2) NULL DEFAULT 0.00 COMMENT '总共投入的usdt去collect',
  `nowday_collect_usdt` decimal(64, 2) NULL DEFAULT 0.00 COMMENT 'total_collect_usdt不为空，新进来的T+1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (8217866366560064, '15008392092', NULL, '', 'edd1bedb8cffdaad711840a19b87e6a0', '121212', 'Zz', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 08:13:45', '2024-01-08 08:13:45', '2023-12-22 15:59:37', NULL, NULL, NULL, 99000.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'zkll', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8217921427810240, '', NULL, '401832271@qq.com', 'edd1bedb8cffdaad711840a19b87e6a0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:48', '2024-01-08 07:00:48', '2023-12-22 16:13:38', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, '1', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8235340173484032, '13778518125', NULL, '', '44e6e89e3759316f318f5b52e1cb8019', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:49', '2024-01-08 07:00:49', '2023-12-25 18:03:27', NULL, NULL, NULL, 9000.00, 0.00, 0.00, 0.00, 0, 0.00, 1, '2', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8286040614438528, '', NULL, '792141549@qq.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2024-01-08 07:52:30', '2024-01-08 07:52:30', '2024-01-03 16:57:14', NULL, NULL, NULL, 1006884.80, 2686.37, 0.00, 0.00, 0, 0.00, 1, '3', 'A0', 0.00, 100.00, 0.00);
INSERT INTO `user` VALUES (8295884452332800, '', '', '2264455254@qq.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '2264455254@qq.com', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:50', '2024-01-08 07:00:50', '2024-01-05 10:40:39', NULL, NULL, NULL, 99300.00, 0.00, 0.00, 0.00, 0, 0.00, 1, '5G43ZD', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8298197955510592, '', '', 'mlv686868@gmail.com', '7c59bb7bbbdd454ca4c61f522647688d', '123456', '小试牛刀', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:50', '2024-01-08 07:00:50', '2024-01-05 20:29:00', NULL, NULL, NULL, 14450.92, 0.00, 0.00, 0.00, 0, 0.00, 1, 'EKOEPH', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8298669362839872, '', '', 'mlv676767@gmail.com', 'f7ef7b70625456f214baf7cef684d10d', '123456', '测试2', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:51', '2024-01-08 07:00:51', '2024-01-05 22:28:53', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, '7D295I', '', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8302080695927104, '', '', 'maipeng6868@gmail.com', 'a4c82088079a693f24fc76fda1c98e6b', '123456', '1号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:51', '2024-01-08 07:00:51', '2024-01-06 12:56:26', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'YUCZ13', '', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8302534480888128, '', '', 'c693486598f815@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:51', '2024-01-08 07:00:51', '2024-01-06 14:51:50', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'ZX3ZX4', '', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8302784868254016, '', '', '890b3565990741@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试1', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:52', '2024-01-08 07:00:52', '2024-01-06 15:55:31', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, '01OM5E', '', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8302803512525120, '', '', '973f4e6599086d@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'qweq ', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:52', '2024-01-08 07:00:52', '2024-01-06 16:00:15', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 'UMJV36', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8302883729768768, '', '', '3ef81065990cca@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '123456', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:53', '2024-01-08 07:00:53', '2024-01-06 16:20:39', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, '8YE1F9', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8302920857747776, '', '', 'b6baf965990f43@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '77777', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:53', '2024-01-08 07:00:53', '2024-01-06 16:30:06', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, '7K4G2Y', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8302937163571456, '', '', '5b24766599103f@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '888888888', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:53', '2024-01-08 07:00:53', '2024-01-06 16:34:15', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, '6XT457', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8302945529438464, '', '', 'e80839659910e1@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '908080890', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:54', '2024-01-08 07:00:54', '2024-01-06 16:36:22', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 'EDBANK', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8304284876342208, '', '', 'e1e1fd65996097@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '测试2', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:54', '2024-01-08 07:00:54', '2024-01-06 22:16:59', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, '7ZSKSN', '', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8304314243482560, '', '', '1402cd65996241@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我时候测试', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:55', '2024-01-08 07:00:55', '2024-01-06 22:24:27', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 'L9JV3X', '', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8308589886702528, '', '', 'qjt31602@zslsz.com', 'edd1bedb8cffdaad711840a19b87e6a0', '123456', '123', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:00:55', '2024-01-08 07:00:55', '2024-01-07 16:31:48', NULL, NULL, NULL, 1000.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 'X5LPUP', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8313597986472896, '', '', '1064372906@qq.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '1064372906@qq.com', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 07:21:21', '2024-01-08 07:21:21', '2024-01-08 13:45:26', NULL, NULL, NULL, 99900.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'C3SMAX', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8315778129200896, '', '', '51cdb1659c0dca@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试1', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2024-01-08 15:59:29', '2024-01-08 15:59:29', '2024-01-08 22:59:52', NULL, NULL, NULL, 1149700.00, 203632.04, 0.00, 1000.00, 0, 0.00, 1, 'D2G8JY', 'A5', 1.32, 100.00, 0.00);
INSERT INTO `user` VALUES (8315884527682240, '', '', 'f29ab6659c12cb@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试2号', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, '2024-01-08 17:35:40', '2024-01-08 17:35:40', '2024-01-08 23:26:56', NULL, NULL, NULL, 9833000.00, 50730.53, 0.00, 0.00, 0, 0.00, 1, 'LI6ULN', 'A4', 0.00, 1000.00, 0.00);
INSERT INTO `user` VALUES (8315893343126208, '', '', '7a4b03659c148a@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试3号', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-08 17:35:27', '2024-01-08 17:35:27', '2024-01-08 23:29:10', NULL, NULL, NULL, 9647400.00, 4730.46, 0.00, 0.00, 0, 0.00, 1, '6TD3UY', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8315914552935104, '', '', '4c28f3659c1575@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试4号', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-08 17:35:03', '2024-01-08 17:35:03', '2024-01-08 23:34:34', NULL, NULL, NULL, 109835000.00, 4400.00, 0.00, 0.00, 0, 0.00, 1, 'P4RDKW', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8315923946668736, '', '', 'a7d6bd659c1638@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试5号', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-08 17:34:49', '2024-01-08 17:34:49', '2024-01-08 23:36:57', NULL, NULL, NULL, 835000.00, 4400.00, 0.00, 0.00, 0, 0.00, 1, 'HG6UY9', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8315929736184512, '', '', '337bbe659c16ce@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试6号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 17:34:36', '2024-01-08 17:34:36', '2024-01-08 23:38:26', NULL, NULL, NULL, 1005000.00, 120.00, 0.00, 0.00, 0, 0.00, 1, '321HB1', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8315937831912128, '', '', '3ee537659c1739@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试7号', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, '2024-01-08 16:13:09', '2024-01-08 16:13:09', '2024-01-08 23:40:29', NULL, NULL, NULL, 794000.00, 58262.41, 0.00, 0.00, 0, 0.00, 1, '96OR9Y', 'A3', 0.00, 1000.00, 0.00);
INSERT INTO `user` VALUES (8315947148116672, '', '', '10753f659c17b8@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试8号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 16:12:56', '2024-01-08 16:12:56', '2024-01-08 23:42:51', NULL, NULL, NULL, 995000.00, 330.64, 0.00, 0.00, 0, 0.00, 1, '5ZLAOT', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8315953302733504, '', '', '0fd551659c1833@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试9号', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, '2024-01-08 16:12:37', '2024-01-08 16:12:37', '2024-01-08 23:44:25', NULL, NULL, NULL, 799500.00, 63096.94, 0.00, 0.00, 0, 0.00, 1, 'CHM3J1', 'A4', 0.00, 500.00, 0.00);
INSERT INTO `user` VALUES (8315958229271232, '', '', 'fa432e659c187d@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试10号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 16:12:27', '2024-01-08 16:12:27', '2024-01-08 23:45:40', NULL, NULL, NULL, 990000.00, 144.00, 0.00, 120.00, 1, 0.00, 1, 'XRWNNO', 'A0', 0.16, 0.00, 0.00);
INSERT INTO `user` VALUES (8315963590050496, '', '', 'd63f7f659c18cb@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试11号', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, '2024-01-08 16:12:18', '2024-01-08 16:12:18', '2024-01-08 23:47:02', NULL, NULL, NULL, 1080000.00, 5040.00, 0.00, 0.00, 0, 0.00, 1, 'PN8UJL', 'A0', 0.00, 120000.00, 0.00);
INSERT INTO `user` VALUES (8315969186693824, '', '', 'b7265b659c191d@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试12号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 16:12:06', '2024-01-08 16:12:06', '2024-01-08 23:48:28', NULL, NULL, NULL, 95000.00, 121.00, 0.00, 0.00, 0, 0.00, 1, 'CBBWB3', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8315974446088896, '', '', '8585aa659c1974@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试13号', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-08 16:11:54', '2024-01-08 16:11:54', '2024-01-08 23:49:48', NULL, NULL, NULL, 795000.00, 4400.00, 0.00, 0.00, 0, 0.00, 1, 'VK1O43', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8315979987944128, '', '', 'ecf82d659c19bf@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试14号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 16:11:43', '2024-01-08 16:11:43', '2024-01-08 23:51:12', NULL, NULL, NULL, 995000.00, 110.00, 0.00, 0.00, 0, 0.00, 1, 'Z4AY58', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8315985613816512, '', '', '98eacc659c1a1e@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试15号', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, '2024-01-08 16:11:32', '2024-01-08 16:11:32', '2024-01-08 23:52:38', NULL, NULL, NULL, 99000.00, 211941.81, 0.00, 0.00, 0, 0.00, 1, 'PVFFHU', 'A5', 0.00, 1000.00, 0.00);
INSERT INTO `user` VALUES (8315991385244352, '', '', '0381a1659c1a6e@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试16号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 16:11:01', '2024-01-08 16:11:01', '2024-01-08 23:54:06', NULL, NULL, NULL, 1200000.00, 2400.00, 0.00, 0.00, 0, 0.00, 1, 'BXMNRR', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8315996332360384, '', '', '913302659c1ac0@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试17号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 16:10:49', '2024-01-08 16:10:49', '2024-01-08 23:55:22', NULL, NULL, NULL, 90000.00, 240.00, 0.00, 0.00, 0, 0.00, 1, 'JIV2EG', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316001585857216, '', '', '69535e659c1b0c@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试18号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 16:10:27', '2024-01-08 16:10:27', '2024-01-08 23:56:42', NULL, NULL, NULL, 95000.00, 110.00, 0.00, 0.00, 0, 0.00, 1, 'O5QMFT', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316286927962816, '', '', 'bde63b659c2b6f@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试19号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 17:34:23', '2024-01-08 17:34:23', '2024-01-09 01:09:16', NULL, NULL, NULL, 10995000.00, 110.00, 0.00, 0.00, 0, 0.00, 1, 'V787NW', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316302486536896, '', '', '0247ef659c2ce4@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试20号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 17:34:12', '2024-01-08 17:34:12', '2024-01-09 01:13:13', NULL, NULL, NULL, 10800000.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'ICQTA8', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316323037577920, '', '', 'bc6ed0659c2e35@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '我是测试21号', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 17:34:01', '2024-01-08 17:34:01', '2024-01-09 01:18:27', NULL, NULL, NULL, 9990000.00, 240.00, 0.00, 0.00, 0, 0.00, 1, 'AHZWR6', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316524508283584, '', '', 'c62a2e659c381b@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'A', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 18:10:29', '2024-01-08 18:10:29', '2024-01-09 02:09:41', NULL, NULL, NULL, 15598.00, 976.67, 0.00, 0.00, 0, 0.00, 1, 'TSQ5G9', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316543520801472, '', '', '3005d9659c3b0f@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'A1', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 18:15:40', '2024-01-08 18:15:40', '2024-01-09 02:14:31', NULL, NULL, NULL, 10000.00, 217.40, 0.00, 0.00, 0, 0.00, 1, 'BWJ7KV', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316566578987712, '', '', '315e7a659c3c6e@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'A2', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 18:21:00', '2024-01-08 18:21:00', '2024-01-09 02:20:23', NULL, NULL, NULL, 10000.00, 119.00, 0.00, 0.00, 0, 0.00, 1, 'I19NTK', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316588668945088, '', '', 'ee587e659c3de7@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'A3', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 18:26:46', '2024-01-08 18:26:46', '2024-01-09 02:26:00', NULL, NULL, NULL, 10000.00, 119.00, 0.00, 0.00, 0, 0.00, 1, '0QQMW5', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316603497841344, '', '', 'c7247d659c3ecc@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'A4', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 18:30:33', '2024-01-08 18:30:33', '2024-01-09 02:29:46', NULL, NULL, NULL, 10000.00, 119.00, 0.00, 0.00, 0, 0.00, 1, '51ZL07', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316615588446912, '', '', 'dedad8659c3f79@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'A5', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 18:33:35', '2024-01-08 18:33:35', '2024-01-09 02:32:51', NULL, NULL, NULL, 10000.00, 119.00, 0.00, 0.00, 0, 0.00, 1, '8AYU4X', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316633455329984, '', '', 'a02745659c406d@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'A6', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 18:38:02', '2024-01-08 18:38:02', '2024-01-09 02:37:24', NULL, NULL, NULL, 5400.00, 119.00, 0.00, 0.00, 0, 0.00, 1, 'FSIH7I', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316664617173696, '', '', '6c7413659c4221@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'A7', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 18:46:55', '2024-01-08 18:46:55', '2024-01-09 02:45:19', NULL, NULL, NULL, 70800.00, 119.00, 0.00, 0.00, 0, 0.00, 1, 'X3SGXK', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316704158515904, '', '', 'a23d82659c4466@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'B', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 19:34:55', '2024-01-08 19:34:55', '2024-01-09 02:55:22', NULL, NULL, NULL, 1000000.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 'WEDGMO', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316722783912640, '', '', '516f51659c45f3@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'B1', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 19:13:32', '2024-01-08 19:13:32', '2024-01-09 03:00:07', NULL, NULL, NULL, 41000.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'WL5RIK', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8316768585188032, '', '', '79349c659c478e@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'C', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2024-01-08 19:14:02', '2024-01-08 19:14:02', '2024-01-09 03:11:46', NULL, NULL, NULL, 1021998.00, 3.22, 0.00, 0.00, 1, 0.00, 1, 'SK2JGL', 'A0', 0.00, 100.00, 0.00);
INSERT INTO `user` VALUES (8316793716015808, '', '', '3f1b7f659c4a0f@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'C1', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2024-01-08 19:19:01', '2024-01-08 19:19:01', '2024-01-09 03:18:09', NULL, NULL, NULL, 2700.00, 1.61, 0.00, 0.00, 0, 0.00, 1, 'GO2HAM', 'A0', 0.00, 100.00, 0.00);
INSERT INTO `user` VALUES (8316810811671232, '', '', '91ecfa659c4b23@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'C2', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2024-01-08 19:23:16', '2024-01-08 19:23:16', '2024-01-09 03:22:30', NULL, NULL, NULL, 9900.00, 0.00, 0.00, 0.00, 0, 0.00, 1, '5AE0N2', 'A0', 0.00, 100.00, 0.00);
INSERT INTO `user` VALUES (8316822604677824, '', '', '1a44c9659c4bdd@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'C3A1', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2024-01-08 19:26:24', '2024-01-08 19:26:24', '2024-01-09 03:25:30', NULL, NULL, NULL, 200.00, 9.20, 0.00, 0.00, 0, 0.00, 1, 'Z6HFGH', 'A0', 0.00, 100.00, 0.00);
INSERT INTO `user` VALUES (8316837647418048, '', '', '5a2ca4659c4cad@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'C4', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, '2024-01-08 19:30:22', '2024-01-08 19:30:22', '2024-01-09 03:29:19', NULL, NULL, NULL, 0.00, 9.20, 0.00, 0.00, 0, 0.00, 1, '9AE9G2', 'A0', 0.00, 500.00, 0.00);
INSERT INTO `user` VALUES (8316856099930816, '', '', '430335659c4dd8@crankymonkey.info', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'C5', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 19:34:55', '2024-01-08 19:34:55', '2024-01-09 03:34:01', NULL, NULL, NULL, 1988280.00, 0.00, 0.00, 0.00, 0, 0.00, 1, '1KAWO6', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8319191122388928, '', '', 'jey80553@yuoia.com', '4ca117ccb17d5c891f45f31dc9491951', '123456', 'jey80553@yuoia.com', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 19:34:55', '2024-01-08 19:34:55', '2024-01-09 13:27:51', NULL, NULL, NULL, 90000.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'C78GM5', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8327762295990016, '', '', 'innkjkbcxc@iubridge.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'innkjkbcxc@iubridge.com', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 19:34:55', '2024-01-08 19:34:55', '2024-01-11 01:47:36', NULL, NULL, NULL, 90000.00, 165.00, 0.00, 0.00, 0, 0.00, 1, 'KAIM2X', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8337234471747968, '', '', 'jwhuveqluw@iubridge.com', '8360ae21e741e07b1434898ba1e03c94', '123456', 'jwhuveqluw@iubridge.com', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-08 19:34:55', '2024-01-08 19:34:55', '2024-01-12 17:56:30', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 'A9C1SA', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8337294312997440, '', '', 'lveetovkez@iubridge.com', 'aa253270133ac486a90ec592bb009a23', '123456', 'lveetovkez@iubridge.com', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-12 18:11:43', '2024-01-12 18:11:43', '2024-01-12 18:11:43', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 'K3J6P1', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8337453443056192, '', '', 'jchjcfjhzh@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'D3', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-12 18:52:11', '2024-01-12 18:52:11', '2024-01-12 18:52:11', NULL, NULL, NULL, 0.00, 4400.00, 0.00, 0.00, 0, 0.00, 1, '6VS9DN', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8337492298957376, '', '', 'kfjjcxhhvzhgshjdd@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'D4', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-12 19:02:04', '2024-01-12 19:02:04', '2024-01-12 19:02:04', NULL, NULL, NULL, 0.00, 4400.00, 0.00, 0.00, 0, 0.00, 1, '5MASZ8', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8337511400342080, '', '', 'wusvedh@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'D5', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-12 19:06:56', '2024-01-12 19:06:56', '2024-01-12 19:06:56', NULL, NULL, NULL, 0.00, 4400.00, 0.00, 0.00, 0, 0.00, 1, 'ER3T7J', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8337527473504832, '', '', 'augs9435@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'D6', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, '2024-01-12 19:11:01', '2024-01-12 19:11:01', '2024-01-12 19:11:01', NULL, NULL, NULL, 0.00, 2400.00, 0.00, 0.00, 0, 0.00, 1, '5XOP56', 'A0', 0.00, 120000.00, 0.00);
INSERT INTO `user` VALUES (8337565902045760, '', '', 'omarwoodbium02@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'D1', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, '2024-01-12 19:20:47', '2024-01-12 19:20:47', '2024-01-12 19:20:47', NULL, NULL, NULL, 0.00, 1013504.91, 0.00, 0.00, 0, 0.00, 1, '1Z3VJH', 'A6', 0.00, 1000.00, 0.00);
INSERT INTO `user` VALUES (8337588323025472, '', '', 'disgqiaj61@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'D7', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, 1, '2024-01-12 19:26:30', '2024-01-12 19:26:30', '2024-01-12 19:26:30', NULL, NULL, NULL, 0.00, 48000.00, 0.00, 0.00, 0, 0.00, 1, 'Q6LE0A', 'A0', 0.00, 2000000.00, 0.00);
INSERT INTO `user` VALUES (8337672509522496, '', '', 'wuren210@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'D8', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, 1, '2024-01-12 19:47:54', '2024-01-12 19:47:54', '2024-01-12 19:47:54', NULL, NULL, NULL, 0.00, 48000.00, 0.00, 0.00, 0, 0.00, 1, 'Y9WRUY', 'A0', 0.00, 2000000.00, 0.00);
INSERT INTO `user` VALUES (8337936537223744, '', '', 'roint3nsalboo@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'E1', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-12 20:55:03', '2024-01-12 20:55:03', '2024-01-12 20:55:03', NULL, NULL, NULL, 5000.00, 0.00, 0.00, 0.00, 0, 0.00, 0, '7ADFN8', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8337943167631936, '', '', 'seanlong1324@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'E2', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-12 20:56:44', '2024-01-12 20:56:44', '2024-01-12 20:56:44', NULL, NULL, NULL, 5000.00, 0.00, 0.00, 0.00, 0, 0.00, 0, '5MRDIM', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8337966576828992, '', '', 'imogeneduffyndbv3144@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'E3', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, '2024-01-12 21:02:41', '2024-01-12 21:02:41', '2024-01-12 21:02:41', NULL, NULL, NULL, 9500.00, 0.00, 0.00, 0.00, 0, 0.00, 1, '2JXRHP', 'A0', 0.00, 500.00, 0.00);
INSERT INTO `user` VALUES (8337976273404480, '', '', 'charliestantonflrx130@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'E4', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-12 21:05:09', '2024-01-12 21:05:09', '2024-01-12 21:05:09', NULL, NULL, NULL, 60000.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 'L1MZGP', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8337984330596800, '', '', 'dc2887512@gmail.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'E5', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, '2024-01-12 21:07:12', '2024-01-12 21:07:12', '2024-01-12 21:07:12', NULL, NULL, NULL, 60000.00, 0.00, 0.00, 0.00, 0, 0.00, 0, 'IB2OIK', 'A0', 0.00, 0.00, 0.00);
INSERT INTO `user` VALUES (8342705322001088, '', '', '653a9865a25224@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '1', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2024-01-13 17:07:49', '2024-01-13 17:07:49', '2024-01-13 17:07:49', NULL, NULL, NULL, 0.00, 146789.61, 0.00, 0.00, 0, 0.00, 1, 'NQQ44H', 'A5', 0.00, 100.00, 0.00);
INSERT INTO `user` VALUES (8342723133244096, '', '', 'fe8b6065a253a8@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'a', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-13 17:12:20', '2024-01-13 17:12:20', '2024-01-13 17:12:20', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, '092C35', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8342729767715520, '', '', 'fde93265a25410@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'b', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-13 17:14:02', '2024-01-13 17:14:02', '2024-01-13 17:14:02', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'ZRN3EC', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8342736702014144, '', '', '0e74ee65a25475@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'c', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-13 17:15:48', '2024-01-13 17:15:48', '2024-01-13 17:15:48', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, '8INHJ2', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8342743198663360, '', '', '53343365a254d4@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '2', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, '2024-01-13 17:17:27', '2024-01-13 17:17:27', '2024-01-13 17:17:27', NULL, NULL, NULL, 0.00, 43996.30, 0.00, 0.00, 0, 0.00, 1, 'EO7D3O', 'A4', 0.00, 1000.00, 0.00);
INSERT INTO `user` VALUES (8342754820358848, '', '', '99c4e665a25598@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', 'a', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-13 17:20:24', '2024-01-13 17:20:24', '2024-01-13 17:20:24', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, '4JEV3E', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8342761418261184, '', '', 'eb864865a255f2@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '3', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, '2024-01-13 17:22:05', '2024-01-13 17:22:05', '2024-01-13 17:22:05', NULL, NULL, NULL, 0.00, 16265.36, 0.00, 0.00, 0, 0.00, 1, 'XL2RTT', 'A3', 0.00, 1000.00, 0.00);
INSERT INTO `user` VALUES (8342778194035392, '', '', '541e7365a256bc@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '4', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, '2024-01-13 17:26:21', '2024-01-13 17:26:21', '2024-01-13 17:26:21', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, '95BKII', 'A0', 0.00, 120000.00, 0.00);
INSERT INTO `user` VALUES (8342796507022016, '', '', '844f9165a2580e@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '5', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, '2024-01-13 17:31:00', '2024-01-13 17:31:00', '2024-01-13 17:31:00', NULL, NULL, NULL, 0.00, 40140.46, 0.00, 0.00, 0, 0.00, 1, 'E11K0K', 'A4', 0.00, 500.00, 0.00);
INSERT INTO `user` VALUES (8342808315560640, '', '', 'ec8d9365a258b8@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '6', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-13 17:34:00', '2024-01-13 17:34:00', '2024-01-13 17:34:00', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'BP0AU4', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8342836240777920, '', '', '7f24a165a25a82@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '8', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-13 17:41:06', '2024-01-13 17:41:06', '2024-01-13 17:41:06', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'N3MIM2', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8342846662640320, '', '', '3d439365a25b11@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '9', NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, '2024-01-13 17:43:45', '2024-01-13 17:43:45', '2024-01-13 17:43:45', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'HAWWZF', 'A0', 0.00, 200000.00, 0.00);
INSERT INTO `user` VALUES (8342854744146624, '', '', '1ddda565a25b9d@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '10', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 1, '2024-01-13 17:45:49', '2024-01-13 17:45:49', '2024-01-13 17:45:49', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, '0PQXN5', 'A0', 0.00, 120000.00, 0.00);
INSERT INTO `user` VALUES (8342864827908800, '', '', 'c84a1965a25c26@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '11', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, '2024-01-13 17:48:23', '2024-01-13 17:48:23', '2024-01-13 17:48:23', NULL, NULL, NULL, 0.00, 890631.66, 0.00, 0.00, 0, 0.00, 1, 'GLM3OX', 'A6', 0.00, 1000.00, 0.00);
INSERT INTO `user` VALUES (8342874669187776, '', '', 'f86af065a25cc4@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '12', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, 1, '2024-01-13 17:50:53', '2024-01-13 17:50:53', '2024-01-13 17:50:53', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, '8XVBYH', 'A0', 0.00, 2000000.00, 0.00);
INSERT INTO `user` VALUES (8342884512301760, '', '', '847d2065a25d4e@cashbenties.com', 'cc49665c32a20d4e288da745d83a2ed2', '123456', '12', NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, 1, '2024-01-13 17:53:23', '2024-01-13 17:53:23', '2024-01-13 17:53:23', NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0, 0.00, 1, 'P5PQ3H', 'A0', 0.00, 2000000.00, 0.00);

-- ----------------------------
-- Table structure for user_amount_record
-- ----------------------------
DROP TABLE IF EXISTS `user_amount_record`;
CREATE TABLE `user_amount_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收益状态',
  `type` int NULL DEFAULT NULL COMMENT '收益类型',
  `amount` decimal(64, 2) NULL DEFAULT NULL COMMENT '数量',
  `ext_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` int NULL DEFAULT 0,
  `sku_record_id` int NULL DEFAULT NULL,
  `cbu_usdt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cbu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `symbol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'CBU',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5693 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_amount_record
-- ----------------------------
INSERT INTO `user_amount_record` VALUES (5223, 8286040614438528, NULL, 2, 0.70, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:43', 0, 891, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5224, 8315778129200896, NULL, 2, 0.70, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:44', 0, 893, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5225, 8315884527682240, NULL, 2, 9.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:44', 0, 894, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5226, 8315893343126208, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:44', 0, 892, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5227, 8315914552935104, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:44', 0, 895, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5228, 8315923946668736, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:44', 0, 896, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5229, 8315937831912128, NULL, 2, 9.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:44', 0, 897, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5230, 8315953302733504, NULL, 2, 4.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:44', 0, 900, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5231, 8315963590050496, NULL, 2, 1200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:44', 0, 899, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5232, 8315974446088896, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:44', 0, 898, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5233, 8315985613816512, NULL, 2, 9.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:44', 0, 903, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5234, 8316768585188032, NULL, 2, 0.70, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:44', 0, 914, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5235, 8316793716015808, NULL, 2, 0.70, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:45', 0, 915, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5236, 8316810811671232, NULL, 2, 0.70, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:45', 0, 919, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5237, 8316822604677824, NULL, 2, 0.70, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:45', 0, 916, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5238, 8316837647418048, NULL, 2, 4.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:45', 0, 917, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5239, 8337453443056192, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:45', 0, 905, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5240, 8337492298957376, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:45', 0, 906, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5241, 8337511400342080, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:45', 0, 907, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5242, 8337527473504832, NULL, 2, 1200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:45', 0, 908, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5243, 8337565902045760, NULL, 2, 9.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:45', 0, 904, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5244, 8337588323025472, NULL, 2, 24000.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 909, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5245, 8337672509522496, NULL, 2, 24000.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 910, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5246, 8337966576828992, NULL, 2, 4.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 918, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5247, 8342705322001088, NULL, 2, 0.70, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 931, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5248, 8342723133244096, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 932, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5249, 8342729767715520, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 933, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5250, 8342736702014144, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 934, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5251, 8342743198663360, NULL, 2, 9.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 935, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5252, 8342754820358848, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 936, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5253, 8342761418261184, NULL, 2, 9.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 920, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5254, 8342778194035392, NULL, 2, 1200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 921, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5255, 8342796507022016, NULL, 2, 4.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 922, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5256, 8342808315560640, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 923, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5257, 8342820766810816, NULL, 2, 9.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 924, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5258, 8342836240777920, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 925, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5259, 8342846662640320, NULL, 2, 2200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 926, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5260, 8342854744146624, NULL, 2, 1200.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 927, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5261, 8342864827908800, NULL, 2, 9.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:46', 0, 928, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5262, 8342874669187776, NULL, 2, 24000.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:47', 0, 929, NULL, NULL, 'CBU');
INSERT INTO `user_amount_record` VALUES (5263, 8342884512301760, NULL, 2, 24000.00, '模块收益', '2024-01-15 13:09:05', '2024-01-13 18:48:47', 0, 930, NULL, NULL, 'CBU');

-- ----------------------------
-- Table structure for user_kyc
-- ----------------------------
DROP TABLE IF EXISTS `user_kyc`;
CREATE TABLE `user_kyc`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `card_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` int NULL DEFAULT 0,
  `status` int NULL DEFAULT NULL COMMENT '0：审核中  -1不通过  1通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_kyc
-- ----------------------------
INSERT INTO `user_kyc` VALUES (13, 8286040614438528, '222', '222', '22', '', '2024-01-04 18:44:14', NULL, 0, 1);
INSERT INTO `user_kyc` VALUES (14, 8217866366560064, '12', '1', '1212', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-04/e72a6452-f22f-4df4-96de-33c95e09f45c.png', '2024-01-04 18:55:40', NULL, 0, -1);
INSERT INTO `user_kyc` VALUES (15, 8217866366560064, '12', '2', '12', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-04/f477c8ba-ce43-44ce-8803-ee452449ea76.png', '2024-01-04 18:56:15', NULL, 0, 1);
INSERT INTO `user_kyc` VALUES (16, 8295884452332800, '测试1', '1', '223789936', '', '2024-01-05 22:04:15', NULL, 0, 1);
INSERT INTO `user_kyc` VALUES (17, 8298197955510592, '', '', '', '', '2024-01-05 23:13:57', NULL, 0, 1);
INSERT INTO `user_kyc` VALUES (18, 8315778129200896, '', '', '', '', '2024-01-08 23:52:26', NULL, 0, 1);
INSERT INTO `user_kyc` VALUES (19, 8316704158515904, '', '', '', '', '2024-01-09 02:55:54', NULL, 0, 1);
INSERT INTO `user_kyc` VALUES (20, 8235340173484032, '111', '111', '111', 'https://iccc.oss-cn-beijing.aliyuncs.com/dev/api/2024-01-11/f90bb65e-7f4b-4698-af06-c571720b3f52.png', '2024-01-11 18:51:56', '2024-01-11 10:51:55', 0, 1);
INSERT INTO `user_kyc` VALUES (21, 8315929736184512, '', '', '', '', '2024-01-11 23:49:26', '2024-01-11 15:49:25', 0, 1);

-- ----------------------------
-- Table structure for user_sku_record
-- ----------------------------
DROP TABLE IF EXISTS `user_sku_record`;
CREATE TABLE `user_sku_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NULL DEFAULT NULL,
  `sku_id` bigint NULL DEFAULT NULL,
  `amount` decimal(64, 2) NULL DEFAULT NULL,
  `allowance` decimal(64, 2) NULL DEFAULT NULL COMMENT '剩量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` int NULL DEFAULT 0,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 936 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_sku_record
-- ----------------------------
INSERT INTO `user_sku_record` VALUES (891, 8286040614438528, 11, 100.00, 30.00, '2024-01-12 15:14:08', '2024-01-12 15:14:08', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (892, 8315893343126208, 16, 200000.00, 30.00, '2024-01-12 15:15:43', '2024-01-12 15:15:43', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (893, 8315778129200896, 11, 100.00, 30.00, '2024-01-12 15:17:05', '2024-01-12 15:17:05', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (894, 8315884527682240, 13, 1000.00, 30.00, '2024-01-12 15:18:38', '2024-01-12 15:18:38', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (895, 8315914552935104, 16, 200000.00, 30.00, '2024-01-12 15:19:44', '2024-01-12 15:19:44', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (896, 8315923946668736, 16, 200000.00, 30.00, '2024-01-12 15:20:24', '2024-01-12 15:20:24', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (897, 8315937831912128, 13, 1000.00, 30.00, '2024-01-12 15:22:58', '2024-01-12 15:22:58', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (898, 8315974446088896, 16, 200000.00, 30.00, '2024-01-12 15:23:58', '2024-01-12 15:23:58', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (899, 8315963590050496, 15, 120000.00, 30.00, '2024-01-12 15:27:06', '2024-01-12 15:27:06', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (900, 8315953302733504, 12, 500.00, 30.00, '2024-01-12 15:27:53', '2024-01-12 15:27:53', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (901, 8315985613816512, 11, 100.00, 30.00, '2024-01-12 15:29:24', '2024-01-12 15:29:24', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (902, 8315985613816512, 12, 400.00, 30.00, '2024-01-12 15:29:38', '2024-01-12 15:29:38', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (903, 8315985613816512, 13, 500.00, 30.00, '2024-01-12 15:29:53', '2024-01-12 15:29:53', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (904, 8337565902045760, 13, 1000.00, 30.00, '2024-01-12 19:22:25', '2024-01-12 19:22:25', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (905, 8337453443056192, 16, 200000.00, 30.00, '2024-01-12 19:32:51', '2024-01-12 19:32:51', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (906, 8337492298957376, 16, 200000.00, 30.00, '2024-01-12 19:34:03', '2024-01-12 19:34:03', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (907, 8337511400342080, 16, 200000.00, 30.00, '2024-01-12 19:35:18', '2024-01-12 19:35:18', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (908, 8337527473504832, 15, 120000.00, 30.00, '2024-01-12 19:36:27', '2024-01-12 19:36:27', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (909, 8337588323025472, 17, 2000000.00, 30.00, '2024-01-12 19:37:07', '2024-01-12 19:37:07', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (910, 8337672509522496, 17, 2000000.00, 30.00, '2024-01-12 19:49:26', '2024-01-12 19:49:26', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (911, 8315778129200896, 14, 500.00, 1000.00, '2024-01-12 20:08:35', '2024-01-18 10:08:35', 0, 'AI_POOL');
INSERT INTO `user_sku_record` VALUES (912, 8315778129200896, 18, 300.00, 1000.00, '2024-01-12 20:08:35', '2024-01-18 10:08:35', 0, 'AI_POOL');
INSERT INTO `user_sku_record` VALUES (913, 8315778129200896, 19, 200.00, 1000.00, '2024-01-12 20:08:35', '2024-01-18 10:08:35', 0, 'AI_POOL');
INSERT INTO `user_sku_record` VALUES (914, 8316768585188032, 11, 100.00, 30.00, '2024-01-13 01:52:10', '2024-01-13 01:52:10', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (915, 8316793716015808, 11, 100.00, 30.00, '2024-01-13 01:52:56', '2024-01-13 01:52:56', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (916, 8316822604677824, 11, 100.00, 30.00, '2024-01-13 01:53:39', '2024-01-13 01:53:39', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (917, 8316837647418048, 12, 500.00, 30.00, '2024-01-13 01:55:23', '2024-01-13 01:55:23', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (918, 8337966576828992, 12, 500.00, 30.00, '2024-01-13 01:58:54', '2024-01-13 01:58:54', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (919, 8316810811671232, 11, 100.00, 30.00, '2024-01-13 02:00:00', '2024-01-13 02:00:00', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (920, 8342761418261184, 13, 1000.00, 30.00, '2024-01-13 17:23:48', '2024-01-13 17:23:48', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (921, 8342778194035392, 15, 120000.00, 30.00, '2024-01-13 17:28:24', '2024-01-13 17:28:24', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (922, 8342796507022016, 12, 500.00, 30.00, '2024-01-13 17:31:50', '2024-01-13 17:31:50', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (923, 8342808315560640, 16, 200000.00, 30.00, '2024-01-13 17:35:12', '2024-01-13 17:35:12', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (924, 8342820766810816, 13, 1000.00, 30.00, '2024-01-13 17:37:53', '2024-01-13 17:37:53', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (925, 8342836240777920, 16, 200000.00, 30.00, '2024-01-13 17:42:26', '2024-01-13 17:42:26', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (926, 8342846662640320, 16, 200000.00, 30.00, '2024-01-13 17:44:36', '2024-01-13 17:44:36', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (927, 8342854744146624, 15, 120000.00, 30.00, '2024-01-13 17:46:43', '2024-01-13 17:46:43', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (928, 8342864827908800, 13, 1000.00, 30.00, '2024-01-13 17:49:25', '2024-01-13 17:49:25', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (929, 8342874669187776, 17, 2000000.00, 30.00, '2024-01-13 17:51:50', '2024-01-13 17:51:50', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (930, 8342884512301760, 17, 2000000.00, 30.00, '2024-01-13 17:54:19', '2024-01-13 17:54:19', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (931, 8342705322001088, 11, 100.00, 30.00, '2024-01-13 17:55:58', '2024-01-13 17:55:58', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (932, 8342723133244096, 16, 200000.00, 30.00, '2024-01-13 17:56:53', '2024-01-13 17:56:53', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (933, 8342729767715520, 16, 200000.00, 30.00, '2024-01-13 17:58:19', '2024-01-13 17:58:19', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (934, 8342736702014144, 16, 200000.00, 30.00, '2024-01-13 17:59:14', '2024-01-13 17:59:14', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (935, 8342743198663360, 13, 1000.00, 30.00, '2024-01-13 18:00:14', '2024-01-13 18:00:14', 0, 'AI_COLLECT');
INSERT INTO `user_sku_record` VALUES (936, 8342754820358848, 16, 200000.00, 30.00, '2024-01-13 18:02:23', '2024-01-13 18:02:23', 0, 'AI_COLLECT');

-- ----------------------------
-- Table structure for user_wallet
-- ----------------------------
DROP TABLE IF EXISTS `user_wallet`;
CREATE TABLE `user_wallet`  (
  `id` bigint NOT NULL,
  `network_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '网络类型',
  `mnemonic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '助记词',
  `privateKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '私钥',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `publicKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公钥',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` int NULL DEFAULT 0,
  `user_id` bigint NULL DEFAULT NULL,
  `balance` decimal(32, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_wallet
-- ----------------------------
INSERT INTO `user_wallet` VALUES (1, NULL, NULL, NULL, '0xda77018ec185aa0913dacf4cf5522588e242a37c', NULL, '2023-12-30 08:00:59', '2023-12-30 08:00:59', 0, 8217921427810240, 0.00);
INSERT INTO `user_wallet` VALUES (2, NULL, NULL, NULL, '0xda77018ec185aa0913dacf4cf5522588e242a37c', NULL, '2023-12-30 08:01:05', '2023-12-30 08:01:05', 0, 8235340173484032, 0.00);
INSERT INTO `user_wallet` VALUES (8286040677156480, NULL, '[evidence, sport, emotion, raw, fluid, craft, diary, olympic, before, joy, fetch, riot]', '0x493a7b1e72bf04cdc207d5e0458485cb107862ecf8226b259d92dc77fdc1b0ff', '0x59d4acb9d136964380954ff52fd3b85eb08eab89', 'ba186e140a4e4afe28b212b1f3a3c3e7662f9f3ed8a00882c1f30c70ff976fed548fdd20c140d6e1f7849b78a565c8b082f5bcb90f91123361a40965bc88551d', '2024-01-03 16:57:15', '2024-01-03 16:57:15', 0, 8286040614438528, 0.00);
INSERT INTO `user_wallet` VALUES (8295884517082368, NULL, '[strategy, siege, eyebrow, essence, mother, funny, siren, skate, ozone, humble, merry, horror]', '0x6f36fabb16362bbff843ed126b1e4646d5c6dbaf0862172793c9a2dcf6ad16e4', '0x994c7ddac35bf4e79511fdfb4a0a5ceffcdae7eb', '55dee45286bf4ec6fdff60eec42dabe73a21a83c0ebb46998f9a5938cbd729dfd1995a5ba4e8d19d0197c09758f260b6e8933a35e4322979d6bdb45a2651580', '2024-01-05 10:40:40', '2024-01-05 10:40:40', 0, 8295884452332800, 0.00);
INSERT INTO `user_wallet` VALUES (8298197992603968, NULL, '[cute, document, biology, diamond, hub, between, route, already, uniform, antique, link, tuition]', '0x18ccbedb7e054d6f2a03451a1027fb504a969a0045145a7dba94bde931e5cde5', '0x369012c3926ce2a40a5fd180589a4578b405987c', 'b5e3d938d951673edd9ee5937a1d68b2bb6183c98210fa12ae3534299909cc33e4ff2c43b11bbdcf4b7cb4bd9c3d848c143fab5cebeaead7bf7946fe6c761bc1', '2024-01-05 20:29:01', '2024-01-05 20:29:01', 0, 8298197955510592, 0.00);
INSERT INTO `user_wallet` VALUES (8298669366182208, NULL, '[civil, dry, warrior, yard, arrest, merry, success, suit, effort, curious, rotate, isolate]', '0x5cfcb18c450014f5eb1a189cc48adbd60f0a189b2cfeeaf003bcce780d65dc9', '0xda873a5b56d43c5585ea2ceab9f2cb784022e680', '80499190d93d9b234ec88312efd5437c082cf8bf50eb46da4844649e9620bda7ae5d31783c604fcaa4495e50745f655bd91b2d1c43be557f842eddccfe9b6b69', '2024-01-05 22:28:53', '2024-01-05 22:28:53', 0, 8298669362839872, 0.00);
INSERT INTO `user_wallet` VALUES (8302080698483008, NULL, '[trigger, curve, giraffe, real, antique, inside, crop, under, silent, leisure, smile, response]', '0x572901fbed1d7e6bf119b23a101f45cb7e93766281d5a32a3cbe7bfe2c53f38a', '0x0eee9363ca0c77e3809be2b403515d7ff541c0b6', '1440fe7f72c915207b87954c5d4c4f2911d4549fa325ac732eb20cf095f7cb755b7f02d87dbf98c3c42cb14a450c80976f1dcf161dea1366f40ad7cbe13e5372', '2024-01-06 12:56:26', '2024-01-06 12:56:26', 0, 8302080695927104, 0.00);
INSERT INTO `user_wallet` VALUES (8302534483378496, NULL, '[radio, humble, trick, swim, age, culture, payment, kangaroo, quality, reason, gift, cloud]', '0xb7e73164a6076a8989b8c855d0aff6543bbe99a9950dcd1b45995f7008495d9e', '0x4e73ed7cd6febadfbe3457687835c565a5f44760', 'dfd6f097f84d5aed0d78647aefd25293b4184f8a5eab234b51024c243d16b393ffb6778d14a8627a1cfe8775b41b23e325bffbfa4aec522b268c312290b169e9', '2024-01-06 14:51:50', '2024-01-06 14:51:50', 0, 8302534480888128, 0.00);
INSERT INTO `user_wallet` VALUES (8302784870809920, NULL, '[senior, slush, labor, cargo, author, series, pyramid, draft, concert, finish, gesture, abandon]', '0x35c61da17442ae3f4a95dbe7abee2834daa1e231257689cabd762925969dc858', '0xaf5fb209ef48902da0a8d31fdf06d452f8d8835a', '62328a32a086b95ec34ef23f121c680123c02f035cbdde65fc6a4a2ee1c519ce67bbe78ebd823a60d7eab2ad78766ce170c7d80ddab0a5aaff6258b2aca3f918', '2024-01-06 15:55:31', '2024-01-06 15:55:31', 0, 8302784868254016, 0.00);
INSERT INTO `user_wallet` VALUES (8302803515408704, NULL, '[parade, music, cream, swap, ecology, poverty, rubber, door, boring, push, kite, lounge]', '0x2d3b52ebf4b4fad90eefe5b5858ebe76e5dba42612b83eba740ce85d31c49fa5', '0xc1efacfcf7a654f79cf31ed5fe82666caae7cbb4', '4b1f82439f2c056c3bde8634892841f848d0d354e7c5a7f14eae3a95a1ca34338713c50ce30450e5b7bae2f7806662a2890867ae99e7c8c98893dce32a6b7f80', '2024-01-06 16:00:15', '2024-01-06 16:00:15', 0, 8302803512525120, 0.00);
INSERT INTO `user_wallet` VALUES (8302883732717888, NULL, '[recall, artwork, open, private, token, dream, weekend, like, lesson, answer, genius, volume]', '0xa594d1651c4722135ff41e273f954ed30f2496d4e90e575b0346c511369f618b', '0x89f5c62a7e30c5c16c8ef591a3fd705cd7583c34', 'f7131d436a280e73e993446667aba36e639f748c51bc79a31753ae1adc61825f8145aeae0cd2df1a0a3370e016938a5fa51a9dae6c3b7bd8817678616d1bb5e9', '2024-01-06 16:20:39', '2024-01-06 16:20:39', 0, 8302883729768768, 0.00);
INSERT INTO `user_wallet` VALUES (8302920861286720, NULL, '[coffee, danger, mutual, blind, ribbon, steel, decorate, jazz, nothing, screen, broccoli, effort]', '0x17a4c9a9e8eda04f73dac914aa36c6d26eb22909edb31107974b62e992c850e2', '0x183ff3319ac24ae324e9e01ba348800ad97b847a', '9229e8cd3f75ebd6cc258280e618d308106ebc8dc0ba692b244065bd54dc9e3d4c4ada1fefcbed5e81e002511224fdcc742069a15495293ee95b14ea111d65c0', '2024-01-06 16:30:06', '2024-01-06 16:30:06', 0, 8302920857747776, 0.00);
INSERT INTO `user_wallet` VALUES (8302937209643264, NULL, '[thunder, wheel, question, exile, now, merge, reward, become, across, obvious, wood, parent]', '0xac12aa8e90f577c2eb781ccd7cc5e46b2b022e53ebfeb840e84deed2ea0ff58c', '0x5b58c37e6ced09eca44d435715301712fba1a519', '9bc897a5110fb9cc126d2ded1a93cb9cd6038e72ea462b6440943b1a815adc2849451b57eef624ccfeb432ac492b20be90c2e123407c1553ea0db2364ef76a1', '2024-01-06 16:34:15', '2024-01-06 16:34:15', 0, 8302937163571456, 0.00);
INSERT INTO `user_wallet` VALUES (8302945563123968, NULL, '[hobby, body, west, sight, birth, huge, toss, domain, axis, ring, silk, column]', '0xe88943708645d616b75f48e22ae2d82d1ec84b7b757e1997f08b1d99a5187374', '0xe40447c8bd57bc5ec7c0076f564ac3e9a5018b6d', '3ac4e4639de9bb5f34c0bc86f8a96395cedc9f06bc6fae5dc0845c7c897211c28cab7454faa598f271910dcf3ed14a0058a02ca84ee86b85c3cb343ac40d787c', '2024-01-06 16:36:23', '2024-01-06 16:36:23', 0, 8302945529438464, 0.00);
INSERT INTO `user_wallet` VALUES (8304284910027712, NULL, '[today, top, margin, usage, endless, snow, scale, flat, flee, tattoo, permit, mix]', '0x906f861559bbf9d9d4af3492e5ff3f7cdb4e7c386adaff4c2ef1b153f7d9d723', '0x11dda25427922b84d32971afad8ec3516f1dfede', 'e3327f5cb0b6688a536795a0d3dd91025c3b20f220154f7500b432208b0b25d480bcd69d2572cde268c52ff8c5455b2ac3915e5f563316dd80e0a74a5fa0d6c7', '2024-01-06 22:17:00', '2024-01-06 22:17:00', 0, 8304284876342208, 0.00);
INSERT INTO `user_wallet` VALUES (8304314246890432, NULL, '[charge, first, salad, mixture, shield, arrest, fork, monkey, onion, then, fitness, wire]', '0xe94e3d5e39e766c3f21b7eeb5b72e22cf083684863f5be62ff5cc74f1b43ff80', '0x9043aaae2c51eb4030a1480d678d975e0e14487c', 'acb1a3b704705616c7f22576f6f33af2909676e7be08ac8f69abb7d33b383b220db6eb71f41c22bd9e1c745b96d3db216d97529ac5e920eb0f57d8078e1f8806', '2024-01-06 22:24:27', '2024-01-06 22:24:27', 0, 8304314243482560, 0.00);
INSERT INTO `user_wallet` VALUES (8308589889782720, NULL, '[convince, uncle, obscure, wall, frost, elephant, regular, lawn, yellow, improve, flash, camp]', '0x86c422b84b238a07f4a87623cad5c8907c5ba0491e25b9130ca89c7e5a67f96a', '0xfb641e57574dc6c0bd194865c063171a03ab6dd8', '8d1571da2c0151c6d08622c1a6a7742e96c07d5b07a4f9564508e8eb6a7e2c4e7814b18de72453bceb9d97328d00ef98e7421f34813bb53245b097e6eac4c6d6', '2024-01-07 16:31:49', '2024-01-07 16:31:49', 0, 8308589886702528, 0.00);
INSERT INTO `user_wallet` VALUES (8313597989356480, NULL, '[pony, title, universe, include, awful, galaxy, clarify, warfare, polar, inner, quit, turn]', '0x1af53aafa5b603e54722fcfd26e00bc5cb61675f2cac4ea33db437ebd4d27d04', '0x0aecab6b4f486774b52e69ca806f9793de41f872', 'e35400efa263f23770bdb5181c952da38495545dc1f9fc0245bd42512744610b609e632dca90623578f1738cf047edd4d5692bbf53559b4f08ec9f9c3ac414e9', '2024-01-08 13:45:26', '2024-01-08 13:45:26', 0, 8313597986472896, 0.00);
INSERT INTO `user_wallet` VALUES (8315778172258048, NULL, '[silk, you, pass, use, hungry, weapon, kitchen, never, sausage, rookie, orphan, throw]', '0xb693e592a775b6fbcd9a8c01fcea940f1495eb72be3db9bbd9f23d2708fead3c', '0x05fd5f1fb716f57101582b564ddbc9f22637a7d2', '3b7d4fcf0a7379d3af1acf7faa9902f0469aa41dc4cbc205abc805dbbb7d38f6b85f35d88304c86854c78118051b6f3470a7c7c14f82cc59fb02a186b0b3a54d', '2024-01-08 22:59:53', '2024-01-08 22:59:53', 0, 8315778129200896, 0.00);
INSERT INTO `user_wallet` VALUES (8315884568380096, NULL, '[material, shuffle, pencil, net, system, final, trust, purse, soon, fat, caught, bachelor]', '0xc67f5296fdaf3edb68dd0ac223924990bb4021d54bd7af31f46e86d39fc313e9', '0xb34c47ab3fabb9ccdf912860d0a394bd1008020f', '5a118ef9899f2fad8ba3c70e0815ada7c177716d8023bc953420af9a3439572f46b80670b24aab534db489db8364992eaaaa7251909c21a5531de008b06fd490', '2024-01-08 23:26:56', '2024-01-08 23:26:56', 0, 8315884527682240, 0.00);
INSERT INTO `user_wallet` VALUES (8315893346665152, NULL, '[entire, reason, long, between, ozone, fold, powder, coyote, orphan, rule, dignity, loan]', '0x6d207a37891b17c2835c6002ee6fb6da51991f251cf1a4b199ea7144e1798398', '0xb1dad3ac1e0c992e5be24d8612497bd04333c802', '9dc562fc9a85a792d7bf2f1458b5dbb17011c52d382c8a63e8a212750e6898cd38891fe49277972f68ea769a5e42d764eecd29127b1b2ca836877fc2547ed618', '2024-01-08 23:29:10', '2024-01-08 23:29:10', 0, 8315893343126208, 0.00);
INSERT INTO `user_wallet` VALUES (8315914556342976, NULL, '[base, pupil, crime, crystal, urban, pause, dad, final, alarm, toe, entry, dad]', '0xf536d0fe37afc8cfba7633918ca652d9ab51a0cda75641d126db2759f7a770e4', '0x64983f9770deb15181b340269bf985a66556bd72', '8b9a2471fbe8bb1a97df2515458f38c10ec1c64a7209bdc517580410a525782cc9dc79b8d235beb66b0301710b0874633cc234b1dda4996b7e24c363ea6c5ef6', '2024-01-08 23:34:34', '2024-01-08 23:34:34', 0, 8315914552935104, 0.00);
INSERT INTO `user_wallet` VALUES (8315923949617856, NULL, '[eagle, tongue, unusual, best, world, wonder, orient, remain, wisdom, grant, agree, twist]', '0xa073313b915acc07ec0b3c97a0b062f3bb58aa86a70c4b3eda919b9a7c08f241', '0x48dda46492da624491a02ce42de979f665d2966d', 'b16078f2b6e6dd13ef3ab8735e55c6ff1c0f5407bff4463faaf219b9fc1eb784d59a0da7d482c011aeb9f6a3eae71e0d8851941c3a2bd504c9f0c303708cfcf5', '2024-01-08 23:36:57', '2024-01-08 23:36:57', 0, 8315923946668736, 0.00);
INSERT INTO `user_wallet` VALUES (8315929738805952, NULL, '[pen, arena, bring, today, anchor, regular, fade, barely, gadget, keep, noodle, round]', '0x6f6392d0ec2062c81fdb5ac19a247ea1360e3f3964af6d4b6c0624b59306b815', '0xb6dfc3411feb912f87d499a7999aca315bb29c93', '6ad5f21dcc8c64a74431257f0ef04034379301149f1d1283949bce72ea437834825710eb15d3517b20f95916e209ae54aa586ec34ad07191926429f2ca3ade02', '2024-01-08 23:38:26', '2024-01-08 23:38:26', 0, 8315929736184512, 0.00);
INSERT INTO `user_wallet` VALUES (8315937834599104, NULL, '[size, smart, rigid, churn, scissors, soda, news, body, impulse, devote, viable, boy]', '0xdccda5b4b7e9fd4064c64f50d80c037cc8a73efb5732a6add432845eff54ea31', '0x1f70e8448144e7bee74eda4ba2b71238301ba397', 'a6613ee08d3be13efe388fa845618647411e5180d8f8d2aa00ca9d79c3579f3bddf8654e6b3b0ba4a21fc3d09fcbc41219ae603974bff963e5ce0714bb21edd1', '2024-01-08 23:40:29', '2024-01-08 23:40:29', 0, 8315937831912128, 0.00);
INSERT INTO `user_wallet` VALUES (8315947152245440, NULL, '[sure, move, waste, only, regret, movie, bacon, convince, stay, fish, earn, swallow]', '0x5964a51bceba5559ce92c8975c2a156657c0a16c09876388ab0968b6a1199195', '0xf972a57e3e78c4c19c5b025f24e27c673b55f15a', '11c1202d75c3d467de3e9efb70aa93be43aafe85943b4114d60c82560a13414a3c8ae13ca24754b22787aec409fd7c9e5628141a3dbe0c1625d19279677f0598', '2024-01-08 23:42:51', '2024-01-08 23:42:51', 0, 8315947148116672, 0.00);
INSERT INTO `user_wallet` VALUES (8315953305682624, NULL, '[mistake, hobby, nose, dry, swarm, face, useless, father, blanket, dream, song, source]', '0xac6f085e7c2c518dbd5652b01aeb82ab6442a019bd0b5824964117059e818fcf', '0xa664d6346f5c9b2aa45b50ae14921eef7031aeba', '72a03d901003d1e2339feca97e324345ec652faa2c955061af69105f98754eaed55fc839705b3858f26a21d8516fc4f23d7711a669dbb93624cea1296b0ffe9a', '2024-01-08 23:44:25', '2024-01-08 23:44:25', 0, 8315953302733504, 0.00);
INSERT INTO `user_wallet` VALUES (8315958231630528, NULL, '[twelve, fox, property, service, leaf, debate, spoil, trend, reflect, cannon, fat, hazard]', '0xcd38e9b5dbd8eb1125935273cd0bd70cb6bbd70050a7e51ce702eca0ab9f8013', '0x3a07822e5d88360176e357f32d8eb296339bbc04', 'f8cce545d356c3bb59cfe265af224942c0713f4e674f3c4be532e559e4ba2be11e6b95bac86898a0bf6a1c897728635b2f80b1085b678b15d01e446e1888622', '2024-01-08 23:45:41', '2024-01-08 23:45:41', 0, 8315958229271232, 0.00);
INSERT INTO `user_wallet` VALUES (8315963593327296, NULL, '[light, admit, public, logic, rice, able, tool, response, busy, hungry, drive, method]', '0xf0aa05a502653c734e3bd4c3a691d5d351c7dd687f827d919dcd57acf8941586', '0x1693643640f4a237f9c30f368b69ed9dc68fad64', 'edb4086bace4589d7bfbda7f832ceb3d9292fbbb36e36a71035527f209c48fe9e0a0e7bc62b257e371d76d91e092de2bf22491e7833b5921bad988b876b8d0aa', '2024-01-08 23:47:02', '2024-01-08 23:47:02', 0, 8315963590050496, 0.00);
INSERT INTO `user_wallet` VALUES (8315969189053120, NULL, '[other, theory, capital, fish, produce, bread, input, tomato, canoe, position, wise, consider]', '0x63331c4a22be66b96327e3137eeef0e76600ade5a5d570f2174ab2475a757eff', '0x94a3b141267186f78e3ad269a6ae47c9609ef5c7', '8cb41c87085f2442e89cebc204d0314da7da50c4592f17667380e60795de36f06a987ccaa6dfc235842a972defdd36899b8bfb05efcdda2fd60fb45e548c1a67', '2024-01-08 23:48:28', '2024-01-08 23:48:28', 0, 8315969186693824, 0.00);
INSERT INTO `user_wallet` VALUES (8315974448579264, NULL, '[order, path, act, peanut, sorry, muffin, estate, laptop, cream, journey, wet, bracket]', '0x7bbaa008127e7ecf708ca7aebc9f260c639d3685d9891076de2f1275fcc3ed8e', '0xdd39823b8dd7bafaa110b34cd95e39a7689d01db', '6048d1491ee27f7435f18281b187b051842f7cd95f316a70060e3f371c3cd1ba6091dbb5707fab9dd97a2e8c38000997e534b50f9bbdbb3929c728837289c808', '2024-01-08 23:49:48', '2024-01-08 23:49:48', 0, 8315974446088896, 0.00);
INSERT INTO `user_wallet` VALUES (8315979990237888, NULL, '[stable, truth, problem, tourist, pill, family, parade, cute, sail, say, section, fitness]', '0x304863762e1b10159b4a67ebd9f6b2b43fc52831db98a9a452d495c7a9e87ae3', '0xe6a8555208ee3d076a2bd5d81734835c1b2239e0', 'af6f417e648e811a1c63d2aba581212e68bcdf46285e59c89952205bdc04b1913ef7126a8b444d5f5d742437fe3d86e5e42f0d93842d27a493a8f4cb4acaa816', '2024-01-08 23:51:13', '2024-01-08 23:51:13', 0, 8315979987944128, 0.00);
INSERT INTO `user_wallet` VALUES (8315985616175808, NULL, '[antique, lift, west, endless, moon, crumble, exhaust, wire, mom, trip, father, ribbon]', '0x4f5123b680bb6d649b23f97e447f53d6c2aa4eba1f8ea6688d199f8372247be7', '0xe0981681353c82d5adb4adbd2cb021e9acfcf0a0', '7238c906790ccb7d60cc0eabcc797686231e5ee3755059eb9690e0ed52a9d7b91c8202c28558b44c4be5b0979a9bbc9005d08e884d86c83534f5c4d7f50ebe89', '2024-01-08 23:52:38', '2024-01-08 23:52:38', 0, 8315985613816512, 0.00);
INSERT INTO `user_wallet` VALUES (8315991387800256, NULL, '[brain, fury, employ, digital, nature, equip, interest, smart, deposit, arrest, then, minor]', '0x7e3ab8a827010d5492dbeea84c455136eef400645bd67caeba434d59016afa45', '0x865e91152383de9b8299bbb50a38b3ca0e5945b3', '4627ab6d58d7283a1268e879ff9185e3e4d1696adf74c17f4a8ecba78f0109c13c73f90bccc1c9c8bbfe4ea9278e5fd60344aea66720cd48eeafc6e49eeccfed', '2024-01-08 23:54:06', '2024-01-08 23:54:06', 0, 8315991385244352, 0.00);
INSERT INTO `user_wallet` VALUES (8315996334719680, NULL, '[wall, hungry, merit, powder, frozen, margin, van, fall, aisle, destroy, bulb, favorite]', '0xaf557c41e6bdb4fa9502121618c113e25485a89b21597b7171294e9893ae998d', '0x710731b75bf83325d1e3cc92f2a592ded0707abf', '508752693a27cc0a275bd8075d14043edb52fcde99719bf0bc1bf60936a979495b5597347f34a49c2cdd834adf2203e34c7d23a5a7753b5b3ed54630248d3bef', '2024-01-08 23:55:22', '2024-01-08 23:55:22', 0, 8315996332360384, 0.00);
INSERT INTO `user_wallet` VALUES (8316001589330624, NULL, '[time, trophy, safe, obey, various, spatial, rice, zebra, balance, load, beauty, discover]', '0x7ab548a52375af9552ba1e678a05e219b14bdbf559b86aa0152c2bbbffd10e3c', '0xcb8871a11b93db4656b3095878dc6cb04c4b768a', '78a62168daf28b3ba9b2a63c13acafde82f2e32dd1907d49dbb8bc4706ff7c2a1430579dbfe6fd814f04a9b06e78c51ff8d5d0e82205e557315b19885417428e', '2024-01-08 23:56:42', '2024-01-08 23:56:42', 0, 8316001585857216, 0.00);
INSERT INTO `user_wallet` VALUES (8316286930911936, NULL, '[cry, jewel, side, boat, bicycle, entire, carpet, champion, rather, letter, task, taste]', '0x861ef682278330fe649727361d4bf2496a7f45fa4c1af39ab3f7fc53846dad76', '0x6a7a9cf89f67a20272c68ffa6531c3afca7d375e', 'b4816da240bebe0f9ce6abab5d9ed0e075f31fd99c27cc830ab4016e07dcb73985188a1adf143bf2f778fdfca3b86f0f6bd9a84a1d0598daf3fe63b2b2731ca5', '2024-01-09 01:09:16', '2024-01-09 01:09:16', 0, 8316286927962816, 0.00);
INSERT INTO `user_wallet` VALUES (8316302488699584, NULL, '[title, dice, segment, cradle, again, snake, analyst, practice, proof, inflict, science, resource]', '0xa7f22978dbae9cd993198055f2b10ff15c52a253e9bfd28e8440aa525f00461', '0x4f2f63ddd855b5478c0992cb5cfc36faab1ab2ac', '1cd1f13ad6466b571bcc0daa9908013d8c1c1ba9af3de44c366faaca39194446764bb7231e8c84eaa27540a8548edaec5f9ee1bbf33a08bc8fe2dcdf47669a49', '2024-01-09 01:13:13', '2024-01-09 01:13:13', 0, 8316302486536896, 0.00);
INSERT INTO `user_wallet` VALUES (8316323040068288, NULL, '[battle, bounce, unfold, aerobic, aware, apart, ritual, video, seminar, cube, love, conduct]', '0xfea94de73d45b774dd1b0df1b698c3da9027350f34e15d8fea1210a48fcfcf6f', '0x724cd659c9405b0d3ada235614e7346a30c1ffef', '276b2c0905365272a5dab1621212f88eabcd4b079cc96570167e9868c382e2473aa43e7730899b92aef6822de862f7805b5f945b02bcf2e7f0f90669d258c156', '2024-01-09 01:18:27', '2024-01-09 01:18:27', 0, 8316323037577920, 0.00);
INSERT INTO `user_wallet` VALUES (8316524510511808, NULL, '[slender, tray, private, dash, ball, begin, meadow, true, plug, people, oval, city]', '0x54b2ac2b135b41ea7bf54acc27038895ba0e9ede1d953dbc748e2e6b6789fa82', '0xe2ff4b3753b00cee3484c2f404447e27e53c40e3', '4961b136cd2a0cd2ffbefb6a714ef45d37c02ce075939d516ae0e692c50c01b3690c95542a027f2d58e3bb271b51a7c2402b23ddb0aaa9c94a800a4b882f7331', '2024-01-09 02:09:41', '2024-01-09 02:09:41', 0, 8316524508283584, 0.00);
INSERT INTO `user_wallet` VALUES (8316543523160768, NULL, '[spawn, inch, addict, apart, light, situate, cattle, claw, scorpion, step, almost, cram]', '0x5bc6a3e6d09d7e63dd74fb215f2e54f43d6b85bab50b10d6d1e9a07576834afa', '0xf2e6508e21714779ed00dd0cdc00aece749747c3', '6d71f778c03ea646dc07b2dd45288482af6a5112fbc2bfc2e92dbe02a7e67a07022440a8df85a39d6ea090ba33309aa45958ccac3372b8aca16d7d37dc7a59de', '2024-01-09 02:14:31', '2024-01-09 02:14:31', 0, 8316543520801472, 0.00);
INSERT INTO `user_wallet` VALUES (8316566581674688, NULL, '[input, genuine, stem, arena, margin, unit, stone, tuna, picnic, coral, kick, crumble]', '0x2eb47bba5212ce4ec75fbe2e51b3a0a39986e55cb4c200697b9ae8e3fdc14dcd', '0xfaddba37e7b87164a1d6c3e8141b9ded57eab31c', '436c9375a85bdb3fbe4a732087f82bb0113aac0888603ed68fcdf5ea2764f98848a9bba20762737d312825caedb9f351939214032d977d24a1979b25ea27be8b', '2024-01-09 02:20:23', '2024-01-09 02:20:23', 0, 8316566578987712, 0.00);
INSERT INTO `user_wallet` VALUES (8316588671763136, NULL, '[news, interest, one, figure, sudden, upon, company, speed, mom, brother, inmate, pistol]', '0xb58d472117f7d02ddbd8c0f65f7c1fbe41008d2a0f4c3e2e3ba4fa080b86d57c', '0x90d05ca559ff53b0b01d0219136560fd61bb1a20', '376cb5f0bd66323098bfc0e56269803819d3df2e2304e372cb26bf42f95e7a0f0f6f2854649897256584ddaa8f4882869a239000f9e0547707c87a15364ae587', '2024-01-09 02:26:00', '2024-01-09 02:26:00', 0, 8316588668945088, 0.00);
INSERT INTO `user_wallet` VALUES (8316603500135104, NULL, '[blur, file, notice, famous, magnet, nice, wrestle, hobby, rack, glow, sniff, toss]', '0xaaac7ccf7355d8b3af378fb9aae7433311f711c6fe3c9c73a7e55fd186b410d5', '0xdf274954c7336f64abf19e9ba9b86e37177d59e8', '7d6270f4d91bd64da42ffcfa40022a6b631d44d9d6bbc5f2fc31930d549aecc0fe1e56628bf76a17f97348a7a793ad17e7c1f378ebab3e3b91a4546bf1898ed5', '2024-01-09 02:29:47', '2024-01-09 02:29:47', 0, 8316603497841344, 0.00);
INSERT INTO `user_wallet` VALUES (8316615590937280, NULL, '[frozen, fly, egg, birth, true, absent, prefer, setup, neglect, hour, aware, timber]', '0xca4e7d5764187b16f5a33a2cfe178fd9ad5eea61722331513facb09f2092b939', '0xc8c289310194a8b47b2616c7c0173aadc0cb5153', '9a392f8fba75cb295f5c9972df1940749b417a653198193e3d223eb1de5ab46864dc581a0c4a828935d3323503c2af3cc5388060270e6cbc8ad47cf22ab19295', '2024-01-09 02:32:51', '2024-01-09 02:32:51', 0, 8316615588446912, 0.00);
INSERT INTO `user_wallet` VALUES (8316633457623744, NULL, '[peace, room, bamboo, crazy, ready, submit, mask, enable, reject, scene, indicate, expire]', '0xc8d6e9ace3380ce622641550cb70d282f2a2d036f6076aabe95e959579dfdc2', '0xd07d8c3dc34bc1e0d2415290d1aed65fe0ebbc15', 'aa5469a71c35a632fb9ca6e94d7ff369bbec6d8d396adb583d6af0026d174c028ff79a8f6e02106db5143ce17e947a5b562584eadc0b7726df99c8247317dd89', '2024-01-09 02:37:24', '2024-01-09 02:37:24', 0, 8316633455329984, 0.00);
INSERT INTO `user_wallet` VALUES (8316664620647104, NULL, '[crack, shoulder, help, inform, evidence, title, identify, guide, margin, carry, common, truth]', '0xe9000bbcf56a195eefcfb6bbae26d5db13eb87804aa95e2677e6c88ba561486a', '0x67b01c3241f4f2f87c1d04d47c9683e8607e31e4', '16caaace5ab3db65dee136760e7273b5c60fe7ef6f429949cb2f81e33d94818aef704b0a0be9e3f420019dac2d52011d38e3ce8c650c32480868b0ad30f506f', '2024-01-09 02:45:19', '2024-01-09 02:45:19', 0, 8316664617173696, 0.00);
INSERT INTO `user_wallet` VALUES (8316704160744128, NULL, '[aware, unknown, punch, salad, peasant, tool, refuse, option, emotion, autumn, recycle, danger]', '0xd6765c7ee832c33cd5147ea197a3f116aba594cb576f69700212e86569ce69b', '0x2bec934480d1305a6853419a172f4213dceac892', '78073700e2704c972da5c2d6883079cbdb22659044f7428465c9a0e87733f7baf545314d0f46b1cbb3489ec762c6f0d0d09a4450e91ce6046040048b81334ac8', '2024-01-09 02:55:22', '2024-01-09 02:55:22', 0, 8316704158515904, 0.00);
INSERT INTO `user_wallet` VALUES (8316722786468544, NULL, '[faith, skull, liberty, infant, fetch, potato, loyal, spatial, jar, soup, charge, yard]', '0x6623c0b5dfb72809c2aae3f95eb9ee934896a7a1dc7bf303bfd86866a9d23654', '0x4a59de5a011afc212206d18e70fde19cd2b31f92', 'f2f194d5bd1f5e069813235df917edb3dacfc20c98fa0e7c75a0ca5bcfae13d76afb3b5a2b8368d624ab9d3ada375bfc3843337ebf790293d9740a58ef0e0644', '2024-01-09 03:00:07', '2024-01-09 03:00:07', 0, 8316722783912640, 0.00);
INSERT INTO `user_wallet` VALUES (8316768587350720, NULL, '[exile, health, until, expire, voice, write, promote, sort, mango, tray, surge, gossip]', '0xa082dc64c350f8e7ebdcbdb608e401772ccc76afd639dc2be2d1c712898c8c62', '0x0394d63c02a0b6b3935b3f9b4eea5dd077466014', 'cb6441f41b7c326b2c1142bc30a4c5b7ba2b0dda13ad6183639e98702a6d7a34192ee80d707922157aa188e83444471f2383e2344447956696e10dd28ee7eb20', '2024-01-09 03:11:46', '2024-01-09 03:11:46', 0, 8316768585188032, 0.00);
INSERT INTO `user_wallet` VALUES (8316793718309568, NULL, '[wire, point, envelope, oak, warrior, mixed, resemble, cluster, defense, grab, logic, salon]', '0xe2add589cbf9dcb27d164f75720df1e8471ae49a04fe4b3f3752f97e796127cb', '0x18eb1495768de501866e55e53019392d4da0a246', '8d94bc11fff25070895dc77803b2706347ddeb07fd99749b408b349e95e68ff1fab936b882a39d64386884fea443d713b9c35a1d9e850710586b4aa8d79d1b9b', '2024-01-09 03:18:09', '2024-01-09 03:18:09', 0, 8316793716015808, 0.00);
INSERT INTO `user_wallet` VALUES (8316810813899456, NULL, '[enter, security, tribe, sock, either, wear, cancel, like, mask, party, wish, net]', '0x33f5bd7cfa725fc366aa5ba24ba5f526e3391f8f0ec311b28771eda31355ab7a', '0x2fd92f796e30f0eec95acc38b18a66c3f0757e44', 'c6dee4b4d9824224571b5fb70f0b0c165f28e5be69cb2274850924bdead1986fcc30896bdb07eb2ca78727ccb1c5c1a776030efdb344d17cf321f3dbde491110', '2024-01-09 03:22:30', '2024-01-09 03:22:30', 0, 8316810811671232, 0.00);
INSERT INTO `user_wallet` VALUES (8316822606971584, NULL, '[motor, scheme, vivid, trumpet, illegal, disorder, since, august, list, movie, smoke, orange]', '0x80c3290459bf12eebf5f8781efd191c2d93bdf9d4150cd2b4d636703487fb626', '0x51cbaa0be40cf7ea57962ad792c1fea114cb253a', '68aed77716ebf17f85e2b5fb3edc71dcace3bd1298c07077c0f0bf313aae1443527a8fc3aac179ceff0ee85df27943677d9b3a053afad6fadfbd8e0aa79f2239', '2024-01-09 03:25:30', '2024-01-09 03:25:30', 0, 8316822604677824, 0.00);
INSERT INTO `user_wallet` VALUES (8316837649842880, NULL, '[melody, core, judge, parent, digital, quiz, toy, happy, palm, opera, comfort, prize]', '0x5c793ac4d581fd812d984fe7f087f31d593f4672e400a8d2372940a06837f2cd', '0xf9a00c589fa2ba53b497a32b91c8fc0a50eb46d4', '1817d72620209cc68e33ded7d655f4908698ad024b04046acf204373494bdd12257319d3b8d97239566af27ae62fe8579f983a1ad2fbcb4f3f7d8f8136e053a8', '2024-01-09 03:29:19', '2024-01-09 03:29:19', 0, 8316837647418048, 0.00);
INSERT INTO `user_wallet` VALUES (8316856102486720, NULL, '[oxygen, rain, avoid, sustain, lens, baby, stone, provide, fitness, similar, shop, exhaust]', '0xa195c3f5f7eaa0c19ff9a7a0a4e6c82e7f37f6fc96b4a6020c4a1ba0668c821c', '0x45eee2f7f28c4c0d7c8550fd8439f9675f933412', '6176091fcc40393caa06415e7aa020deac3bf73815dea746e2741cb8596593cd1d89cfb0e4c989508d4bb2bd54728f75b9fb69a3c205dc7fad09e1e30cb938ff', '2024-01-09 03:34:01', '2024-01-09 03:34:01', 0, 8316856099930816, 0.00);
INSERT INTO `user_wallet` VALUES (8319191170754496, NULL, '[improve, horror, subject, dog, dance, stage, utility, cabbage, meadow, wish, stage, rhythm]', '0x305a9ace7b41b4a2eed108168fd9c9facd8ca9b44844ba6b7d91c06c163ed9d2', '0xddf59c5e8f977086465a217f99726c41725ee877', '79e8369945045a8be1c33d02df34f38a83fd31601cd4346b3f2a332fcbad0365d5e09076cac0684e1c379da96b0d21c259434253f69a7de34d5c67bbb5857f4b', '2024-01-09 13:27:51', '2024-01-09 13:27:51', 0, 8319191122388928, 0.00);
INSERT INTO `user_wallet` VALUES (8327762934114048, NULL, '[rapid, annual, affair, project, mystery, law, prison, foot, diary, display, affair, trophy]', '0x43099bda5bf13ba078ed755b0c575d0ca5661885ffd1ab24d24cacf98b6779e8', '0xb177c5f64b8b6b1f85b510ff932d808574438685', '49151f393d19de18861687454e40aaa89c7c1d6bccf15804963b62995015e83f0ce4db1220851f70914acfdf4b9b29b46de81d2ac284ce895bc974beaec65f88', '2024-01-11 01:47:46', '2024-01-11 01:47:46', 0, 8327762295990016, 0.00);
INSERT INTO `user_wallet` VALUES (8337234514805120, NULL, '[saddle, quarter, cradle, similar, broom, rookie, solar, egg, end, ceiling, shallow, click]', '0x5d3749621d603aa516a5673d1539c6d6b35c57bd62c973389846f3a4149d5a0a', '0xe19d3ef21e15c386e9c38ac9e4e4b414232eaa4d', 'a4953241cbd16791f193e6ae5ffa392bf9402d11674ba4b1c373d25938b061dd39a938ea0e46a68e9950d21b037868ecb8da44c2aab545f36640136c411874fe', '2024-01-12 17:56:31', '2024-01-12 17:56:31', 0, 8337234471747968, 0.00);
INSERT INTO `user_wallet` VALUES (8337294353367616, NULL, '[idea, pull, beyond, trim, novel, attract, baby, skate, awake, raven, cave, fork]', '0xd3f7743a7ec02cd2ac321bb5e9de826d812bd499d6cb2da1305cb124310219e2', '0x1f44427cd4c14f90ebc3583e89dd6dae1a521330', '3f64e8c6dda6f5ac62912350fedd86e5ca58134de47ea51c3eb175e1bec386684677034405f6e0b138f1cd3c004f23cf9312d75b6a7d8ae75a747cb2eb2f58f0', '2024-01-12 18:11:44', '2024-01-12 18:11:44', 0, 8337294312997440, 0.00);
INSERT INTO `user_wallet` VALUES (8337453446988352, NULL, '[blade, pupil, viable, custom, grape, fit, poverty, palm, swing, educate, unique, tape]', '0x7782dfcf720e60aed91c4b7626182a899aee0a28fba71570e70bb439d68a2da0', '0xa7e777dfe019cd18593e4e9a44b19ea752e23afc', '3156404812872c0fe6795afff2cba2412c679747bc40a7b0c7392405fea90bcef4f426b70b13e24eac5baef785aafcf1888d764ac6719d2960e5d85de7db2493', '2024-01-12 18:52:11', '2024-01-12 18:52:11', 0, 8337453443056192, 0.00);
INSERT INTO `user_wallet` VALUES (8337492302430784, NULL, '[oxygen, margin, vibrant, else, robust, dose, erosion, answer, sad, rotate, install, insect]', '0xae03e9aa7aedb06c4eeba53f722add3353def29182cc859a008fd087bc894521', '0x235b573c987c4bdd923c4eff57822f19935335cd', 'dced8789f293af6dd2aedbb82a2050bed7361b0f153c500413c260ac481c86969fcef49b97229b635e0bacdd01092aa62000f8ec5b21614f67babbc131de7dd2', '2024-01-12 19:02:04', '2024-01-12 19:02:04', 0, 8337492298957376, 0.00);
INSERT INTO `user_wallet` VALUES (8337511403553344, NULL, '[seek, marriage, awful, city, jewel, mom, squeeze, hawk, element, home, punch, like]', '0x51e87dc0ad19dd41826c17a9529a7f980cd9db77c33b71cf35c64d1a7d347402', '0x1c136f927061cd0894c916ad7fdf45db8e4d3e9d', 'fd2095a00eef277c9bf95f1606d114b418de48c1cfc69a9907228b0f78768454d6b336c316d5501a93a79452ac282fc17233f75543059babe01931677f817662', '2024-01-12 19:06:56', '2024-01-12 19:06:56', 0, 8337511400342080, 0.00);
INSERT INTO `user_wallet` VALUES (8337527476322880, NULL, '[meat, hungry, whisper, cover, enforce, grit, monster, this, weekend, umbrella, pelican, decorate]', '0xd6ba672aa253fe1a715a4e1ae22ec257a8e111c92f4d5550ccc32e68355c34b5', '0xa6a58d88984dccbdd9adcbec1d6dc71aff266bf7', '3061f98c78ab0d81585bfab77138fae7e27e73352bdd8900b8fac7041ed9314d4e5e5d0eed2213e94f11ca0e1b3aac060b39c0d1d3323942caff6d8b563c4998', '2024-01-12 19:11:01', '2024-01-12 19:11:01', 0, 8337527473504832, 0.00);
INSERT INTO `user_wallet` VALUES (8337565904929344, NULL, '[luggage, lamp, chase, era, hybrid, modify, enlist, icon, anxiety, velvet, father, syrup]', '0xb9d15dc5e38a0b24b56de7a442c3651d0eb82a8b97f546babefdcb56dcaf9a63', '0xc0146da551254e647dba9bad31563cdddc7d9a5e', 'fdc3cd305fadb803651385f04f3d0f14f500090bd7ee5006b16f7f22aed0dd2ce796197767328f12369c1f0899c90a3b791e727bfa6d93ae2118b0fff9027236', '2024-01-12 19:20:47', '2024-01-12 19:20:47', 0, 8337565902045760, 0.00);
INSERT INTO `user_wallet` VALUES (8337588325909056, NULL, '[fault, brush, inform, slender, silver, expose, program, monkey, major, near, erase, ramp]', '0x91cfdcf894bcabb4f220c79d34ae7748e7baa83f094a4b3d1e031c9f29572001', '0xa6283a872c83727832ae6cd5c9d83bef9490619e', '431c2470f4850752aba3eb6a498d387d081b2862bc1f45e4395d8923a82df0b5652d026713e351d4de1964153608887d33bb70c9463eb208caeff32a56b6c614', '2024-01-12 19:26:30', '2024-01-12 19:26:30', 0, 8337588323025472, 0.00);
INSERT INTO `user_wallet` VALUES (8337672512275008, NULL, '[reduce, dune, dust, wagon, gentle, crane, climb, churn, clog, palace, enlist, gun]', '0x5c39fe2164bd614a6eddddad8df602539b02627d61c3dcd27a70d7560bd85d15', '0x4abb7cebb5685c6ad22ac23ccb2f87fb4cd47761', 'ed473ec24ab40bcf415db9e82797c8128cc45d0c85cfeec2fa0c1352c4a7895b640e896bdb2b4f806121e6f735e818930492ba61ca42e6ba518c836ace40de64', '2024-01-12 19:47:54', '2024-01-12 19:47:54', 0, 8337672509522496, 0.00);
INSERT INTO `user_wallet` VALUES (8337936539648576, NULL, '[alter, engage, science, section, allow, box, grief, symptom, defense, angry, tired, forward]', '0x191e38a82c509cff37a656d5802a6d2897923d031fdec421f6e5ce9bdf700540', '0xcd5561a344a33473d88b241b9423660976399708', 'df19cc4257a8322b31ba6d1c66045ba4bf9b6607e846dda7e8a300f73363eec1ce45a391783e346df78aaa492910425a0563abf5aa533682bd9c8d223745716c', '2024-01-12 20:55:03', '2024-01-12 20:55:03', 0, 8337936537223744, 0.00);
INSERT INTO `user_wallet` VALUES (8337943170318912, NULL, '[eyebrow, mimic, neck, current, puzzle, mass, month, essence, decide, swear, congress, hip]', '0x74829e97c9861104bfb5911b48eeacc29119d2adc06b652e364a29fd9b35c69e', '0x5b4a18c05b6919e1e8455d7347f007e7727f6f48', '1c43cbd532b5bd460e8703cad863a6558f0d04f06ba4230bd954d60f3c17d1adcf4b5bfb34284e6da6e7d58604090bad483f0e6a1055c5d2a038ef57facb0fcd', '2024-01-12 20:56:44', '2024-01-12 20:56:44', 0, 8337943167631936, 0.00);
INSERT INTO `user_wallet` VALUES (8337966579319360, NULL, '[reopen, museum, hurt, input, roast, festival, filter, crawl, knock, wealth, mixture, gym]', '0xc199d860c7858bb99674d0a17f9668ba7985202750e8963d36179617a71c198b', '0x05a5d9cfa3958c17fcbdf48585022b940d11a595', '4e6598ae01f003833d8ea6e34aeb4d8f15b79516b81c64dd78b27caeb8aedf1d97b7c83c28ac9781ae7cbc80c0ea0bd0e36b61a226263edada985ad79b344861', '2024-01-12 21:02:41', '2024-01-12 21:02:41', 0, 8337966576828992, 0.00);
INSERT INTO `user_wallet` VALUES (8337976276156992, NULL, '[apology, whip, evil, physical, wheat, erosion, quarter, blue, boost, best, chat, adapt]', '0xd832b68d23f54f37f978a67c3543d705a6a64512eacae2d01b342da0ad96bafe', '0x9cdd71bb241408095e6cede6c30e9ce08de56263', '891338554f3cf590ab2fc24bcb480bf0bde4714b03defd85c0c0643042c51574a7f38e1b378e13354571f0ecd3363c2855a72105e96fc66c1facbd0bb8dbf794', '2024-01-12 21:05:09', '2024-01-12 21:05:09', 0, 8337976273404480, 0.00);
INSERT INTO `user_wallet` VALUES (8337984370442688, NULL, '[ring, access, parrot, razor, theme, airport, oyster, elbow, power, fix, life, give]', '0x5d6d51503840bc1a66073c113556273b20f0625c7f19a4771ccd2c3a7f7bc835', '0x5d65e1b82da76521dc40180a0f59e7048a18b8c9', 'ce9f04ec956f8b2ffef5e93666c54e71877a82eb07ad4675868fad745f5fdc8794279c3a81c90ba2c6a186a4a3a19ee68a35b5bdc1f42dc7dcc027ff627ee1bd', '2024-01-12 21:07:13', '2024-01-12 21:07:13', 0, 8337984330596800, 0.00);
INSERT INTO `user_wallet` VALUES (8342705362502336, NULL, '[labor, wing, mistake, output, basket, vote, divide, spray, click, siren, cattle, mercy]', '0x82b6713c63676110e563b3d07128e26552f0b7a115aeb7a48c58417938650883', '0xfa0610dde27cf63aba05588b308dd2d5edc00bb6', 'd0bda96f4b0affd4472b2832a18767e3c30d91c4083cbe85b631a04d0f76e00a863e4437543c1e0ed5a77fc0d01dcf4e05a158eb187621f3d35a0d5bccc408a5', '2024-01-13 17:07:49', '2024-01-13 17:07:49', 0, 8342705322001088, 0.00);
INSERT INTO `user_wallet` VALUES (8342723138683584, NULL, '[shove, better, hair, success, dizzy, test, head, gesture, orbit, arctic, path, wrap]', '0xf43e9efed2a1d063e28d2340629a994680d95fa91fa36d6e3e258a7c4232644c', '0x97bda29e3e6b137ceb1674bfaefa0bacb412f219', 'a03e966867911688af9bc7ce741b6aac0f7979893b25409d510fee0e5713290e3b6457c65cb4bc7daae759c09e418d518c2c7d5408e625ce4e3b9858564825ae', '2024-01-13 17:12:21', '2024-01-13 17:12:21', 0, 8342723133244096, 0.00);
INSERT INTO `user_wallet` VALUES (8342729771778752, NULL, '[glass, cinnamon, crew, sentence, health, history, empower, fly, canoe, train, valid, village]', '0xf4ff79c9306077a499dc1fddd5ba34cb49923d4b381e670c87301d9f574b75b', '0x9771d2a461c62f103531a1bfa0fc58061c1596bc', '8c0454bc78614c3ccb92e6d039e6b546bd4625982946b18c810a1d1422e27e1fc2964190f2b70afb060f34f1fe66a53650613ebea029a23c329c85fcb54c4327', '2024-01-13 17:14:02', '2024-01-13 17:14:02', 0, 8342729767715520, 0.00);
INSERT INTO `user_wallet` VALUES (8342736705422016, NULL, '[silver, solid, profit, run, average, summer, quiz, side, outside, foam, ginger, mango]', '0xebfc1ae5af8055a238f7952833a3e8a3b153f7f1470ef9735a2da21dde3467d8', '0xd692f44bc6c271dcb6b3a694b1fc34f33d526ffc', '2733531694244e59d106e9cf476f29a4721a5f53d27fa842874dad3ae1ac0e3b08041f6b422fef7b5f233c97622f43d984d71565bb34e33d83f71cced2c4653b', '2024-01-13 17:15:48', '2024-01-13 17:15:48', 0, 8342736702014144, 0.00);
INSERT INTO `user_wallet` VALUES (8342743201153728, NULL, '[atom, tenant, sea, club, loyal, car, include, boil, slam, pear, novel, system]', '0xcffed17d85e7b4cc48bb4a55e6d3c48c5ab9a1c1d5cdc2b40681d87138f9608c', '0x0135881caa083dc202e3e5960dfd3152cdff77f7', '39704b04019e748a032434362c7a1f56e798a0f00a58961ab2f84fa6dfac5ba3818d9793a67945322126efaf7805725d03a6e8d2e1b20e3aa88e63d1bb4a5cb', '2024-01-13 17:17:27', '2024-01-13 17:17:27', 0, 8342743198663360, 0.00);
INSERT INTO `user_wallet` VALUES (8342754824094400, NULL, '[age, check, kingdom, caught, upgrade, plug, liquid, tool, credit, apology, century, bless]', '0x3ee94e9905c9b0b08ba71292b2dd25c1c54c5d4f794adb4494dc48e19806f032', '0x8b6dadea4d72a15b5421f5ac5f6a8390403a0112', '89d85e7a2bfaab99a17de79fff2e0440922900468c0a081b4a669e4cce06c4fb344cdda4c456fdca075279b15763bb77e8b6bbbc85462f4426906b6cdffb31f3', '2024-01-13 17:20:24', '2024-01-13 17:20:24', 0, 8342754820358848, 0.00);
INSERT INTO `user_wallet` VALUES (8342761420817088, NULL, '[tennis, pupil, basic, black, keen, actress, powder, shoulder, wool, turkey, fly, anxiety]', '0x438b9ece609682694c1dc2a03dae1cded59b9063a77cb434cd02be6811acc692', '0x280ec7487acd77822cb090f444e2693093f1bdc1', '801a672ff79fc9e98f3d32e4ba9f4a6cc4872f43683e7fdacf62d1b1b21e1b6e9948584f28d959021aad40e80e4e61438a7fd49d6c5c0d93526b696aec83e630', '2024-01-13 17:22:05', '2024-01-13 17:22:05', 0, 8342761418261184, 0.00);
INSERT INTO `user_wallet` VALUES (8342778197705408, NULL, '[early, salon, soul, keen, flag, inherit, bachelor, sand, trim, balance, amateur, embody]', '0x695a149b0201cc16644e60b16845f7c0794e33696644921ec85acdc9d090e5df', '0x13a4e6d1e1dfc0f67a320e3774b1985ed85b4c1d', 'e906c2585a474060121278639f5f3217bd38e07deb1d76f5c37827aed265fd87c67a478d2e6cb5e93cdb049f40cc432a1fd2823b5533aa2193a41ecdc78f0dcf', '2024-01-13 17:26:21', '2024-01-13 17:26:21', 0, 8342778194035392, 0.00);
INSERT INTO `user_wallet` VALUES (8342796509643456, NULL, '[alter, material, moment, effort, worry, survey, round, salute, sick, priority, earn, entry]', '0x7f11fa88e8ff00852e08ca438618dc13419d0bf05ed02a1d1a69177edafd98e3', '0x4d27416504e16399fd2b7b0b771c81edac3df059', '4e8eea3a569f516556f456dda0c3fdd578efaf427c93e6d425f9415e3a74ba998df6135b2caa18253e412355750121d2bc0b8e818d4ea3865337f341165a2b9', '2024-01-13 17:31:00', '2024-01-13 17:31:00', 0, 8342796507022016, 0.00);
INSERT INTO `user_wallet` VALUES (8342808318051008, NULL, '[project, jump, stuff, hunt, manual, lens, spell, brief, van, decide, father, road]', '0x132e4c74de45c6675cb56a5ee5a0cd67211012548ecc6cc8f5b9eb8b58e86f10', '0xa6edcd634c5e9d556ea80a67aa8be15faa0692e0', '1806033bfbb790b1653f5a9aa6c586f0129ba925792883d17e723f2bdc1c707a992a97bf5b1bc1b5893fa6c976973e8eb0e76e545911d5332fc65e44657bf962', '2024-01-13 17:34:00', '2024-01-13 17:34:00', 0, 8342808315560640, 0.00);
INSERT INTO `user_wallet` VALUES (8342820769432256, NULL, '[impose, steak, garage, fly, riot, talent, tide, scissors, sell, renew, hybrid, sample]', '0xe94ac7ec3ed845e3490f86439ee31d040eba7ddc47f4331a838d1ea82aa0e53f', '0xdb29e90ad7f9fd311fd8277112c7278794929c94', '3e238712a82f3268252fc8380adea0d3bc75e3f0ded1d755c3f204766262f62df81883962a0543db053c9b34e4f56efe97fad02bbf778fef6f0bb4a7b70ce2ea', '2024-01-13 17:37:10', '2024-01-13 17:37:10', 0, 8342820766810816, 0.00);
INSERT INTO `user_wallet` VALUES (8342836243202752, NULL, '[valley, invite, trim, liar, invite, orient, pledge, trophy, amount, video, boy, insect]', '0xaee42aa4a1f4ee7ec790eaea0833862d51ba1d43a347d43a988a87e77354fb2', '0xcf21ab6919a3b7484b13659bf9f265edfc8b120b', '1ecc2c5da81de53948647eb6b18229a17103cf98c08d30bd950cdb86ecf98d8d43cb7884e52a8ffeb9b5af05f3fb5c0f402e5d93e3ee69a0fecb99cabc6e3a86', '2024-01-13 17:41:06', '2024-01-13 17:41:06', 0, 8342836240777920, 0.00);
INSERT INTO `user_wallet` VALUES (8342846665065152, NULL, '[reflect, edge, virtual, stairs, slogan, gadget, turkey, claw, click, glow, damp, cruel]', '0xebadd0ac13b9a66fe1ecc6cddabce559a7b7f98e468901b8249cbd75e6d4c6c9', '0xe5bc8d194d48722413698e36598fe8ba9b9a1be4', '3fb0925ee3d1b936f58850d01d0c43630686f4c79af1af08234d918666f23d58776046abe0879652f8a3396197c63e0366cffe0091bb006ddfd1866c5703c443', '2024-01-13 17:43:45', '2024-01-13 17:43:45', 0, 8342846662640320, 0.00);
INSERT INTO `user_wallet` VALUES (8342854746440384, NULL, '[swarm, season, rail, allow, hurry, lock, digital, dignity, shove, stay, hub, monitor]', '0xa9fe8fbc755e61fe917dff6ea1417612c9b76b2f5f4b465818e60ddd706c1133', '0x05cbdc5e494d9c686756c362ed7cf6c29a3a0911', '37b9e671b9a86d348aeee2cce135826584f688e38d4d8bdc0d4757b752ed2769b7b6ca649898d3cc4016479539d79d9157fa6de86298103c97d711dfefdc8fd9', '2024-01-13 17:45:49', '2024-01-13 17:45:49', 0, 8342854744146624, 0.00);
INSERT INTO `user_wallet` VALUES (8342864830464704, NULL, '[chicken, brand, frozen, sweet, say, lazy, decline, curve, scatter, hundred, mixed, sudden]', '0x93cfe634e7a5f262d84f2b378702a46214794534bb3712e5f3f2837ab8c824e3', '0x0b731327e78a029fc4a601233e932f5fe7c11d0c', 'c95a310af70f64f6331f42d923120c53c1ec4448a67217694fb9abdbc466ade2582d749065618bfbc88010c81247f428d695d5e7331090a312034d4eb2351227', '2024-01-13 17:48:23', '2024-01-13 17:48:23', 0, 8342864827908800, 0.00);
INSERT INTO `user_wallet` VALUES (8342874671547072, NULL, '[earn, danger, volume, scale, between, oblige, fancy, select, blur, auto, opinion, school]', '0xc9776da50c9d21700c7b6e6aac485f51b497a03564b9f604e04913e56731fc48', '0x31c721c06c2da1444701b80b62c2ac56bda5c307', 'b72374920f9e037117a3086508d3ed7f2999ed72a689430ace4002ff0a3e2ce7b20aa83fcddac21ee2b75651a1c4fe621694283fd9b888eea8b151edac6861c0', '2024-01-13 17:50:53', '2024-01-13 17:50:53', 0, 8342874669187776, 0.00);
INSERT INTO `user_wallet` VALUES (8342884514857664, NULL, '[mass, female, deputy, paddle, artwork, plate, case, since, feed, eight, unfold, client]', '0x1f747af40acad7ac6d73d6fbcb3d6cf9816c28be82625490c049bb02acae527e', '0x735793a1bbc667fe56aebb1651c5266382bc06aa', 'cc19c70f4189d2fbc6e0ac3354f06a5446c1fed546b4835e398a600ce4f4905fb9f5af617c9aa916de19265d8fd41c88feb35d3656bd8752eafdd638377f4b81', '2024-01-13 17:53:23', '2024-01-13 17:53:23', 0, 8342884512301760, 0.00);

-- ----------------------------
-- Table structure for withdraw_record
-- ----------------------------
DROP TABLE IF EXISTS `withdraw_record`;
CREATE TABLE `withdraw_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `network` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `amount` decimal(64, 2) NULL DEFAULT NULL,
  `real_amount` decimal(64, 2) NULL DEFAULT NULL,
  `fee` decimal(64, 2) NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` int NULL DEFAULT 0,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of withdraw_record
-- ----------------------------
INSERT INTO `withdraw_record` VALUES (1, 'BEP20', '0xCe229dbC19A03CB664534ff69121203e44799863', 10.00, 9.00, 1.00, 1, '2023-12-30 17:40:01', NULL, 0, 8217866366560064);

SET FOREIGN_KEY_CHECKS = 1;
