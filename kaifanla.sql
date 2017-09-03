SET NAMES 'utf8';
DROP DATABASE IF EXISTS jiazaibeijing;
CREATE DATABASE kaifanla CHARSET=UTF8;
USE kaifanla;

CREATE TABLE kf_dish(
    did INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64),
    price FLOAT(6,2),
    img_sm VARCHAR(64),
    img_lg VARCHAR(64),
    detail VARCHAR(2048),
    material VARCHAR(2048)
);
INSERT INTO kf_dish(did,img_sm,img_lg,name,price,material,detail) VALUES
(   null,
    'webwxgetmsgimg (3).jpg',
    'webwxgetmsgimg (3).jpg',
    '【怒吼羊驼】',
    1,
    '我都一个月大了，不像小孩子一样',
    '我都一个月大了，不像小孩子一样'
),
(   null,
    'webwxgetmsgimg (4).jpg',
    'webwxgetmsgimg (4).jpg',
    '【努力抬头看世界】',
    1,
    '用力地抬起头，看看爸爸妈妈',
    '用力地抬起头，看看爸爸妈妈'
),
(   null,
    'webwxgetmsgimg (5).jpg',
    'webwxgetmsgimg (5).jpg',
    '【安全驾驶】',
    2,
    '遵守交通规则，安全驾驶',
    '遵守交通规则，安全驾驶'
),
(   null,
    'webwxgetmsgimg (6).jpg',
    'webwxgetmsgimg (6).jpg',
    '【口袋饼睡姿】',
    2,
    '看我口袋饼睡姿',
    '看我口袋饼睡姿'
),
(   null,
    'webwxgetmsgimg (7).jpg',
    'webwxgetmsgimg (7).jpg',
    '【闯帝都】',
    3,
    '三个月大了，来帝都闯荡下',
    '三个月大了，来帝都闯荡下'
),
(   null,
    'webwxgetmsgimg (8).jpg',
    'webwxgetmsgimg (8).jpg',
    '【全家福】',
    3,
    '和爸爸妈妈的合影',
    '吧看我这霸气的姿势，就知道谁是家里老大了'
),
(   null,
    'webwxgetmsgimg (9).jpg',
    'webwxgetmsgimg (9).jpg',
    '【小小脚丫】',
    1.5,
    '看我了爱的小脚丫',
    '看我了爱的小脚丫'
),
(   null,
    'webwxgetmsgimg (10).jpg',
    'webwxgetmsgimg (10).jpg',
    '【看我和爸爸是否神似】',
    0.4,
    '和爸爸更像一些吧',
    '和爸爸更像一些吧'
);

##SELECT * FROM kf_dish;

CREATE TABLE kf_order(
    oid INT PRIMARY KEY AUTO_INCREMENT,
    phone VARCHAR(16),
    user_name VARCHAR(16),
    sex INT,    /*1:男  2:女*/
    order_time LONG,
    addr VARCHAR(256),
    did INT
);
INSERT INTO kf_order(oid, phone,user_name,sex,order_time,addr,did) VALUES
(NULL,'13501234567','婷婷',2,1445154859209,'大钟寺中鼎B座',3),
(NULL,'13501234567','婷婷',2,1445254959209,'大钟寺中鼎B座',2),
(NULL,'13501234567','婷婷',2,1445354959209,'大钟寺中鼎B座',5);

##SELECT * FROM kf_order;