/*
 Navicat Premium Data Transfer

 Source Server         : dd
 Source Server Type    : MySQL
 Source Server Version : 50561
 Source Host           : localhost:3306
 Source Schema         : qingjia

 Target Server Type    : MySQL
 Target Server Version : 50561
 File Encoding         : 65001

 Date: 04/05/2021 15:50:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add dept', 7, 'add_dept');
INSERT INTO `auth_permission` VALUES (20, 'Can change dept', 7, 'change_dept');
INSERT INTO `auth_permission` VALUES (21, 'Can delete dept', 7, 'delete_dept');
INSERT INTO `auth_permission` VALUES (22, 'Can add emp', 8, 'add_emp');
INSERT INTO `auth_permission` VALUES (23, 'Can change emp', 8, 'change_emp');
INSERT INTO `auth_permission` VALUES (24, 'Can delete emp', 8, 'delete_emp');
INSERT INTO `auth_permission` VALUES (25, 'Can add qj', 9, 'add_qj');
INSERT INTO `auth_permission` VALUES (26, 'Can change qj', 9, 'change_qj');
INSERT INTO `auth_permission` VALUES (27, 'Can delete qj', 9, 'delete_qj');
INSERT INTO `auth_permission` VALUES (28, 'Can add shenpi', 10, 'add_shenpi');
INSERT INTO `auth_permission` VALUES (29, 'Can change shenpi', 10, 'change_shenpi');
INSERT INTO `auth_permission` VALUES (30, 'Can delete shenpi', 10, 'delete_shenpi');
INSERT INTO `auth_permission` VALUES (31, 'Can add yuanyin', 11, 'add_yuanyin');
INSERT INTO `auth_permission` VALUES (32, 'Can change yuanyin', 11, 'change_yuanyin');
INSERT INTO `auth_permission` VALUES (33, 'Can delete yuanyin', 11, 'delete_yuanyin');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'student', 'dept');
INSERT INTO `django_content_type` VALUES (8, 'student', 'emp');
INSERT INTO `django_content_type` VALUES (9, 'student', 'qj');
INSERT INTO `django_content_type` VALUES (10, 'student', 'shenpi');
INSERT INTO `django_content_type` VALUES (11, 'student', 'yuanyin');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-05-03 08:01:08');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2021-05-03 08:01:08');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0009_alter_user_last_name_max_length', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (14, 'sessions', '0001_initial', '2021-05-03 08:01:09');
INSERT INTO `django_migrations` VALUES (15, 'student', '0001_initial', '2021-05-03 08:01:10');
INSERT INTO `django_migrations` VALUES (16, 'student', '0002_auto_20210503_1559', '2021-05-03 08:01:10');
INSERT INTO `django_migrations` VALUES (17, 'student', '0003_auto_20210503_2112', '2021-05-03 13:12:34');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('higwz0d1ot1unscrdzw9oa10l66vclt4', 'NzQ2YTc0MDBlZTMwMTU1ZGQzNWViZWNhYWJlYTQyY2NjMzk5OWIzOTp7Im5hbWUiOiJcdTUxNDlcdTU5MzRcdTVmM2EiLCJpZCI6MX0=', '2021-05-18 03:51:09');

-- ----------------------------
-- Table structure for student_dept
-- ----------------------------
DROP TABLE IF EXISTS `student_dept`;
CREATE TABLE `student_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dpwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_dept
-- ----------------------------
INSERT INTO `student_dept` VALUES (1, '李老板', '123');
INSERT INTO `student_dept` VALUES (2, '狄仁杰', '123');

-- ----------------------------
-- Table structure for student_emp
-- ----------------------------
DROP TABLE IF EXISTS `student_emp`;
CREATE TABLE `student_emp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `epwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `did_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_emp_did_id_0852f78e_fk_student_dept_id`(`did_id`) USING BTREE,
  CONSTRAINT `student_emp_did_id_0852f78e_fk_student_dept_id` FOREIGN KEY (`did_id`) REFERENCES `student_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_emp
-- ----------------------------
INSERT INTO `student_emp` VALUES (1, '光头强', '123', '伐木工', 1);
INSERT INTO `student_emp` VALUES (2, '二狗', '123', '跑腿的', 1);
INSERT INTO `student_emp` VALUES (3, '李元芳', '123', '召唤师', 2);

-- ----------------------------
-- Table structure for student_qj
-- ----------------------------
DROP TABLE IF EXISTS `student_qj`;
CREATE TABLE `student_qj`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `statime` date NOT NULL,
  `endtime` date NOT NULL,
  `time` date NOT NULL,
  `eid_id` int(11) NOT NULL,
  `yid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_qj_eid_id_2f0fe828_fk_student_emp_id`(`eid_id`) USING BTREE,
  INDEX `student_qj_yid_id_9e92a202_fk_student_yuanyin_id`(`yid_id`) USING BTREE,
  CONSTRAINT `student_qj_eid_id_2f0fe828_fk_student_emp_id` FOREIGN KEY (`eid_id`) REFERENCES `student_emp` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `student_qj_yid_id_9e92a202_fk_student_yuanyin_id` FOREIGN KEY (`yid_id`) REFERENCES `student_yuanyin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_qj
-- ----------------------------
INSERT INTO `student_qj` VALUES (8, '        大谁谁谁大声的萨基还', '2021-05-01', '2021-05-01', '2021-05-03', 3, 1);
INSERT INTO `student_qj` VALUES (9, '        2021-05-01', '2021-05-01', '2021-05-01', '2021-05-04', 1, 1);
INSERT INTO `student_qj` VALUES (10, '        2021-05-01d', '2021-05-01', '2021-05-01', '2021-05-04', 1, 1);
INSERT INTO `student_qj` VALUES (11, '        dd', '2021-05-01', '2021-05-01', '2021-05-04', 1, 1);
INSERT INTO `student_qj` VALUES (12, '        fdf', '2021-05-01', '2021-05-01', '2021-05-04', 1, 1);
INSERT INTO `student_qj` VALUES (13, '        cc', '2021-05-01', '2021-05-01', '2021-05-04', 1, 1);
INSERT INTO `student_qj` VALUES (14, '        2021-05-01ddsds', '2021-05-01', '2021-05-01', '2021-05-04', 1, 1);
INSERT INTO `student_qj` VALUES (15, '        222', '2021-05-01', '2021-05-01', '2021-05-04', 1, 1);
INSERT INTO `student_qj` VALUES (16, '        222', '2021-05-01', '2021-05-01', '2021-05-04', 1, 1);
INSERT INTO `student_qj` VALUES (17, '        222', '2021-05-01', '2021-05-01', '2021-05-04', 1, 1);
INSERT INTO `student_qj` VALUES (18, '        v', '2021-05-01', '2021-05-01', '2021-05-04', 1, 1);
INSERT INTO `student_qj` VALUES (19, '        g', '2021-05-01', '2021-05-01', '2021-05-04', 1, 1);

-- ----------------------------
-- Table structure for student_shenpi
-- ----------------------------
DROP TABLE IF EXISTS `student_shenpi`;
CREATE TABLE `student_shenpi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sys` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `yes_ok` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `say` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `qid_id`(`qid_id`) USING BTREE,
  CONSTRAINT `student_shenpi_qid_id_8dce74f8_fk_student_qj_id` FOREIGN KEY (`qid_id`) REFERENCES `student_qj` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_shenpi
-- ----------------------------
INSERT INTO `student_shenpi` VALUES (8, '2021-05-03', '已归档', '不同意', '        乖乖的', 8);
INSERT INTO `student_shenpi` VALUES (9, '', '审核中', '', NULL, 9);
INSERT INTO `student_shenpi` VALUES (10, '', '审核中', '', NULL, 10);
INSERT INTO `student_shenpi` VALUES (11, '', '审核中', '', NULL, 11);
INSERT INTO `student_shenpi` VALUES (12, '', '审核中', '', NULL, 12);
INSERT INTO `student_shenpi` VALUES (13, '', '审核中', '', NULL, 13);
INSERT INTO `student_shenpi` VALUES (14, '', '审核中', '', NULL, 14);
INSERT INTO `student_shenpi` VALUES (15, '', '审核中', '', NULL, 15);
INSERT INTO `student_shenpi` VALUES (16, '', '审核中', '', NULL, 16);
INSERT INTO `student_shenpi` VALUES (17, '', '审核中', '', NULL, 17);
INSERT INTO `student_shenpi` VALUES (18, '', '审核中', '', NULL, 18);
INSERT INTO `student_shenpi` VALUES (19, '2021-05-04', '已归档', '同意', '        ', 19);

-- ----------------------------
-- Table structure for student_yuanyin
-- ----------------------------
DROP TABLE IF EXISTS `student_yuanyin`;
CREATE TABLE `student_yuanyin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_yuanyin
-- ----------------------------
INSERT INTO `student_yuanyin` VALUES (1, '病假');
INSERT INTO `student_yuanyin` VALUES (2, '事假');
INSERT INTO `student_yuanyin` VALUES (3, '产假');

SET FOREIGN_KEY_CHECKS = 1;
